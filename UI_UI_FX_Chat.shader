//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/UI_FX_Chat" {
Properties {

[Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

_MainTex ("Mask", 2D) = "white" { }

_MainTexScale ("Diffuse缩放", Range(0, 10)) = 1.0

_LG_Tex ("LG_Tex(屏幕坐标)", 2D) = "white" { }

[Toggle] _LGUseScreenU ("U轴使用屏幕坐标", Float) = 1.0

[Toggle] _LGUseScreenV ("V轴使用屏幕坐标", Float) = 1.0

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Angle ("流光旋转", Range(0, 360)) = 0.0

_LG_Speed ("XY:流光流速", Vector) = (0,0,0,0)

_NoiseTex ("R:Noise", 2D) = "white" { }

[Toggle] _NoiseUseScreenU ("U轴使用屏幕坐标", Float) = 1.0

[Toggle] _NoiseUseScreenV ("V轴使用屏幕坐标", Float) = 1.0

_NoiseXStreng ("扰动X强度", Range(-10, 10)) = 0.0

_NoiseYStreng ("扰动Y强度", Range(-10, 10)) = 0.0

_NoiseVector ("扰动XY:Tiling ZW:流速", Vector) = (1,1,0,0)

_StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

_PanelRect ("PanelRect支持NGUI裁切", Vector) = (0,0,0,0)

_PanelClipInfo ("ClipInfo支持NGUI裁切", Vector) = (0,0,0,0)

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 55260
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_POSITION0.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3.zw = u_xlat0.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec2 _LG_Speed;
uniform 	float _LG_Angle;
uniform 	mediump vec4 _LG_Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump vec4 _NoiseVector;
uniform 	int _NoiseUseScreenU;
uniform 	int _NoiseUseScreenV;
uniform 	int _LGUseScreenU;
uniform 	int _LGUseScreenV;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    u_xlat5 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.yz = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10.x = u_xlat5 * u_xlat1.y;
    u_xlat5 = (-u_xlat1.y) * u_xlat5 + 1.0;
    u_xlat1.x = (u_xlatb0.x) ? u_xlat5 : u_xlat10.x;
    u_xlat0 = vec4(ivec4(_NoiseUseScreenU, _NoiseUseScreenV, _LGUseScreenU, _LGUseScreenV));
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.y = (u_xlatb0.y) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat0.z = (u_xlatb0.z) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.w = (u_xlatb0.w) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat10.xy = u_xlat0.zw + vec2(-0.5, -0.5);
    u_xlat1.x = _LG_Angle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3 = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat10.xy);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat10.xy);
    u_xlat10.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat0.xy = u_xlat0.xy * _NoiseVector.xy + u_xlat1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_4.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = _Time.yy * _LG_Speed.xy + u_xlat16_4.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat0.xy);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat16_1 * vs_COLOR0.w;
    u_xlat1.x = u_xlat1.x * _LG_Color.w;
    u_xlat15 = u_xlat16_0.w * u_xlat1.x;
    u_xlat0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _LG_Color.xyz;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat15 * u_xlat16_4.x;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_POSITION0.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3.zw = u_xlat0.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec2 _LG_Speed;
uniform 	float _LG_Angle;
uniform 	mediump vec4 _LG_Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump vec4 _NoiseVector;
uniform 	int _NoiseUseScreenU;
uniform 	int _NoiseUseScreenV;
uniform 	int _LGUseScreenU;
uniform 	int _LGUseScreenV;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    u_xlat5 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.yz = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10.x = u_xlat5 * u_xlat1.y;
    u_xlat5 = (-u_xlat1.y) * u_xlat5 + 1.0;
    u_xlat1.x = (u_xlatb0.x) ? u_xlat5 : u_xlat10.x;
    u_xlat0 = vec4(ivec4(_NoiseUseScreenU, _NoiseUseScreenV, _LGUseScreenU, _LGUseScreenV));
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.y = (u_xlatb0.y) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat0.z = (u_xlatb0.z) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.w = (u_xlatb0.w) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat10.xy = u_xlat0.zw + vec2(-0.5, -0.5);
    u_xlat1.x = _LG_Angle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3 = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat10.xy);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat10.xy);
    u_xlat10.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat0.xy = u_xlat0.xy * _NoiseVector.xy + u_xlat1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_4.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = _Time.yy * _LG_Speed.xy + u_xlat16_4.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat0.xy);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat16_1 * vs_COLOR0.w;
    u_xlat1.x = u_xlat1.x * _LG_Color.w;
    u_xlat15 = u_xlat16_0.w * u_xlat1.x;
    u_xlat0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _LG_Color.xyz;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat15 * u_xlat16_4.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_POSITION0.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3.zw = u_xlat0.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_OES_standard_derivatives
#extension GL_OES_standard_derivatives : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec2 _LG_Speed;
uniform 	float _LG_Angle;
uniform 	mediump vec4 _LG_Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump vec4 _NoiseVector;
uniform 	int _NoiseUseScreenU;
uniform 	int _NoiseUseScreenV;
uniform 	int _LGUseScreenU;
uniform 	int _LGUseScreenV;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD0.x);
    u_xlatb0.x = u_xlat0.x<0.0;
    u_xlat5 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.yz = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10.x = u_xlat5 * u_xlat1.y;
    u_xlat5 = (-u_xlat1.y) * u_xlat5 + 1.0;
    u_xlat1.x = (u_xlatb0.x) ? u_xlat5 : u_xlat10.x;
    u_xlat0 = vec4(ivec4(_NoiseUseScreenU, _NoiseUseScreenV, _LGUseScreenU, _LGUseScreenV));
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.y = (u_xlatb0.y) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat0.z = (u_xlatb0.z) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.w = (u_xlatb0.w) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat10.xy = u_xlat0.zw + vec2(-0.5, -0.5);
    u_xlat1.x = _LG_Angle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3 = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat10.xy);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat10.xy);
    u_xlat10.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat0.xy = u_xlat0.xy * _NoiseVector.xy + u_xlat1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_4.xy = u_xlat10_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = _Time.yy * _LG_Speed.xy + u_xlat16_4.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat0.xy);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat10_1 * vs_COLOR0.w;
    u_xlat1.x = u_xlat1.x * _LG_Color.w;
    u_xlat15 = u_xlat10_0.w * u_xlat1.x;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _LG_Color.xyz;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat15 * u_xlat16_4.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_POSITION0.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD3.zw = u_xlat0.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_OES_standard_derivatives
#extension GL_OES_standard_derivatives : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec2 _LG_Speed;
uniform 	float _LG_Angle;
uniform 	mediump vec4 _LG_Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump vec4 _NoiseVector;
uniform 	int _NoiseUseScreenU;
uniform 	int _NoiseUseScreenV;
uniform 	int _LGUseScreenU;
uniform 	int _LGUseScreenV;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD0.x);
    u_xlatb0.x = u_xlat0.x<0.0;
    u_xlat5 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.yz = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10.x = u_xlat5 * u_xlat1.y;
    u_xlat5 = (-u_xlat1.y) * u_xlat5 + 1.0;
    u_xlat1.x = (u_xlatb0.x) ? u_xlat5 : u_xlat10.x;
    u_xlat0 = vec4(ivec4(_NoiseUseScreenU, _NoiseUseScreenV, _LGUseScreenU, _LGUseScreenV));
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.y = (u_xlatb0.y) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat0.z = (u_xlatb0.z) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.w = (u_xlatb0.w) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat10.xy = u_xlat0.zw + vec2(-0.5, -0.5);
    u_xlat1.x = _LG_Angle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3 = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat10.xy);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat10.xy);
    u_xlat10.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat0.xy = u_xlat0.xy * _NoiseVector.xy + u_xlat1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_4.xy = u_xlat10_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = _Time.yy * _LG_Speed.xy + u_xlat16_4.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat0.xy);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat10_1 * vs_COLOR0.w;
    u_xlat1.x = u_xlat1.x * _LG_Color.w;
    u_xlat15 = u_xlat10_0.w * u_xlat1.x;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _LG_Color.xyz;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat15 * u_xlat16_4.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xy * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xy * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_POSITION0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = in_POSITION0.xxx * hlslcc_mtx4x4unity_ObjectToWorld[0].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].xyz * in_POSITION0.yyy + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec2 _LG_Speed;
uniform 	float _LG_Angle;
uniform 	mediump vec4 _LG_Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump vec4 _NoiseVector;
uniform 	int _NoiseUseScreenU;
uniform 	int _NoiseUseScreenV;
uniform 	int _LGUseScreenU;
uniform 	int _LGUseScreenV;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    u_xlat5 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.yz = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10.x = u_xlat5 * u_xlat1.y;
    u_xlat5 = (-u_xlat1.y) * u_xlat5 + 1.0;
    u_xlat1.x = (u_xlatb0.x) ? u_xlat5 : u_xlat10.x;
    u_xlat0 = vec4(ivec4(_NoiseUseScreenU, _NoiseUseScreenV, _LGUseScreenU, _LGUseScreenV));
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.y = (u_xlatb0.y) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat0.z = (u_xlatb0.z) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.w = (u_xlatb0.w) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat10.xy = u_xlat0.zw + vec2(-0.5, -0.5);
    u_xlat1.x = _LG_Angle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3 = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat10.xy);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat10.xy);
    u_xlat10.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat0.xy = u_xlat0.xy * _NoiseVector.xy + u_xlat1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_4.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = _Time.yy * _LG_Speed.xy + u_xlat16_4.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat0.xy);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat16_1 * vs_COLOR0.w;
    u_xlat1.x = u_xlat1.x * _LG_Color.w;
    u_xlat15 = u_xlat16_0.w * u_xlat1.x;
    u_xlat0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _LG_Color.xyz;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat15 * u_xlat16_4.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xy * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xy * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_POSITION0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = in_POSITION0.xxx * hlslcc_mtx4x4unity_ObjectToWorld[0].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].xyz * in_POSITION0.yyy + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec2 _LG_Speed;
uniform 	float _LG_Angle;
uniform 	mediump vec4 _LG_Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump vec4 _NoiseVector;
uniform 	int _NoiseUseScreenU;
uniform 	int _NoiseUseScreenV;
uniform 	int _LGUseScreenU;
uniform 	int _LGUseScreenV;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    u_xlat5 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.yz = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10.x = u_xlat5 * u_xlat1.y;
    u_xlat5 = (-u_xlat1.y) * u_xlat5 + 1.0;
    u_xlat1.x = (u_xlatb0.x) ? u_xlat5 : u_xlat10.x;
    u_xlat0 = vec4(ivec4(_NoiseUseScreenU, _NoiseUseScreenV, _LGUseScreenU, _LGUseScreenV));
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.y = (u_xlatb0.y) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat0.z = (u_xlatb0.z) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.w = (u_xlatb0.w) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat10.xy = u_xlat0.zw + vec2(-0.5, -0.5);
    u_xlat1.x = _LG_Angle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3 = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat10.xy);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat10.xy);
    u_xlat10.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat0.xy = u_xlat0.xy * _NoiseVector.xy + u_xlat1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_4.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = _Time.yy * _LG_Speed.xy + u_xlat16_4.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat0.xy);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat16_1 * vs_COLOR0.w;
    u_xlat1.x = u_xlat1.x * _LG_Color.w;
    u_xlat15 = u_xlat16_0.w * u_xlat1.x;
    u_xlat0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _LG_Color.xyz;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat15 * u_xlat16_4.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xy * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xy * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_POSITION0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = in_POSITION0.xxx * hlslcc_mtx4x4unity_ObjectToWorld[0].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].xyz * in_POSITION0.yyy + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_OES_standard_derivatives
#extension GL_OES_standard_derivatives : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec2 _LG_Speed;
uniform 	float _LG_Angle;
uniform 	mediump vec4 _LG_Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump vec4 _NoiseVector;
uniform 	int _NoiseUseScreenU;
uniform 	int _NoiseUseScreenV;
uniform 	int _LGUseScreenU;
uniform 	int _LGUseScreenV;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD0.x);
    u_xlatb0.x = u_xlat0.x<0.0;
    u_xlat5 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.yz = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10.x = u_xlat5 * u_xlat1.y;
    u_xlat5 = (-u_xlat1.y) * u_xlat5 + 1.0;
    u_xlat1.x = (u_xlatb0.x) ? u_xlat5 : u_xlat10.x;
    u_xlat0 = vec4(ivec4(_NoiseUseScreenU, _NoiseUseScreenV, _LGUseScreenU, _LGUseScreenV));
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.y = (u_xlatb0.y) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat0.z = (u_xlatb0.z) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.w = (u_xlatb0.w) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat10.xy = u_xlat0.zw + vec2(-0.5, -0.5);
    u_xlat1.x = _LG_Angle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3 = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat10.xy);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat10.xy);
    u_xlat10.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat0.xy = u_xlat0.xy * _NoiseVector.xy + u_xlat1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_4.xy = u_xlat10_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = _Time.yy * _LG_Speed.xy + u_xlat16_4.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat0.xy);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat10_1 * vs_COLOR0.w;
    u_xlat1.x = u_xlat1.x * _LG_Color.w;
    u_xlat15 = u_xlat10_0.w * u_xlat1.x;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _LG_Color.xyz;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat15 * u_xlat16_4.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[0].xy * in_POSITION0.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[2].xy * in_POSITION0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_POSITION0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = in_POSITION0.xxx * hlslcc_mtx4x4unity_ObjectToWorld[0].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].xyz * in_POSITION0.yyy + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_OES_standard_derivatives
#extension GL_OES_standard_derivatives : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec2 _LG_Speed;
uniform 	float _LG_Angle;
uniform 	mediump vec4 _LG_Color;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump vec4 _NoiseVector;
uniform 	int _NoiseUseScreenU;
uniform 	int _NoiseUseScreenV;
uniform 	int _LGUseScreenU;
uniform 	int _LGUseScreenV;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD0.x);
    u_xlatb0.x = u_xlat0.x<0.0;
    u_xlat5 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.yz = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10.x = u_xlat5 * u_xlat1.y;
    u_xlat5 = (-u_xlat1.y) * u_xlat5 + 1.0;
    u_xlat1.x = (u_xlatb0.x) ? u_xlat5 : u_xlat10.x;
    u_xlat0 = vec4(ivec4(_NoiseUseScreenU, _NoiseUseScreenV, _LGUseScreenU, _LGUseScreenV));
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0);
    u_xlat0.x = (u_xlatb0.x) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.y = (u_xlatb0.y) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat0.z = (u_xlatb0.z) ? u_xlat1.x : vs_TEXCOORD0.x;
    u_xlat0.w = (u_xlatb0.w) ? u_xlat1.z : vs_TEXCOORD0.y;
    u_xlat10.xy = u_xlat0.zw + vec2(-0.5, -0.5);
    u_xlat1.x = _LG_Angle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3 = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat10.xy);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat10.xy);
    u_xlat10.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat0.xy = u_xlat0.xy * _NoiseVector.xy + u_xlat1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_4.xy = u_xlat10_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = _Time.yy * _LG_Speed.xy + u_xlat16_4.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat0.xy);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat10_1 * vs_COLOR0.w;
    u_xlat1.x = u_xlat1.x * _LG_Color.w;
    u_xlat15 = u_xlat10_0.w * u_xlat1.x;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _LG_Color.xyz;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat15 * u_xlat16_4.x;
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
}