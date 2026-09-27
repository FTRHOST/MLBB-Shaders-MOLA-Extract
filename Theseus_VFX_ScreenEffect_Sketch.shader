//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/VFX/ScreenEffect_Sketch" {
Properties {

_MaskTex ("Alpha (R) Dissolve(G)", 2D) = "white" { }

_FresAlphaVector ("_FresAlphaVector", Vector) = (1,0.01,1,0)

_MaskVector ("MaskVector", Vector) = (0,1,0,1)

_ColorGradingParams ("ColorGradingParams", Vector) = (0,1,1,0)

_BrushTex ("叠加纹理", 2D) = "grey" { }

_BrushVector ("叠加纹理Vector", Vector) = (0.5,0,0,0)

_SketchIntensity ("Sketch Intensity", Range(0, 1)) = 1.0

_SampleDistance ("Sample Distance", Range(0.5, 4)) = 1.0

_EdgeColor ("Edge Color", Color) = (0,0,0,1)

_BGColor ("Background Color", Color) = (1,1,1,1)

_ContactRange ("软化范围", Range(0.05, 100)) = 0.5

_DissolveTex ("溶解噪声", 2D) = "white" { }

_DissolveUV ("溶解使用屏幕UV", Float) = 0.0

_DissolveControlParams ("溶解控制参数 ## 溶解(-2, 2) | 溶解软硬(0, 1) | 溶解边缘(0, 2) | 溶解边缘软硬(0, 1)", Vector) = (-1,0,0,0)

_DissolveColor ("溶解边缘颜色", Color) = (1,1,1,1)

[Space(10)] [Enum(UnityEngine.Rendering.CullMode)] _CullMode ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 4.0

[Space(10)] [Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

_StencilRef ("StencilRef", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 GrabPass {
 "_Theseus_ScreenEffectGrabTex_Sketch"
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 1252
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
uniform 	vec4 _BrushTex_ST;
uniform 	mediump vec4 _BrushVector;
uniform 	mediump vec4 _ColorGradingParams;
uniform 	mediump float _SketchIntensity;
uniform 	mediump float _SampleDistance;
uniform 	mediump vec4 _EdgeColor;
uniform 	mediump vec4 _BGColor;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	vec4 _Theseus_ScreenEffectGrabTex_Sketch_TexelSize;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BrushTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Theseus_ScreenEffectGrabTex_Sketch;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
bvec3 u_xlatb8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_14;
bool u_xlatb17;
mediump float u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.xy = u_xlat0.yz * _BrushTex_ST.xy + _BrushTex_ST.zw;
    u_xlat16_1.xy = texture(_BrushTex, u_xlat1.xy).xw;
    u_xlat16_2.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _BrushVector.yzx;
    u_xlat1.xz = u_xlat16_2.xx * _BrushVector.yz + u_xlat0.yz;
    u_xlat1.xzw = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat1.xz).xyz;
    u_xlat3.xy = _Theseus_ScreenEffectGrabTex_Sketch_TexelSize.xy * vec2(vec2(_SampleDistance, _SampleDistance)) + u_xlat16_10.xy;
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + u_xlat0.yzyz;
    u_xlat16_5.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_2.x = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = dot(u_xlat16_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat4 = u_xlat3.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + u_xlat0.yzyz;
    u_xlat16_5.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_18 = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.x = dot(u_xlat16_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x * 2.0 + u_xlat16_6.x;
    u_xlat19.xy = u_xlat0.yz + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_14.x = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_14.x;
    u_xlat16_2.x = (-u_xlat16_2.x) * 2.0 + u_xlat16_10.x;
    u_xlat19.xy = u_xlat0.yz + (-u_xlat3.xy);
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + u_xlat0.yzyz;
    u_xlat16_3.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_10.x = dot(u_xlat16_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_2.x = (-u_xlat16_10.x) + u_xlat16_2.x;
    u_xlat16_3.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_22 = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_22 * 2.0 + u_xlat16_14.x;
    u_xlat16_6.z = dot(u_xlat16_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_6.z + u_xlat16_14.x;
    u_xlat16_18 = (-u_xlat16_18) * 2.0 + u_xlat16_14.x;
    u_xlat16_2.y = (-u_xlat16_10.x) + u_xlat16_18;
    u_xlat16_2.xy = (-u_xlat16_6.zx) + u_xlat16_2.xy;
    u_xlat24 = -abs(u_xlat16_2.x) + 1.0;
    u_xlat24 = -abs(u_xlat16_2.y) + u_xlat24;
    u_xlat24 = max(u_xlat24, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.z>=u_xlat1.w);
#else
    u_xlatb3 = u_xlat1.z>=u_xlat1.w;
#endif
    u_xlat16_2.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat1.wz) + u_xlat1.zw;
    u_xlat16_3.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat1.wz;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_3.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_4.w = (-u_xlat1.x);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat1.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat1.x>=u_xlat16_3.x);
#else
    u_xlatb17 = u_xlat1.x>=u_xlat16_3.x;
#endif
    u_xlat16_2.x = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_5.w + u_xlat1.x;
    u_xlat16_6.xyz = u_xlat16_2.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_2.x = min(u_xlat16_10.x, u_xlat16_6.y);
    u_xlat16_10.x = u_xlat16_10.x + (-u_xlat16_6.y);
    u_xlat16_2.x = (-u_xlat16_2.x) + u_xlat16_6.x;
    u_xlat16_18 = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_10.x = u_xlat16_10.x / u_xlat16_18;
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_6.z;
    u_xlat16_10.x = abs(u_xlat16_10.x) + _ColorGradingParams.x;
    u_xlat16_18 = u_xlat16_10.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_18>=(-u_xlat16_18));
#else
    u_xlatb1 = u_xlat16_18>=(-u_xlat16_18);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_14.y;
    u_xlat16_10.x = fract(u_xlat16_10.x);
    u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_10.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.x = u_xlat16_6.x + 9.99999975e-05;
    u_xlat16_2.x = u_xlat16_2.x / u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x * _ColorGradingParams.y;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _ColorGradingParams.zzz;
    u_xlat16_6.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_ColorGradingParams.w);
#else
    u_xlatb1 = 0.5<_ColorGradingParams.w;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _BGColor.xyz;
    u_xlat16_30 = _SketchIntensity * _BGColor.w;
    u_xlat16_6.xyz = vec3(u_xlat16_30) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _EdgeColor.xyz;
    u_xlat16_30 = _SketchIntensity * _EdgeColor.w;
    u_xlat16_2.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat24) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_10.zzz * u_xlat16_1.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_10.x = -abs(u_xlat16_2.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_FresAlphaVector.w);
#else
    u_xlatb24 = 0.5<_FresAlphaVector.w;
#endif
    u_xlat16_2.x = (u_xlatb24) ? abs(u_xlat16_2.x) : u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat24 = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat24 = u_xlat16_2.x / u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat16_2.x = min(u_xlat24, 1.0);
    u_xlat8 = u_xlat0.y + -0.5;
    u_xlat8 = u_xlat8 * _ScreenParams.x;
    u_xlat8 = u_xlat8 / _ScreenParams.y;
    u_xlat0.x = u_xlat8 + 0.5;
    u_xlatb8.xz = lessThan(vec4(0.5, 0.0, 0.5, 0.5), _MaskVector.xxzz).xz;
    u_xlat16_10.xy = (u_xlatb8.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_10.xy * _MaskVector.yy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_10.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0 = texture(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat0.x;
    SV_Target0.w = (u_xlatb8.z) ? u_xlat16_2.x : u_xlat0.x;
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
uniform 	vec4 _BrushTex_ST;
uniform 	mediump vec4 _BrushVector;
uniform 	mediump vec4 _ColorGradingParams;
uniform 	mediump float _SketchIntensity;
uniform 	mediump float _SampleDistance;
uniform 	mediump vec4 _EdgeColor;
uniform 	mediump vec4 _BGColor;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	vec4 _Theseus_ScreenEffectGrabTex_Sketch_TexelSize;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BrushTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Theseus_ScreenEffectGrabTex_Sketch;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
bvec3 u_xlatb8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_14;
bool u_xlatb17;
mediump float u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.xy = u_xlat0.yz * _BrushTex_ST.xy + _BrushTex_ST.zw;
    u_xlat16_1.xy = texture(_BrushTex, u_xlat1.xy).xw;
    u_xlat16_2.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _BrushVector.yzx;
    u_xlat1.xz = u_xlat16_2.xx * _BrushVector.yz + u_xlat0.yz;
    u_xlat1.xzw = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat1.xz).xyz;
    u_xlat3.xy = _Theseus_ScreenEffectGrabTex_Sketch_TexelSize.xy * vec2(vec2(_SampleDistance, _SampleDistance)) + u_xlat16_10.xy;
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + u_xlat0.yzyz;
    u_xlat16_5.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_2.x = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = dot(u_xlat16_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat4 = u_xlat3.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + u_xlat0.yzyz;
    u_xlat16_5.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_18 = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.x = dot(u_xlat16_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x * 2.0 + u_xlat16_6.x;
    u_xlat19.xy = u_xlat0.yz + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_14.x = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_14.x;
    u_xlat16_2.x = (-u_xlat16_2.x) * 2.0 + u_xlat16_10.x;
    u_xlat19.xy = u_xlat0.yz + (-u_xlat3.xy);
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + u_xlat0.yzyz;
    u_xlat16_3.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_10.x = dot(u_xlat16_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_2.x = (-u_xlat16_10.x) + u_xlat16_2.x;
    u_xlat16_3.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_22 = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_22 * 2.0 + u_xlat16_14.x;
    u_xlat16_6.z = dot(u_xlat16_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_6.z + u_xlat16_14.x;
    u_xlat16_18 = (-u_xlat16_18) * 2.0 + u_xlat16_14.x;
    u_xlat16_2.y = (-u_xlat16_10.x) + u_xlat16_18;
    u_xlat16_2.xy = (-u_xlat16_6.zx) + u_xlat16_2.xy;
    u_xlat24 = -abs(u_xlat16_2.x) + 1.0;
    u_xlat24 = -abs(u_xlat16_2.y) + u_xlat24;
    u_xlat24 = max(u_xlat24, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.z>=u_xlat1.w);
#else
    u_xlatb3 = u_xlat1.z>=u_xlat1.w;
#endif
    u_xlat16_2.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat1.wz) + u_xlat1.zw;
    u_xlat16_3.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat1.wz;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_3.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_4.w = (-u_xlat1.x);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat1.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat1.x>=u_xlat16_3.x);
#else
    u_xlatb17 = u_xlat1.x>=u_xlat16_3.x;
#endif
    u_xlat16_2.x = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_5.w + u_xlat1.x;
    u_xlat16_6.xyz = u_xlat16_2.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_2.x = min(u_xlat16_10.x, u_xlat16_6.y);
    u_xlat16_10.x = u_xlat16_10.x + (-u_xlat16_6.y);
    u_xlat16_2.x = (-u_xlat16_2.x) + u_xlat16_6.x;
    u_xlat16_18 = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_10.x = u_xlat16_10.x / u_xlat16_18;
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_6.z;
    u_xlat16_10.x = abs(u_xlat16_10.x) + _ColorGradingParams.x;
    u_xlat16_18 = u_xlat16_10.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_18>=(-u_xlat16_18));
#else
    u_xlatb1 = u_xlat16_18>=(-u_xlat16_18);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_14.y;
    u_xlat16_10.x = fract(u_xlat16_10.x);
    u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_10.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.x = u_xlat16_6.x + 9.99999975e-05;
    u_xlat16_2.x = u_xlat16_2.x / u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x * _ColorGradingParams.y;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _ColorGradingParams.zzz;
    u_xlat16_6.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_ColorGradingParams.w);
#else
    u_xlatb1 = 0.5<_ColorGradingParams.w;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _BGColor.xyz;
    u_xlat16_30 = _SketchIntensity * _BGColor.w;
    u_xlat16_6.xyz = vec3(u_xlat16_30) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _EdgeColor.xyz;
    u_xlat16_30 = _SketchIntensity * _EdgeColor.w;
    u_xlat16_2.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat24) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_10.zzz * u_xlat16_1.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_10.x = -abs(u_xlat16_2.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_FresAlphaVector.w);
#else
    u_xlatb24 = 0.5<_FresAlphaVector.w;
#endif
    u_xlat16_2.x = (u_xlatb24) ? abs(u_xlat16_2.x) : u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat24 = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat24 = u_xlat16_2.x / u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat16_2.x = min(u_xlat24, 1.0);
    u_xlat8 = u_xlat0.y + -0.5;
    u_xlat8 = u_xlat8 * _ScreenParams.x;
    u_xlat8 = u_xlat8 / _ScreenParams.y;
    u_xlat0.x = u_xlat8 + 0.5;
    u_xlatb8.xz = lessThan(vec4(0.5, 0.0, 0.5, 0.5), _MaskVector.xxzz).xz;
    u_xlat16_10.xy = (u_xlatb8.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_10.xy * _MaskVector.yy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_10.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0 = texture(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat0.x;
    SV_Target0.w = (u_xlatb8.z) ? u_xlat16_2.x : u_xlat0.x;
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
uniform 	vec4 _BrushTex_ST;
uniform 	mediump vec4 _BrushVector;
uniform 	mediump vec4 _ColorGradingParams;
uniform 	mediump float _SketchIntensity;
uniform 	mediump float _SampleDistance;
uniform 	mediump vec4 _EdgeColor;
uniform 	mediump vec4 _BGColor;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	vec4 _Theseus_ScreenEffectGrabTex_Sketch_TexelSize;
uniform lowp sampler2D _BrushTex;
uniform lowp sampler2D _Theseus_ScreenEffectGrabTex_Sketch;
uniform lowp sampler2D _MaskTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec2 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump vec4 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
bvec3 u_xlatb8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_14;
bool u_xlatb17;
mediump float u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.xy = u_xlat0.yz * _BrushTex_ST.xy + _BrushTex_ST.zw;
    u_xlat10_1.xy = texture2D(_BrushTex, u_xlat1.xy).xw;
    u_xlat16_2.x = u_xlat10_1.x * 2.0 + -1.0;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _BrushVector.yzx;
    u_xlat1.xz = u_xlat16_2.xx * _BrushVector.yz + u_xlat0.yz;
    u_xlat1.xzw = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat1.xz).xyz;
    u_xlat3.xy = _Theseus_ScreenEffectGrabTex_Sketch_TexelSize.xy * vec2(vec2(_SampleDistance, _SampleDistance)) + u_xlat16_10.xy;
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + u_xlat0.yzyz;
    u_xlat10_5.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_2.x = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = dot(u_xlat10_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat4 = u_xlat3.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + u_xlat0.yzyz;
    u_xlat10_5.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_18 = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.x = dot(u_xlat10_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x * 2.0 + u_xlat16_6.x;
    u_xlat19.xy = u_xlat0.yz + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_14.x = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_14.x;
    u_xlat16_2.x = (-u_xlat16_2.x) * 2.0 + u_xlat16_10.x;
    u_xlat19.xy = u_xlat0.yz + (-u_xlat3.xy);
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + u_xlat0.yzyz;
    u_xlat10_3.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_10.x = dot(u_xlat10_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_2.x = (-u_xlat16_10.x) + u_xlat16_2.x;
    u_xlat10_3.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_22 = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_22 * 2.0 + u_xlat16_14.x;
    u_xlat16_6.z = dot(u_xlat10_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_6.z + u_xlat16_14.x;
    u_xlat16_18 = (-u_xlat16_18) * 2.0 + u_xlat16_14.x;
    u_xlat16_2.y = (-u_xlat16_10.x) + u_xlat16_18;
    u_xlat16_2.xy = (-u_xlat16_6.zx) + u_xlat16_2.xy;
    u_xlat24 = -abs(u_xlat16_2.x) + 1.0;
    u_xlat24 = -abs(u_xlat16_2.y) + u_xlat24;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlatb3 = u_xlat1.z>=u_xlat1.w;
    u_xlat16_2.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat1.wz) + u_xlat1.zw;
    u_xlat16_3.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat1.wz;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_3.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_4.w = (-u_xlat1.x);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat1.x + u_xlat16_4.x;
    u_xlatb17 = u_xlat1.x>=u_xlat16_3.x;
    u_xlat16_2.x = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_5.w + u_xlat1.x;
    u_xlat16_6.xyz = u_xlat16_2.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_2.x = min(u_xlat16_10.x, u_xlat16_6.y);
    u_xlat16_10.x = u_xlat16_10.x + (-u_xlat16_6.y);
    u_xlat16_2.x = (-u_xlat16_2.x) + u_xlat16_6.x;
    u_xlat16_18 = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_10.x = u_xlat16_10.x / u_xlat16_18;
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_6.z;
    u_xlat16_10.x = abs(u_xlat16_10.x) + _ColorGradingParams.x;
    u_xlat16_18 = u_xlat16_10.x * 360.0;
    u_xlatb1 = u_xlat16_18>=(-u_xlat16_18);
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_14.y;
    u_xlat16_10.x = fract(u_xlat16_10.x);
    u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_10.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.x = u_xlat16_6.x + 9.99999975e-05;
    u_xlat16_2.x = u_xlat16_2.x / u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x * _ColorGradingParams.y;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _ColorGradingParams.zzz;
    u_xlat16_6.xyz = u_xlat16_2.xyz;
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
    u_xlat16_6.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlatb1 = 0.5<_ColorGradingParams.w;
    u_xlat16_2.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _BGColor.xyz;
    u_xlat16_30 = _SketchIntensity * _BGColor.w;
    u_xlat16_6.xyz = vec3(u_xlat16_30) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _EdgeColor.xyz;
    u_xlat16_30 = _SketchIntensity * _EdgeColor.w;
    u_xlat16_2.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat24) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_10.zzz * u_xlat10_1.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_10.x = -abs(u_xlat16_2.x) + 1.0;
    u_xlatb24 = 0.5<_FresAlphaVector.w;
    u_xlat16_2.x = (u_xlatb24) ? abs(u_xlat16_2.x) : u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat24 = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat24 = u_xlat16_2.x / u_xlat24;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat16_2.x = min(u_xlat24, 1.0);
    u_xlat8 = u_xlat0.y + -0.5;
    u_xlat8 = u_xlat8 * _ScreenParams.x;
    u_xlat8 = u_xlat8 / _ScreenParams.y;
    u_xlat0.x = u_xlat8 + 0.5;
    u_xlatb8.xz = lessThan(vec4(0.5, 0.0, 0.5, 0.5), _MaskVector.xxzz).xz;
    u_xlat16_10.xy = (u_xlatb8.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_10.xy * _MaskVector.yy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_10.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0 = texture2D(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat0.x;
    SV_Target0.w = (u_xlatb8.z) ? u_xlat16_2.x : u_xlat0.x;
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
uniform 	vec4 _BrushTex_ST;
uniform 	mediump vec4 _BrushVector;
uniform 	mediump vec4 _ColorGradingParams;
uniform 	mediump float _SketchIntensity;
uniform 	mediump float _SampleDistance;
uniform 	mediump vec4 _EdgeColor;
uniform 	mediump vec4 _BGColor;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	vec4 _Theseus_ScreenEffectGrabTex_Sketch_TexelSize;
uniform lowp sampler2D _BrushTex;
uniform lowp sampler2D _Theseus_ScreenEffectGrabTex_Sketch;
uniform lowp sampler2D _MaskTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec2 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump vec4 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
bvec3 u_xlatb8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_14;
bool u_xlatb17;
mediump float u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.xy = u_xlat0.yz * _BrushTex_ST.xy + _BrushTex_ST.zw;
    u_xlat10_1.xy = texture2D(_BrushTex, u_xlat1.xy).xw;
    u_xlat16_2.x = u_xlat10_1.x * 2.0 + -1.0;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _BrushVector.yzx;
    u_xlat1.xz = u_xlat16_2.xx * _BrushVector.yz + u_xlat0.yz;
    u_xlat1.xzw = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat1.xz).xyz;
    u_xlat3.xy = _Theseus_ScreenEffectGrabTex_Sketch_TexelSize.xy * vec2(vec2(_SampleDistance, _SampleDistance)) + u_xlat16_10.xy;
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + u_xlat0.yzyz;
    u_xlat10_5.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_2.x = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = dot(u_xlat10_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat4 = u_xlat3.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + u_xlat0.yzyz;
    u_xlat10_5.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_18 = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.x = dot(u_xlat10_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x * 2.0 + u_xlat16_6.x;
    u_xlat19.xy = u_xlat0.yz + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_14.x = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_14.x;
    u_xlat16_2.x = (-u_xlat16_2.x) * 2.0 + u_xlat16_10.x;
    u_xlat19.xy = u_xlat0.yz + (-u_xlat3.xy);
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + u_xlat0.yzyz;
    u_xlat10_3.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_10.x = dot(u_xlat10_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_2.x = (-u_xlat16_10.x) + u_xlat16_2.x;
    u_xlat10_3.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_22 = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_22 * 2.0 + u_xlat16_14.x;
    u_xlat16_6.z = dot(u_xlat10_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_6.z + u_xlat16_14.x;
    u_xlat16_18 = (-u_xlat16_18) * 2.0 + u_xlat16_14.x;
    u_xlat16_2.y = (-u_xlat16_10.x) + u_xlat16_18;
    u_xlat16_2.xy = (-u_xlat16_6.zx) + u_xlat16_2.xy;
    u_xlat24 = -abs(u_xlat16_2.x) + 1.0;
    u_xlat24 = -abs(u_xlat16_2.y) + u_xlat24;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlatb3 = u_xlat1.z>=u_xlat1.w;
    u_xlat16_2.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat1.wz) + u_xlat1.zw;
    u_xlat16_3.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat1.wz;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_3.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_4.w = (-u_xlat1.x);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat1.x + u_xlat16_4.x;
    u_xlatb17 = u_xlat1.x>=u_xlat16_3.x;
    u_xlat16_2.x = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_5.w + u_xlat1.x;
    u_xlat16_6.xyz = u_xlat16_2.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_2.x = min(u_xlat16_10.x, u_xlat16_6.y);
    u_xlat16_10.x = u_xlat16_10.x + (-u_xlat16_6.y);
    u_xlat16_2.x = (-u_xlat16_2.x) + u_xlat16_6.x;
    u_xlat16_18 = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_10.x = u_xlat16_10.x / u_xlat16_18;
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_6.z;
    u_xlat16_10.x = abs(u_xlat16_10.x) + _ColorGradingParams.x;
    u_xlat16_18 = u_xlat16_10.x * 360.0;
    u_xlatb1 = u_xlat16_18>=(-u_xlat16_18);
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_14.y;
    u_xlat16_10.x = fract(u_xlat16_10.x);
    u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_10.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.x = u_xlat16_6.x + 9.99999975e-05;
    u_xlat16_2.x = u_xlat16_2.x / u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x * _ColorGradingParams.y;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _ColorGradingParams.zzz;
    u_xlat16_6.xyz = u_xlat16_2.xyz;
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
    u_xlat16_6.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlatb1 = 0.5<_ColorGradingParams.w;
    u_xlat16_2.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _BGColor.xyz;
    u_xlat16_30 = _SketchIntensity * _BGColor.w;
    u_xlat16_6.xyz = vec3(u_xlat16_30) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _EdgeColor.xyz;
    u_xlat16_30 = _SketchIntensity * _EdgeColor.w;
    u_xlat16_2.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat24) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_10.zzz * u_xlat10_1.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_10.x = -abs(u_xlat16_2.x) + 1.0;
    u_xlatb24 = 0.5<_FresAlphaVector.w;
    u_xlat16_2.x = (u_xlatb24) ? abs(u_xlat16_2.x) : u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat24 = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat24 = u_xlat16_2.x / u_xlat24;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat16_2.x = min(u_xlat24, 1.0);
    u_xlat8 = u_xlat0.y + -0.5;
    u_xlat8 = u_xlat8 * _ScreenParams.x;
    u_xlat8 = u_xlat8 / _ScreenParams.y;
    u_xlat0.x = u_xlat8 + 0.5;
    u_xlatb8.xz = lessThan(vec4(0.5, 0.0, 0.5, 0.5), _MaskVector.xxzz).xz;
    u_xlat16_10.xy = (u_xlatb8.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_10.xy * _MaskVector.yy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_10.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0 = texture2D(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat0.x;
    SV_Target0.w = (u_xlatb8.z) ? u_xlat16_2.x : u_xlat0.x;
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
uniform 	vec4 _BrushTex_ST;
uniform 	mediump vec4 _BrushVector;
uniform 	mediump vec4 _ColorGradingParams;
uniform 	mediump float _SketchIntensity;
uniform 	mediump float _SampleDistance;
uniform 	mediump vec4 _EdgeColor;
uniform 	mediump vec4 _BGColor;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	vec4 _Theseus_ScreenEffectGrabTex_Sketch_TexelSize;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BrushTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Theseus_ScreenEffectGrabTex_Sketch;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
bvec3 u_xlatb8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_14;
bool u_xlatb17;
mediump float u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.xy = u_xlat0.yz * _BrushTex_ST.xy + _BrushTex_ST.zw;
    u_xlat16_1.xy = texture(_BrushTex, u_xlat1.xy).xw;
    u_xlat16_2.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _BrushVector.yzx;
    u_xlat1.xz = u_xlat16_2.xx * _BrushVector.yz + u_xlat0.yz;
    u_xlat1.xzw = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat1.xz).xyz;
    u_xlat3.xy = _Theseus_ScreenEffectGrabTex_Sketch_TexelSize.xy * vec2(vec2(_SampleDistance, _SampleDistance)) + u_xlat16_10.xy;
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + u_xlat0.yzyz;
    u_xlat16_5.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_2.x = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = dot(u_xlat16_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat4 = u_xlat3.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + u_xlat0.yzyz;
    u_xlat16_5.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_18 = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.x = dot(u_xlat16_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x * 2.0 + u_xlat16_6.x;
    u_xlat19.xy = u_xlat0.yz + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_14.x = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_14.x;
    u_xlat16_2.x = (-u_xlat16_2.x) * 2.0 + u_xlat16_10.x;
    u_xlat19.xy = u_xlat0.yz + (-u_xlat3.xy);
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + u_xlat0.yzyz;
    u_xlat16_3.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_10.x = dot(u_xlat16_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_2.x = (-u_xlat16_10.x) + u_xlat16_2.x;
    u_xlat16_3.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_22 = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_22 * 2.0 + u_xlat16_14.x;
    u_xlat16_6.z = dot(u_xlat16_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_6.z + u_xlat16_14.x;
    u_xlat16_18 = (-u_xlat16_18) * 2.0 + u_xlat16_14.x;
    u_xlat16_2.y = (-u_xlat16_10.x) + u_xlat16_18;
    u_xlat16_2.xy = (-u_xlat16_6.zx) + u_xlat16_2.xy;
    u_xlat24 = -abs(u_xlat16_2.x) + 1.0;
    u_xlat24 = -abs(u_xlat16_2.y) + u_xlat24;
    u_xlat24 = max(u_xlat24, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.z>=u_xlat1.w);
#else
    u_xlatb3 = u_xlat1.z>=u_xlat1.w;
#endif
    u_xlat16_2.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat1.wz) + u_xlat1.zw;
    u_xlat16_3.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat1.wz;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_3.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_4.w = (-u_xlat1.x);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat1.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat1.x>=u_xlat16_3.x);
#else
    u_xlatb17 = u_xlat1.x>=u_xlat16_3.x;
#endif
    u_xlat16_2.x = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_5.w + u_xlat1.x;
    u_xlat16_6.xyz = u_xlat16_2.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_2.x = min(u_xlat16_10.x, u_xlat16_6.y);
    u_xlat16_10.x = u_xlat16_10.x + (-u_xlat16_6.y);
    u_xlat16_2.x = (-u_xlat16_2.x) + u_xlat16_6.x;
    u_xlat16_18 = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_10.x = u_xlat16_10.x / u_xlat16_18;
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_6.z;
    u_xlat16_10.x = abs(u_xlat16_10.x) + _ColorGradingParams.x;
    u_xlat16_18 = u_xlat16_10.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_18>=(-u_xlat16_18));
#else
    u_xlatb1 = u_xlat16_18>=(-u_xlat16_18);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_14.y;
    u_xlat16_10.x = fract(u_xlat16_10.x);
    u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_10.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.x = u_xlat16_6.x + 9.99999975e-05;
    u_xlat16_2.x = u_xlat16_2.x / u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x * _ColorGradingParams.y;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _ColorGradingParams.zzz;
    u_xlat1.xzw = log2(abs(u_xlat16_2.xyz));
    u_xlat1.xzw = u_xlat1.xzw * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xzw = exp2(u_xlat1.xzw);
    u_xlat1.xzw = u_xlat1.xzw * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xzw = min(max(u_xlat1.xzw, 0.0), 1.0);
#else
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = (-u_xlat1.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_ColorGradingParams.w);
#else
    u_xlatb1 = 0.5<_ColorGradingParams.w;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _BGColor.xyz;
    u_xlat16_30 = _SketchIntensity * _BGColor.w;
    u_xlat16_6.xyz = vec3(u_xlat16_30) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _EdgeColor.xyz;
    u_xlat16_30 = _SketchIntensity * _EdgeColor.w;
    u_xlat16_2.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat24) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_10.zzz * u_xlat16_1.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_10.x = -abs(u_xlat16_2.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_FresAlphaVector.w);
#else
    u_xlatb24 = 0.5<_FresAlphaVector.w;
#endif
    u_xlat16_2.x = (u_xlatb24) ? abs(u_xlat16_2.x) : u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat24 = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat24 = u_xlat16_2.x / u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat16_2.x = min(u_xlat24, 1.0);
    u_xlat8 = u_xlat0.y + -0.5;
    u_xlat8 = u_xlat8 * _ScreenParams.x;
    u_xlat8 = u_xlat8 / _ScreenParams.y;
    u_xlat0.x = u_xlat8 + 0.5;
    u_xlatb8.xz = lessThan(vec4(0.5, 0.0, 0.5, 0.5), _MaskVector.xxzz).xz;
    u_xlat16_10.xy = (u_xlatb8.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_10.xy * _MaskVector.yy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_10.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0 = texture(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat0.x;
    SV_Target0.w = (u_xlatb8.z) ? u_xlat16_2.x : u_xlat0.x;
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
uniform 	vec4 _BrushTex_ST;
uniform 	mediump vec4 _BrushVector;
uniform 	mediump vec4 _ColorGradingParams;
uniform 	mediump float _SketchIntensity;
uniform 	mediump float _SampleDistance;
uniform 	mediump vec4 _EdgeColor;
uniform 	mediump vec4 _BGColor;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	vec4 _Theseus_ScreenEffectGrabTex_Sketch_TexelSize;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BrushTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Theseus_ScreenEffectGrabTex_Sketch;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
bvec3 u_xlatb8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_14;
bool u_xlatb17;
mediump float u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.xy = u_xlat0.yz * _BrushTex_ST.xy + _BrushTex_ST.zw;
    u_xlat16_1.xy = texture(_BrushTex, u_xlat1.xy).xw;
    u_xlat16_2.x = u_xlat16_1.x * 2.0 + -1.0;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _BrushVector.yzx;
    u_xlat1.xz = u_xlat16_2.xx * _BrushVector.yz + u_xlat0.yz;
    u_xlat1.xzw = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat1.xz).xyz;
    u_xlat3.xy = _Theseus_ScreenEffectGrabTex_Sketch_TexelSize.xy * vec2(vec2(_SampleDistance, _SampleDistance)) + u_xlat16_10.xy;
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + u_xlat0.yzyz;
    u_xlat16_5.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_2.x = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = dot(u_xlat16_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat4 = u_xlat3.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + u_xlat0.yzyz;
    u_xlat16_5.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_18 = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.x = dot(u_xlat16_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x * 2.0 + u_xlat16_6.x;
    u_xlat19.xy = u_xlat0.yz + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_14.x = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_14.x;
    u_xlat16_2.x = (-u_xlat16_2.x) * 2.0 + u_xlat16_10.x;
    u_xlat19.xy = u_xlat0.yz + (-u_xlat3.xy);
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + u_xlat0.yzyz;
    u_xlat16_3.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_10.x = dot(u_xlat16_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_2.x = (-u_xlat16_10.x) + u_xlat16_2.x;
    u_xlat16_3.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_4.xyz = texture(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_22 = dot(u_xlat16_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_22 * 2.0 + u_xlat16_14.x;
    u_xlat16_6.z = dot(u_xlat16_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_6.z + u_xlat16_14.x;
    u_xlat16_18 = (-u_xlat16_18) * 2.0 + u_xlat16_14.x;
    u_xlat16_2.y = (-u_xlat16_10.x) + u_xlat16_18;
    u_xlat16_2.xy = (-u_xlat16_6.zx) + u_xlat16_2.xy;
    u_xlat24 = -abs(u_xlat16_2.x) + 1.0;
    u_xlat24 = -abs(u_xlat16_2.y) + u_xlat24;
    u_xlat24 = max(u_xlat24, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.z>=u_xlat1.w);
#else
    u_xlatb3 = u_xlat1.z>=u_xlat1.w;
#endif
    u_xlat16_2.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat1.wz) + u_xlat1.zw;
    u_xlat16_3.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat1.wz;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_3.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_4.w = (-u_xlat1.x);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat1.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat1.x>=u_xlat16_3.x);
#else
    u_xlatb17 = u_xlat1.x>=u_xlat16_3.x;
#endif
    u_xlat16_2.x = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_5.w + u_xlat1.x;
    u_xlat16_6.xyz = u_xlat16_2.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_2.x = min(u_xlat16_10.x, u_xlat16_6.y);
    u_xlat16_10.x = u_xlat16_10.x + (-u_xlat16_6.y);
    u_xlat16_2.x = (-u_xlat16_2.x) + u_xlat16_6.x;
    u_xlat16_18 = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_10.x = u_xlat16_10.x / u_xlat16_18;
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_6.z;
    u_xlat16_10.x = abs(u_xlat16_10.x) + _ColorGradingParams.x;
    u_xlat16_18 = u_xlat16_10.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_18>=(-u_xlat16_18));
#else
    u_xlatb1 = u_xlat16_18>=(-u_xlat16_18);
#endif
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_14.y;
    u_xlat16_10.x = fract(u_xlat16_10.x);
    u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_10.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.x = u_xlat16_6.x + 9.99999975e-05;
    u_xlat16_2.x = u_xlat16_2.x / u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x * _ColorGradingParams.y;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _ColorGradingParams.zzz;
    u_xlat1.xzw = log2(abs(u_xlat16_2.xyz));
    u_xlat1.xzw = u_xlat1.xzw * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xzw = exp2(u_xlat1.xzw);
    u_xlat1.xzw = u_xlat1.xzw * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xzw = min(max(u_xlat1.xzw, 0.0), 1.0);
#else
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = (-u_xlat1.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_ColorGradingParams.w);
#else
    u_xlatb1 = 0.5<_ColorGradingParams.w;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _BGColor.xyz;
    u_xlat16_30 = _SketchIntensity * _BGColor.w;
    u_xlat16_6.xyz = vec3(u_xlat16_30) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _EdgeColor.xyz;
    u_xlat16_30 = _SketchIntensity * _EdgeColor.w;
    u_xlat16_2.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat24) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_10.zzz * u_xlat16_1.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_10.x = -abs(u_xlat16_2.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_FresAlphaVector.w);
#else
    u_xlatb24 = 0.5<_FresAlphaVector.w;
#endif
    u_xlat16_2.x = (u_xlatb24) ? abs(u_xlat16_2.x) : u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat24 = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat24 = u_xlat16_2.x / u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat16_2.x = min(u_xlat24, 1.0);
    u_xlat8 = u_xlat0.y + -0.5;
    u_xlat8 = u_xlat8 * _ScreenParams.x;
    u_xlat8 = u_xlat8 / _ScreenParams.y;
    u_xlat0.x = u_xlat8 + 0.5;
    u_xlatb8.xz = lessThan(vec4(0.5, 0.0, 0.5, 0.5), _MaskVector.xxzz).xz;
    u_xlat16_10.xy = (u_xlatb8.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_10.xy * _MaskVector.yy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_10.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0 = texture(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat0.x;
    SV_Target0.w = (u_xlatb8.z) ? u_xlat16_2.x : u_xlat0.x;
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
uniform 	vec4 _BrushTex_ST;
uniform 	mediump vec4 _BrushVector;
uniform 	mediump vec4 _ColorGradingParams;
uniform 	mediump float _SketchIntensity;
uniform 	mediump float _SampleDistance;
uniform 	mediump vec4 _EdgeColor;
uniform 	mediump vec4 _BGColor;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	vec4 _Theseus_ScreenEffectGrabTex_Sketch_TexelSize;
uniform lowp sampler2D _BrushTex;
uniform lowp sampler2D _Theseus_ScreenEffectGrabTex_Sketch;
uniform lowp sampler2D _MaskTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec2 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump vec4 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
bvec3 u_xlatb8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_14;
bool u_xlatb17;
mediump float u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.xy = u_xlat0.yz * _BrushTex_ST.xy + _BrushTex_ST.zw;
    u_xlat10_1.xy = texture2D(_BrushTex, u_xlat1.xy).xw;
    u_xlat16_2.x = u_xlat10_1.x * 2.0 + -1.0;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _BrushVector.yzx;
    u_xlat1.xz = u_xlat16_2.xx * _BrushVector.yz + u_xlat0.yz;
    u_xlat1.xzw = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat1.xz).xyz;
    u_xlat3.xy = _Theseus_ScreenEffectGrabTex_Sketch_TexelSize.xy * vec2(vec2(_SampleDistance, _SampleDistance)) + u_xlat16_10.xy;
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + u_xlat0.yzyz;
    u_xlat10_5.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_2.x = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = dot(u_xlat10_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat4 = u_xlat3.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + u_xlat0.yzyz;
    u_xlat10_5.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_18 = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.x = dot(u_xlat10_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x * 2.0 + u_xlat16_6.x;
    u_xlat19.xy = u_xlat0.yz + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_14.x = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_14.x;
    u_xlat16_2.x = (-u_xlat16_2.x) * 2.0 + u_xlat16_10.x;
    u_xlat19.xy = u_xlat0.yz + (-u_xlat3.xy);
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + u_xlat0.yzyz;
    u_xlat10_3.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_10.x = dot(u_xlat10_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_2.x = (-u_xlat16_10.x) + u_xlat16_2.x;
    u_xlat10_3.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_22 = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_22 * 2.0 + u_xlat16_14.x;
    u_xlat16_6.z = dot(u_xlat10_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_6.z + u_xlat16_14.x;
    u_xlat16_18 = (-u_xlat16_18) * 2.0 + u_xlat16_14.x;
    u_xlat16_2.y = (-u_xlat16_10.x) + u_xlat16_18;
    u_xlat16_2.xy = (-u_xlat16_6.zx) + u_xlat16_2.xy;
    u_xlat24 = -abs(u_xlat16_2.x) + 1.0;
    u_xlat24 = -abs(u_xlat16_2.y) + u_xlat24;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlatb3 = u_xlat1.z>=u_xlat1.w;
    u_xlat16_2.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat1.wz) + u_xlat1.zw;
    u_xlat16_3.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat1.wz;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_3.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_4.w = (-u_xlat1.x);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat1.x + u_xlat16_4.x;
    u_xlatb17 = u_xlat1.x>=u_xlat16_3.x;
    u_xlat16_2.x = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_5.w + u_xlat1.x;
    u_xlat16_6.xyz = u_xlat16_2.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_2.x = min(u_xlat16_10.x, u_xlat16_6.y);
    u_xlat16_10.x = u_xlat16_10.x + (-u_xlat16_6.y);
    u_xlat16_2.x = (-u_xlat16_2.x) + u_xlat16_6.x;
    u_xlat16_18 = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_10.x = u_xlat16_10.x / u_xlat16_18;
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_6.z;
    u_xlat16_10.x = abs(u_xlat16_10.x) + _ColorGradingParams.x;
    u_xlat16_18 = u_xlat16_10.x * 360.0;
    u_xlatb1 = u_xlat16_18>=(-u_xlat16_18);
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_14.y;
    u_xlat16_10.x = fract(u_xlat16_10.x);
    u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_10.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.x = u_xlat16_6.x + 9.99999975e-05;
    u_xlat16_2.x = u_xlat16_2.x / u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x * _ColorGradingParams.y;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _ColorGradingParams.zzz;
    u_xlat1.xzw = log2(abs(u_xlat16_2.xyz));
    u_xlat1.xzw = u_xlat1.xzw * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xzw = exp2(u_xlat1.xzw);
    u_xlat1.xzw = u_xlat1.xzw * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
    u_xlat16_6.xyz = (-u_xlat1.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlatb1 = 0.5<_ColorGradingParams.w;
    u_xlat16_2.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _BGColor.xyz;
    u_xlat16_30 = _SketchIntensity * _BGColor.w;
    u_xlat16_6.xyz = vec3(u_xlat16_30) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _EdgeColor.xyz;
    u_xlat16_30 = _SketchIntensity * _EdgeColor.w;
    u_xlat16_2.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat24) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_10.zzz * u_xlat10_1.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_10.x = -abs(u_xlat16_2.x) + 1.0;
    u_xlatb24 = 0.5<_FresAlphaVector.w;
    u_xlat16_2.x = (u_xlatb24) ? abs(u_xlat16_2.x) : u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat24 = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat24 = u_xlat16_2.x / u_xlat24;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat16_2.x = min(u_xlat24, 1.0);
    u_xlat8 = u_xlat0.y + -0.5;
    u_xlat8 = u_xlat8 * _ScreenParams.x;
    u_xlat8 = u_xlat8 / _ScreenParams.y;
    u_xlat0.x = u_xlat8 + 0.5;
    u_xlatb8.xz = lessThan(vec4(0.5, 0.0, 0.5, 0.5), _MaskVector.xxzz).xz;
    u_xlat16_10.xy = (u_xlatb8.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_10.xy * _MaskVector.yy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_10.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0 = texture2D(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat0.x;
    SV_Target0.w = (u_xlatb8.z) ? u_xlat16_2.x : u_xlat0.x;
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
uniform 	vec4 _BrushTex_ST;
uniform 	mediump vec4 _BrushVector;
uniform 	mediump vec4 _ColorGradingParams;
uniform 	mediump float _SketchIntensity;
uniform 	mediump float _SampleDistance;
uniform 	mediump vec4 _EdgeColor;
uniform 	mediump vec4 _BGColor;
uniform 	mediump vec4 _MaskVector;
uniform 	mediump vec4 _FresAlphaVector;
uniform 	vec4 _Theseus_ScreenEffectGrabTex_Sketch_TexelSize;
uniform lowp sampler2D _BrushTex;
uniform lowp sampler2D _Theseus_ScreenEffectGrabTex_Sketch;
uniform lowp sampler2D _MaskTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec2 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump vec4 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
bvec3 u_xlatb8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_14;
bool u_xlatb17;
mediump float u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.xy = u_xlat0.yz * _BrushTex_ST.xy + _BrushTex_ST.zw;
    u_xlat10_1.xy = texture2D(_BrushTex, u_xlat1.xy).xw;
    u_xlat16_2.x = u_xlat10_1.x * 2.0 + -1.0;
    u_xlat16_10.xyz = u_xlat16_2.xxx * _BrushVector.yzx;
    u_xlat1.xz = u_xlat16_2.xx * _BrushVector.yz + u_xlat0.yz;
    u_xlat1.xzw = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat1.xz).xyz;
    u_xlat3.xy = _Theseus_ScreenEffectGrabTex_Sketch_TexelSize.xy * vec2(vec2(_SampleDistance, _SampleDistance)) + u_xlat16_10.xy;
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + u_xlat0.yzyz;
    u_xlat10_5.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_2.x = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = dot(u_xlat10_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat4 = u_xlat3.xyxy * vec4(0.0, -1.0, 1.0, -1.0) + u_xlat0.yzyz;
    u_xlat10_5.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat16_18 = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.x = dot(u_xlat10_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x * 2.0 + u_xlat16_6.x;
    u_xlat19.xy = u_xlat0.yz + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_14.x = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_14.x;
    u_xlat16_2.x = (-u_xlat16_2.x) * 2.0 + u_xlat16_10.x;
    u_xlat19.xy = u_xlat0.yz + (-u_xlat3.xy);
    u_xlat4 = u_xlat3.xyxy * vec4(-1.0, 1.0, 0.0, 1.0) + u_xlat0.yzyz;
    u_xlat10_3.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat19.xy).xyz;
    u_xlat16_10.x = dot(u_xlat10_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_2.x = (-u_xlat16_10.x) + u_xlat16_2.x;
    u_xlat10_3.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture2D(_Theseus_ScreenEffectGrabTex_Sketch, u_xlat4.zw).xyz;
    u_xlat16_22 = dot(u_xlat10_4.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_22 * 2.0 + u_xlat16_14.x;
    u_xlat16_6.z = dot(u_xlat10_3.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_14.x = u_xlat16_6.z + u_xlat16_14.x;
    u_xlat16_18 = (-u_xlat16_18) * 2.0 + u_xlat16_14.x;
    u_xlat16_2.y = (-u_xlat16_10.x) + u_xlat16_18;
    u_xlat16_2.xy = (-u_xlat16_6.zx) + u_xlat16_2.xy;
    u_xlat24 = -abs(u_xlat16_2.x) + 1.0;
    u_xlat24 = -abs(u_xlat16_2.y) + u_xlat24;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlatb3 = u_xlat1.z>=u_xlat1.w;
    u_xlat16_2.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_10.xy = (-u_xlat1.wz) + u_xlat1.zw;
    u_xlat16_3.xy = u_xlat16_2.xx * u_xlat16_10.xy + u_xlat1.wz;
    u_xlat16_10.x = float(1.0);
    u_xlat16_10.y = float(-1.0);
    u_xlat16_3.zw = u_xlat16_2.xx * u_xlat16_10.xy + vec2(-1.0, 0.666666687);
    u_xlat16_4.xyz = (-u_xlat16_3.xyw);
    u_xlat16_4.w = (-u_xlat1.x);
    u_xlat16_5.yzw = u_xlat16_3.yzx + u_xlat16_4.yzw;
    u_xlat16_5.x = u_xlat1.x + u_xlat16_4.x;
    u_xlatb17 = u_xlat1.x>=u_xlat16_3.x;
    u_xlat16_2.x = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_10.x = u_xlat16_2.x * u_xlat16_5.w + u_xlat1.x;
    u_xlat16_6.xyz = u_xlat16_2.xxx * u_xlat16_5.xyz + u_xlat16_3.xyw;
    u_xlat16_2.x = min(u_xlat16_10.x, u_xlat16_6.y);
    u_xlat16_10.x = u_xlat16_10.x + (-u_xlat16_6.y);
    u_xlat16_2.x = (-u_xlat16_2.x) + u_xlat16_6.x;
    u_xlat16_18 = u_xlat16_2.x * 6.0 + 9.99999975e-05;
    u_xlat16_10.x = u_xlat16_10.x / u_xlat16_18;
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_6.z;
    u_xlat16_10.x = abs(u_xlat16_10.x) + _ColorGradingParams.x;
    u_xlat16_18 = u_xlat16_10.x * 360.0;
    u_xlatb1 = u_xlat16_18>=(-u_xlat16_18);
    u_xlat16_14.xy = (bool(u_xlatb1)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_14.y;
    u_xlat16_10.x = fract(u_xlat16_10.x);
    u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_10.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.x = u_xlat16_6.x + 9.99999975e-05;
    u_xlat16_2.x = u_xlat16_2.x / u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x * _ColorGradingParams.y;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _ColorGradingParams.zzz;
    u_xlat1.xzw = log2(abs(u_xlat16_2.xyz));
    u_xlat1.xzw = u_xlat1.xzw * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xzw = exp2(u_xlat1.xzw);
    u_xlat1.xzw = u_xlat1.xzw * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
    u_xlat16_6.xyz = (-u_xlat1.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlatb1 = 0.5<_ColorGradingParams.w;
    u_xlat16_2.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _BGColor.xyz;
    u_xlat16_30 = _SketchIntensity * _BGColor.w;
    u_xlat16_6.xyz = vec3(u_xlat16_30) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + _EdgeColor.xyz;
    u_xlat16_30 = _SketchIntensity * _EdgeColor.w;
    u_xlat16_2.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat24) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_10.zzz * u_xlat10_1.yyy + u_xlat16_2.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_10.x = -abs(u_xlat16_2.x) + 1.0;
    u_xlatb24 = 0.5<_FresAlphaVector.w;
    u_xlat16_2.x = (u_xlatb24) ? abs(u_xlat16_2.x) : u_xlat16_10.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_FresAlphaVector.y);
    u_xlat24 = max(_FresAlphaVector.z, 0.00100000005);
    u_xlat24 = u_xlat16_2.x / u_xlat24;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat16_2.x = min(u_xlat24, 1.0);
    u_xlat8 = u_xlat0.y + -0.5;
    u_xlat8 = u_xlat8 * _ScreenParams.x;
    u_xlat8 = u_xlat8 / _ScreenParams.y;
    u_xlat0.x = u_xlat8 + 0.5;
    u_xlatb8.xz = lessThan(vec4(0.5, 0.0, 0.5, 0.5), _MaskVector.xxzz).xz;
    u_xlat16_10.xy = (u_xlatb8.x) ? u_xlat0.xz : vs_TEXCOORD0.xy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_10.xy * _MaskVector.yy;
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat16_10.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0 = texture2D(_MaskTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * _FresAlphaVector.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat0.x;
    SV_Target0.w = (u_xlatb8.z) ? u_xlat16_2.x : u_xlat0.x;
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
CustomEditor "HeroShowRenderingGUI.VFX.ScreenEffectSketchShaderGUI"
}