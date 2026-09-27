//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/VFX/ScreenEffect_RadialBlur" {
Properties {

_MaskTex ("Alpha (R)", 2D) = "white" { }

_FresAlphaVector ("_FresAlphaVector", Vector) = (1,0.01,1,0)

_MaskVector ("MaskVector", Vector) = (0,1,0,1)

[Header(RadialBlur)] _BlurVector ("BlurVector", Vector) = (0.5,0.5,0.01,8)

_BlurMaskVector ("BlurVector", Vector) = (0,0.1,0,8)

[Space(10)] [Enum(UnityEngine.Rendering.CullMode)] _CullMode ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 4.0

[Space(10)] _StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 GrabPass {
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 29655
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
in mediump vec4 in_COLOR0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat1.zw;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MaskTex_ST;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	mediump vec4 _BlurVector;
uniform 	mediump vec2 _BlurMaskVector;
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
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
int u_xlati6;
mediump vec2 u_xlat16_7;
float u_xlat10;
vec2 u_xlat11;
bool u_xlatb11;
float u_xlat15;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.yz = u_xlat0.yz + (-_BlurVector.xy);
    u_xlat15 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat15 * u_xlat1.y;
    u_xlat15 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + (-_BlurMaskVector.x);
    u_xlat15 = u_xlat15 / _BlurMaskVector.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlati1 = int(_BlurVector.w);
    u_xlati1 = max(u_xlati1, 2);
    u_xlati1 = min(u_xlati1, 12);
    u_xlat16_2.x = float(u_xlati1);
    u_xlat16_7.x = _BlurVector.z / u_xlat16_2.x;
    u_xlat16_7.xy = u_xlat1.yz * u_xlat16_7.xx;
    u_xlat16_3.x = float(0.0);
    u_xlat16_3.y = float(0.0);
    u_xlat16_3.z = float(0.0);
    u_xlati6 = 0;
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlati6>=u_xlati1);
#else
        u_xlatb11 = u_xlati6>=u_xlati1;
#endif
        if(u_xlatb11){break;}
        u_xlat11.x = float(u_xlati6);
        u_xlat11.xy = u_xlat11.xx * u_xlat16_7.xy;
        u_xlat11.xy = (-u_xlat11.xy) * vec2(u_xlat15) + u_xlat0.yz;
        u_xlat16_4.xyz = texture(_GrabTexture, u_xlat11.xy).xyz;
        u_xlat3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
        u_xlati6 = u_xlati6 + 1;
        u_xlat16_3.xyz = u_xlat3.xyz;
    }
    u_xlat16_2.xyz = u_xlat16_3.xyz / u_xlat16_2.xxx;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _MaskVector.xzxx).xy;
    u_xlat5.x = u_xlat0.y + -0.5;
    u_xlat5.x = u_xlat5.x * _ScreenParams.x;
    u_xlat5.x = u_xlat5.x / _ScreenParams.y;
    u_xlat0.x = u_xlat5.x + 0.5;
    u_xlat16_2.xy = (u_xlatb1.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * _MaskVector.yy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_2.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0 = texture(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
    u_xlat16_2.x = dot(u_xlat5.xyz, vs_TEXCOORD2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_FresAlphaVector.w);
#else
    u_xlatb5 = 0.5<_FresAlphaVector.w;
#endif
    u_xlat16_7.x = -abs(u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = (u_xlatb5) ? abs(u_xlat16_2.x) : u_xlat16_7.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat5.x = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat5.x = u_xlat16_2.x / u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat10 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat10;
    u_xlat16_2.x = min(u_xlat5.x, 1.0);
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    SV_Target0.w = (u_xlatb1.y) ? u_xlat16_2.x : u_xlat0.x;
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
in mediump vec4 in_COLOR0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat1.zw;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MaskTex_ST;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	mediump vec4 _BlurVector;
uniform 	mediump vec2 _BlurMaskVector;
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
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
int u_xlati6;
mediump vec2 u_xlat16_7;
float u_xlat10;
vec2 u_xlat11;
bool u_xlatb11;
float u_xlat15;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.yz = u_xlat0.yz + (-_BlurVector.xy);
    u_xlat15 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat15 * u_xlat1.y;
    u_xlat15 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + (-_BlurMaskVector.x);
    u_xlat15 = u_xlat15 / _BlurMaskVector.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlati1 = int(_BlurVector.w);
    u_xlati1 = max(u_xlati1, 2);
    u_xlati1 = min(u_xlati1, 12);
    u_xlat16_2.x = float(u_xlati1);
    u_xlat16_7.x = _BlurVector.z / u_xlat16_2.x;
    u_xlat16_7.xy = u_xlat1.yz * u_xlat16_7.xx;
    u_xlat16_3.x = float(0.0);
    u_xlat16_3.y = float(0.0);
    u_xlat16_3.z = float(0.0);
    u_xlati6 = 0;
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlati6>=u_xlati1);
#else
        u_xlatb11 = u_xlati6>=u_xlati1;
#endif
        if(u_xlatb11){break;}
        u_xlat11.x = float(u_xlati6);
        u_xlat11.xy = u_xlat11.xx * u_xlat16_7.xy;
        u_xlat11.xy = (-u_xlat11.xy) * vec2(u_xlat15) + u_xlat0.yz;
        u_xlat16_4.xyz = texture(_GrabTexture, u_xlat11.xy).xyz;
        u_xlat3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
        u_xlati6 = u_xlati6 + 1;
        u_xlat16_3.xyz = u_xlat3.xyz;
    }
    u_xlat16_2.xyz = u_xlat16_3.xyz / u_xlat16_2.xxx;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _MaskVector.xzxx).xy;
    u_xlat5.x = u_xlat0.y + -0.5;
    u_xlat5.x = u_xlat5.x * _ScreenParams.x;
    u_xlat5.x = u_xlat5.x / _ScreenParams.y;
    u_xlat0.x = u_xlat5.x + 0.5;
    u_xlat16_2.xy = (u_xlatb1.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * _MaskVector.yy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_2.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0 = texture(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
    u_xlat16_2.x = dot(u_xlat5.xyz, vs_TEXCOORD2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_FresAlphaVector.w);
#else
    u_xlatb5 = 0.5<_FresAlphaVector.w;
#endif
    u_xlat16_7.x = -abs(u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = (u_xlatb5) ? abs(u_xlat16_2.x) : u_xlat16_7.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat5.x = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat5.x = u_xlat16_2.x / u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat10 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat10;
    u_xlat16_2.x = min(u_xlat5.x, 1.0);
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    SV_Target0.w = (u_xlatb1.y) ? u_xlat16_2.x : u_xlat0.x;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat1.zw;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _MaskTex_ST;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	mediump vec4 _BlurVector;
uniform 	mediump vec2 _BlurMaskVector;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _MaskTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
int u_xlati1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
bool u_xlatb5;
int u_xlati6;
mediump vec2 u_xlat16_7;
float u_xlat10;
vec2 u_xlat11;
bool u_xlatb11;
float u_xlat15;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.yz = u_xlat0.yz + (-_BlurVector.xy);
    u_xlat15 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat15 * u_xlat1.y;
    u_xlat15 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + (-_BlurMaskVector.x);
    u_xlat15 = u_xlat15 / _BlurMaskVector.y;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlati1 = int(_BlurVector.w);
    u_xlati1 = int(max(float(u_xlati1), 2.80259693e-45));
    u_xlati1 = int(min(float(u_xlati1), 1.68155816e-44));
    u_xlat16_2.x = float(u_xlati1);
    u_xlat16_7.x = _BlurVector.z / u_xlat16_2.x;
    u_xlat16_7.xy = u_xlat1.yz * u_xlat16_7.xx;
    u_xlat16_3.x = float(0.0);
    u_xlat16_3.y = float(0.0);
    u_xlat16_3.z = float(0.0);
    u_xlati6 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb11 = u_xlati6>=u_xlati1;
        if(u_xlatb11){break;}
        u_xlat11.x = float(u_xlati6);
        u_xlat11.xy = u_xlat11.xx * u_xlat16_7.xy;
        u_xlat11.xy = (-u_xlat11.xy) * vec2(u_xlat15) + u_xlat0.yz;
        u_xlat10_4.xyz = texture2D(_GrabTexture, u_xlat11.xy).xyz;
        u_xlat3.xyz = u_xlat16_3.xyz + u_xlat10_4.xyz;
        u_xlati6 = u_xlati6 + 1;
        u_xlat16_3.xyz = u_xlat3.xyz;
    }
    u_xlat16_2.xyz = u_xlat16_3.xyz / u_xlat16_2.xxx;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _MaskVector.xzxx).xy;
    u_xlat5.x = u_xlat0.y + -0.5;
    u_xlat5.x = u_xlat5.x * _ScreenParams.x;
    u_xlat5.x = u_xlat5.x / _ScreenParams.y;
    u_xlat0.x = u_xlat5.x + 0.5;
    u_xlat16_2.xy = (u_xlatb1.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * _MaskVector.yy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_2.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0 = texture2D(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
    u_xlat16_2.x = dot(u_xlat5.xyz, vs_TEXCOORD2.xyz);
    u_xlatb5 = 0.5<_FresAlphaVector.w;
    u_xlat16_7.x = -abs(u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = (u_xlatb5) ? abs(u_xlat16_2.x) : u_xlat16_7.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat5.x = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat5.x = u_xlat16_2.x / u_xlat5.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat10 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat10;
    u_xlat16_2.x = min(u_xlat5.x, 1.0);
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    SV_Target0.w = (u_xlatb1.y) ? u_xlat16_2.x : u_xlat0.x;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat1.zw;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _MaskTex_ST;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	mediump vec4 _BlurVector;
uniform 	mediump vec2 _BlurMaskVector;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _MaskTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
int u_xlati1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
bool u_xlatb5;
int u_xlati6;
mediump vec2 u_xlat16_7;
float u_xlat10;
vec2 u_xlat11;
bool u_xlatb11;
float u_xlat15;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.yz = u_xlat0.yz + (-_BlurVector.xy);
    u_xlat15 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat15 * u_xlat1.y;
    u_xlat15 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 + (-_BlurMaskVector.x);
    u_xlat15 = u_xlat15 / _BlurMaskVector.y;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlati1 = int(_BlurVector.w);
    u_xlati1 = int(max(float(u_xlati1), 2.80259693e-45));
    u_xlati1 = int(min(float(u_xlati1), 1.68155816e-44));
    u_xlat16_2.x = float(u_xlati1);
    u_xlat16_7.x = _BlurVector.z / u_xlat16_2.x;
    u_xlat16_7.xy = u_xlat1.yz * u_xlat16_7.xx;
    u_xlat16_3.x = float(0.0);
    u_xlat16_3.y = float(0.0);
    u_xlat16_3.z = float(0.0);
    u_xlati6 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb11 = u_xlati6>=u_xlati1;
        if(u_xlatb11){break;}
        u_xlat11.x = float(u_xlati6);
        u_xlat11.xy = u_xlat11.xx * u_xlat16_7.xy;
        u_xlat11.xy = (-u_xlat11.xy) * vec2(u_xlat15) + u_xlat0.yz;
        u_xlat10_4.xyz = texture2D(_GrabTexture, u_xlat11.xy).xyz;
        u_xlat3.xyz = u_xlat16_3.xyz + u_xlat10_4.xyz;
        u_xlati6 = u_xlati6 + 1;
        u_xlat16_3.xyz = u_xlat3.xyz;
    }
    u_xlat16_2.xyz = u_xlat16_3.xyz / u_xlat16_2.xxx;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _MaskVector.xzxx).xy;
    u_xlat5.x = u_xlat0.y + -0.5;
    u_xlat5.x = u_xlat5.x * _ScreenParams.x;
    u_xlat5.x = u_xlat5.x / _ScreenParams.y;
    u_xlat0.x = u_xlat5.x + 0.5;
    u_xlat16_2.xy = (u_xlatb1.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * _MaskVector.yy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_2.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0 = texture2D(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
    u_xlat16_2.x = dot(u_xlat5.xyz, vs_TEXCOORD2.xyz);
    u_xlatb5 = 0.5<_FresAlphaVector.w;
    u_xlat16_7.x = -abs(u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = (u_xlatb5) ? abs(u_xlat16_2.x) : u_xlat16_7.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat5.x = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat5.x = u_xlat16_2.x / u_xlat5.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat10 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat10;
    u_xlat16_2.x = min(u_xlat5.x, 1.0);
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    SV_Target0.w = (u_xlatb1.y) ? u_xlat16_2.x : u_xlat0.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_KAWASEBLUR" }
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
in mediump vec4 in_COLOR0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat1.zw;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MaskTex_ST;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	mediump vec4 _BlurVector;
uniform 	mediump vec2 _BlurMaskVector;
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
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
int u_xlati8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
float u_xlat14;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.yz = u_xlat0.yz + (-_BlurVector.xy);
    u_xlat21 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat21 * u_xlat1.y;
    u_xlat21 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 + (-_BlurMaskVector.x);
    u_xlat21 = u_xlat21 / _BlurMaskVector.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlati1 = int(_BlurVector.w);
    u_xlati1 = max(u_xlati1, 2);
    u_xlati1 = min(u_xlati1, 8);
    u_xlati8 = int(u_xlati1 << 1);
    u_xlat16_2.x = float(u_xlati8);
    u_xlat16_2.x = _BlurVector.z / u_xlat16_2.x;
    u_xlat3 = u_xlat16_2.xxxx * vec4(1.0, -1.0, -1.0, 1.0);
    u_xlat16_9.x = float(0.0);
    u_xlat16_9.y = float(0.0);
    u_xlat16_9.z = float(0.0);
    u_xlati8 = 0;
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlati8>=u_xlati1);
#else
        u_xlatb15 = u_xlati8>=u_xlati1;
#endif
        if(u_xlatb15){break;}
        u_xlat15.x = float(u_xlati8);
        u_xlat22 = u_xlat15.x * u_xlat16_2.x;
        u_xlat4.xy = vec2(u_xlat22) * vec2(u_xlat21) + u_xlat0.yz;
        u_xlat5 = u_xlat15.xxxx * u_xlat3;
        u_xlat6 = u_xlat5 * vec4(u_xlat21) + u_xlat0.yzyz;
        u_xlat15.xy = u_xlat5.zz * vec2(u_xlat21) + u_xlat0.yz;
        u_xlat16_4.xyz = texture(_GrabTexture, u_xlat4.xy).xyz;
        u_xlat4.xyz = u_xlat16_9.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = texture(_GrabTexture, u_xlat6.xy).xyz;
        u_xlat4.xyz = u_xlat4.xyz + u_xlat16_5.xyz;
        u_xlat16_5.xyz = texture(_GrabTexture, u_xlat6.zw).xyz;
        u_xlat4.xyz = u_xlat4.xyz + u_xlat16_5.xyz;
        u_xlat16_5.xyz = texture(_GrabTexture, u_xlat15.xy).xyz;
        u_xlat9.xyz = u_xlat4.xyz + u_xlat16_5.xyz;
        u_xlati8 = u_xlati8 + 1;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat16_2.x = float(u_xlati1);
    u_xlat16_2.xyz = u_xlat16_9.xyz / u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _MaskVector.xzxx).xy;
    u_xlat7.x = u_xlat0.y + -0.5;
    u_xlat7.x = u_xlat7.x * _ScreenParams.x;
    u_xlat7.x = u_xlat7.x / _ScreenParams.y;
    u_xlat0.x = u_xlat7.x + 0.5;
    u_xlat16_2.xy = (u_xlatb1.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * _MaskVector.yy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_2.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0 = texture(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_2.x = dot(u_xlat7.xyz, vs_TEXCOORD2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.5<_FresAlphaVector.w);
#else
    u_xlatb7 = 0.5<_FresAlphaVector.w;
#endif
    u_xlat16_9.x = -abs(u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = (u_xlatb7) ? abs(u_xlat16_2.x) : u_xlat16_9.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat7.x = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat7.x = u_xlat16_2.x / u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat16_2.x = min(u_xlat7.x, 1.0);
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    SV_Target0.w = (u_xlatb1.y) ? u_xlat16_2.x : u_xlat0.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_KAWASEBLUR" }
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
in mediump vec4 in_COLOR0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat1.zw;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MaskTex_ST;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	mediump vec4 _BlurVector;
uniform 	mediump vec2 _BlurMaskVector;
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
UNITY_LOCATION(1) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
int u_xlati8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
float u_xlat14;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.yz = u_xlat0.yz + (-_BlurVector.xy);
    u_xlat21 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat21 * u_xlat1.y;
    u_xlat21 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 + (-_BlurMaskVector.x);
    u_xlat21 = u_xlat21 / _BlurMaskVector.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlati1 = int(_BlurVector.w);
    u_xlati1 = max(u_xlati1, 2);
    u_xlati1 = min(u_xlati1, 8);
    u_xlati8 = int(u_xlati1 << 1);
    u_xlat16_2.x = float(u_xlati8);
    u_xlat16_2.x = _BlurVector.z / u_xlat16_2.x;
    u_xlat3 = u_xlat16_2.xxxx * vec4(1.0, -1.0, -1.0, 1.0);
    u_xlat16_9.x = float(0.0);
    u_xlat16_9.y = float(0.0);
    u_xlat16_9.z = float(0.0);
    u_xlati8 = 0;
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlati8>=u_xlati1);
#else
        u_xlatb15 = u_xlati8>=u_xlati1;
#endif
        if(u_xlatb15){break;}
        u_xlat15.x = float(u_xlati8);
        u_xlat22 = u_xlat15.x * u_xlat16_2.x;
        u_xlat4.xy = vec2(u_xlat22) * vec2(u_xlat21) + u_xlat0.yz;
        u_xlat5 = u_xlat15.xxxx * u_xlat3;
        u_xlat6 = u_xlat5 * vec4(u_xlat21) + u_xlat0.yzyz;
        u_xlat15.xy = u_xlat5.zz * vec2(u_xlat21) + u_xlat0.yz;
        u_xlat16_4.xyz = texture(_GrabTexture, u_xlat4.xy).xyz;
        u_xlat4.xyz = u_xlat16_9.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = texture(_GrabTexture, u_xlat6.xy).xyz;
        u_xlat4.xyz = u_xlat4.xyz + u_xlat16_5.xyz;
        u_xlat16_5.xyz = texture(_GrabTexture, u_xlat6.zw).xyz;
        u_xlat4.xyz = u_xlat4.xyz + u_xlat16_5.xyz;
        u_xlat16_5.xyz = texture(_GrabTexture, u_xlat15.xy).xyz;
        u_xlat9.xyz = u_xlat4.xyz + u_xlat16_5.xyz;
        u_xlati8 = u_xlati8 + 1;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat16_2.x = float(u_xlati1);
    u_xlat16_2.xyz = u_xlat16_9.xyz / u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _MaskVector.xzxx).xy;
    u_xlat7.x = u_xlat0.y + -0.5;
    u_xlat7.x = u_xlat7.x * _ScreenParams.x;
    u_xlat7.x = u_xlat7.x / _ScreenParams.y;
    u_xlat0.x = u_xlat7.x + 0.5;
    u_xlat16_2.xy = (u_xlatb1.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * _MaskVector.yy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_2.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0 = texture(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_2.x = dot(u_xlat7.xyz, vs_TEXCOORD2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.5<_FresAlphaVector.w);
#else
    u_xlatb7 = 0.5<_FresAlphaVector.w;
#endif
    u_xlat16_9.x = -abs(u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = (u_xlatb7) ? abs(u_xlat16_2.x) : u_xlat16_9.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat7.x = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat7.x = u_xlat16_2.x / u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat16_2.x = min(u_xlat7.x, 1.0);
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    SV_Target0.w = (u_xlatb1.y) ? u_xlat16_2.x : u_xlat0.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_KAWASEBLUR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat1.zw;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _MaskTex_ST;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	mediump vec4 _BlurVector;
uniform 	mediump vec2 _BlurMaskVector;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _MaskTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
int u_xlati1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
vec4 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
int u_xlati8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
float u_xlat14;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
float u_xlat22;
int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }

void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.yz = u_xlat0.yz + (-_BlurVector.xy);
    u_xlat21 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat21 * u_xlat1.y;
    u_xlat21 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 + (-_BlurMaskVector.x);
    u_xlat21 = u_xlat21 / _BlurMaskVector.y;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlati1 = int(_BlurVector.w);
    u_xlati1 = int(max(float(u_xlati1), 2.80259693e-45));
    u_xlati1 = int(min(float(u_xlati1), 1.12103877e-44));
    u_xlati8 = op_shl(u_xlati1, 1);
    u_xlat16_2.x = float(u_xlati8);
    u_xlat16_2.x = _BlurVector.z / u_xlat16_2.x;
    u_xlat3 = u_xlat16_2.xxxx * vec4(1.0, -1.0, -1.0, 1.0);
    u_xlat16_9.x = float(0.0);
    u_xlat16_9.y = float(0.0);
    u_xlat16_9.z = float(0.0);
    u_xlati8 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb15 = u_xlati8>=u_xlati1;
        if(u_xlatb15){break;}
        u_xlat15.x = float(u_xlati8);
        u_xlat22 = u_xlat15.x * u_xlat16_2.x;
        u_xlat4.xy = vec2(u_xlat22) * vec2(u_xlat21) + u_xlat0.yz;
        u_xlat5 = u_xlat15.xxxx * u_xlat3;
        u_xlat6 = u_xlat5 * vec4(u_xlat21) + u_xlat0.yzyz;
        u_xlat15.xy = u_xlat5.zz * vec2(u_xlat21) + u_xlat0.yz;
        u_xlat10_4.xyz = texture2D(_GrabTexture, u_xlat4.xy).xyz;
        u_xlat4.xyz = u_xlat16_9.xyz + u_xlat10_4.xyz;
        u_xlat10_5.xyz = texture2D(_GrabTexture, u_xlat6.xy).xyz;
        u_xlat4.xyz = u_xlat4.xyz + u_xlat10_5.xyz;
        u_xlat10_5.xyz = texture2D(_GrabTexture, u_xlat6.zw).xyz;
        u_xlat4.xyz = u_xlat4.xyz + u_xlat10_5.xyz;
        u_xlat10_5.xyz = texture2D(_GrabTexture, u_xlat15.xy).xyz;
        u_xlat9.xyz = u_xlat4.xyz + u_xlat10_5.xyz;
        u_xlati8 = u_xlati8 + 1;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat16_2.x = float(u_xlati1);
    u_xlat16_2.xyz = u_xlat16_9.xyz / u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _MaskVector.xzxx).xy;
    u_xlat7.x = u_xlat0.y + -0.5;
    u_xlat7.x = u_xlat7.x * _ScreenParams.x;
    u_xlat7.x = u_xlat7.x / _ScreenParams.y;
    u_xlat0.x = u_xlat7.x + 0.5;
    u_xlat16_2.xy = (u_xlatb1.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * _MaskVector.yy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_2.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0 = texture2D(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_2.x = dot(u_xlat7.xyz, vs_TEXCOORD2.xyz);
    u_xlatb7 = 0.5<_FresAlphaVector.w;
    u_xlat16_9.x = -abs(u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = (u_xlatb7) ? abs(u_xlat16_2.x) : u_xlat16_9.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat7.x = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat7.x = u_xlat16_2.x / u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat16_2.x = min(u_xlat7.x, 1.0);
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    SV_Target0.w = (u_xlatb1.y) ? u_xlat16_2.x : u_xlat0.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_KAWASEBLUR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = u_xlat1.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat1.zw;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _MaskTex_ST;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	mediump vec4 _BlurVector;
uniform 	mediump vec2 _BlurMaskVector;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _MaskTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
int u_xlati1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
vec4 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
int u_xlati8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
float u_xlat14;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
float u_xlat22;
int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }

void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.yz = u_xlat0.yz + (-_BlurVector.xy);
    u_xlat21 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat21 * u_xlat1.y;
    u_xlat21 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 + (-_BlurMaskVector.x);
    u_xlat21 = u_xlat21 / _BlurMaskVector.y;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlati1 = int(_BlurVector.w);
    u_xlati1 = int(max(float(u_xlati1), 2.80259693e-45));
    u_xlati1 = int(min(float(u_xlati1), 1.12103877e-44));
    u_xlati8 = op_shl(u_xlati1, 1);
    u_xlat16_2.x = float(u_xlati8);
    u_xlat16_2.x = _BlurVector.z / u_xlat16_2.x;
    u_xlat3 = u_xlat16_2.xxxx * vec4(1.0, -1.0, -1.0, 1.0);
    u_xlat16_9.x = float(0.0);
    u_xlat16_9.y = float(0.0);
    u_xlat16_9.z = float(0.0);
    u_xlati8 = 0;
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb15 = u_xlati8>=u_xlati1;
        if(u_xlatb15){break;}
        u_xlat15.x = float(u_xlati8);
        u_xlat22 = u_xlat15.x * u_xlat16_2.x;
        u_xlat4.xy = vec2(u_xlat22) * vec2(u_xlat21) + u_xlat0.yz;
        u_xlat5 = u_xlat15.xxxx * u_xlat3;
        u_xlat6 = u_xlat5 * vec4(u_xlat21) + u_xlat0.yzyz;
        u_xlat15.xy = u_xlat5.zz * vec2(u_xlat21) + u_xlat0.yz;
        u_xlat10_4.xyz = texture2D(_GrabTexture, u_xlat4.xy).xyz;
        u_xlat4.xyz = u_xlat16_9.xyz + u_xlat10_4.xyz;
        u_xlat10_5.xyz = texture2D(_GrabTexture, u_xlat6.xy).xyz;
        u_xlat4.xyz = u_xlat4.xyz + u_xlat10_5.xyz;
        u_xlat10_5.xyz = texture2D(_GrabTexture, u_xlat6.zw).xyz;
        u_xlat4.xyz = u_xlat4.xyz + u_xlat10_5.xyz;
        u_xlat10_5.xyz = texture2D(_GrabTexture, u_xlat15.xy).xyz;
        u_xlat9.xyz = u_xlat4.xyz + u_xlat10_5.xyz;
        u_xlati8 = u_xlati8 + 1;
        u_xlat16_9.xyz = u_xlat9.xyz;
    }
    u_xlat16_2.x = float(u_xlati1);
    u_xlat16_2.xyz = u_xlat16_9.xyz / u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.25, 0.25, 0.25);
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _MaskVector.xzxx).xy;
    u_xlat7.x = u_xlat0.y + -0.5;
    u_xlat7.x = u_xlat7.x * _ScreenParams.x;
    u_xlat7.x = u_xlat7.x / _ScreenParams.y;
    u_xlat0.x = u_xlat7.x + 0.5;
    u_xlat16_2.xy = (u_xlatb1.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * _MaskVector.yy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_2.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0 = texture2D(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_2.x = dot(u_xlat7.xyz, vs_TEXCOORD2.xyz);
    u_xlatb7 = 0.5<_FresAlphaVector.w;
    u_xlat16_9.x = -abs(u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = (u_xlatb7) ? abs(u_xlat16_2.x) : u_xlat16_9.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat7.x = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat7.x = u_xlat16_2.x / u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat16_2.x = min(u_xlat7.x, 1.0);
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    SV_Target0.w = (u_xlatb1.y) ? u_xlat16_2.x : u_xlat0.x;
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
Local Keywords { "_USE_KAWASEBLUR" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_KAWASEBLUR" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_KAWASEBLUR" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_KAWASEBLUR" }
""
}
}
}
}
CustomEditor "HeroShowRenderingGUI.VFX.ScreenEffectRadialBlurShaderGUI"
}