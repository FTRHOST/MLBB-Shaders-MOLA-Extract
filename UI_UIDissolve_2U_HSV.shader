//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/UIDissolve_2U_HSV" {
Properties {

_Tex ("Tex", 2D) = "white" { }

_TexColor ("TexColor", Color) = (1,1,1,0)

_FinalAlpha ("FinalAlpha", Float) = 0.0

_Diffuse2 ("Diffuse2", 2D) = "black" { }

_Diffuse2_Color ("Diffuse2_Color", Color) = (1,1,1,1)

_Diffuse2_Intensity ("Diffuse2_整体透明度", Float) = 1.0

_Diffuse2_AnseClor ("Diffuse2_AnseClor", Color) = (1,1,1,1)

_Diffuse2_AnseIntensity ("Diffuse2_AnseIntensity", Range(0, 1)) = -0.10000000149011612

_Diffuse2_Mask_Tiling_Offset ("Diffuse2_出生遮罩", Vector) = (1,1,0,0)

_Saoguang_Ramp ("Saoguang_Ramp", 2D) = "black" { }

_Diffuse2_saoguang_Tiling_Paner ("Diffuse2_saoguang_流动", Vector) = (1,1,1,1)

_Saoguang_Intensity ("Saoguang_Intensity", Float) = 1.0

_Saoguang_Color ("Saoguang_Color", Color) = (1,1,1,1)

_DissolveTex ("DissolveTex", 2D) = "white" { }

_DissolveAmount ("Dissolve_溶解强度", Range(-1, 1)) = -1.0

_Dissolve_Diraciton_Transform ("Dissolve_溶解中心位置", Vector) = (1,1,0,0)

_DirectionSize ("Direction溶解中心大小", Float) = 2.0

_Dissolve_bianyuan ("Dissolve_溶解软两边渐变度", Vector) = (0.5,1,0.5,1)

_DissolveColor ("DissolveColor", Color) = (1,1,1,1)

_Dissovle_fanwei ("Dissovle_溶解锯齿范围", Float) = 5.0

_Dissolve_Color_Fanwei ("Dissolve_溶解软边颜色范围", Float) = 1.0

_DissolveColor_Intensity ("Dissolve_溶解软边颜色强度", Float) = 1.0

_Hue ("色相", Range(-0.5, 0.5)) = 0.0

_Saturation ("饱和度", Range(0, 2)) = 1.0

_Contrast ("对比度", Range(0, 2)) = 1.0

[Header(Stencil)] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _MLZWrite ("ZWrite", Float) = 0.0

[Enum(On, 0,Off, 4)] _MLZTest ("总是最前", Float) = 4.0

_StencilRef ("StencilRef", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "Unlit"
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 13227
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _Tex_ST;
uniform 	vec4 _Diffuse2_ST;
uniform 	vec4 _Diffuse2_AnseClor;
uniform 	float _Diffuse2_AnseIntensity;
uniform 	float _Diffuse2_Intensity;
uniform 	vec4 _TexColor;
uniform 	vec4 _Dissolve_bianyuan;
uniform 	float _DissolveAmount;
uniform 	vec4 _Dissolve_Diraciton_Transform;
uniform 	float _DirectionSize;
uniform 	float _Dissovle_fanwei;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _Dissolve_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Intensity;
uniform 	vec4 _Diffuse2_Color;
uniform 	vec4 _Diffuse2_saoguang_Tiling_Paner;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Diffuse2_Mask_Tiling_Offset;
uniform 	float _FinalAlpha;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse2;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Tex;
UNITY_LOCATION(3) uniform mediump sampler2D _Saoguang_Ramp;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
mediump vec2 u_xlat16_7;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
mediump float u_xlat16_13;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.zw * _Dissolve_Diraciton_Transform.xy + _Dissolve_Diraciton_Transform.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _DirectionSize;
    u_xlat4.x = _DissolveAmount + 1.0;
    u_xlat0.x = (-u_xlat0.x) + u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Dissovle_fanwei, _Dissovle_fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Dissovle_fanwei);
    u_xlat4.xy = vs_TEXCOORD0.zw * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat16_4 + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xx + (-_Dissolve_bianyuan.xz);
    u_xlat8.xy = (-_Dissolve_bianyuan.xz) + _Dissolve_bianyuan.yw;
    u_xlat8.xy = vec2(1.0, 1.0) / u_xlat8.xy;
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat4.x = dot(u_xlat0.yy, vec2(_Dissolve_Color_Fanwei));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat4.x = u_xlat4.x + (-_Dissolve_Color_Fanwei);
    u_xlat4.x = min(abs(u_xlat4.x), 1.0);
    u_xlat1.x = (-u_xlat4.x) + 1.0;
    u_xlat1.y = 0.0;
    u_xlat16_4 = texture(_Saoguang_Ramp, u_xlat1.xy).y;
    u_xlat4.x = u_xlat16_4 * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xxx * _DissolveColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_DissolveColor_Intensity);
    u_xlat4.xyz = u_xlat4.xyz * _DissolveColor.www;
    u_xlat1.xyz = (-_Diffuse2_AnseClor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xy = vs_TEXCOORD0.zw * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_13 = texture(_Diffuse2, u_xlat2.xy).x;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_13);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Diffuse2_AnseIntensity);
    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
    u_xlat16_2 = texture(_Tex, u_xlat2.xy);
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(vec3(_Diffuse2_Intensity, _Diffuse2_Intensity, _Diffuse2_Intensity)) + u_xlat16_2.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.w;
    u_xlat0.x = u_xlat0.x * _FinalAlpha;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_3.xyz = u_xlat1.xyz * _TexColor.xyz + u_xlat4.xyz;
    u_xlat0.xy = vs_TEXCOORD0.zw * _Diffuse2_saoguang_Tiling_Paner.xy;
    u_xlat0.xy = _Time.yy * _Diffuse2_saoguang_Tiling_Paner.zw + u_xlat0.xy;
    u_xlat16_0 = texture(_Saoguang_Ramp, u_xlat0.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * _Saoguang_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Saoguang_Color.www;
    u_xlat0.xyz = vec3(u_xlat16_13) * u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat16_13) * _Diffuse2_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Saoguang_Intensity);
    u_xlat0.xyz = u_xlat1.xyz * _Diffuse2_Color.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Diffuse2_Intensity, _Diffuse2_Intensity, _Diffuse2_Intensity));
    u_xlat12 = vs_TEXCOORD0.w * _Diffuse2_Mask_Tiling_Offset.y + _Diffuse2_Mask_Tiling_Offset.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_3.xyz;
    u_xlat0.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb8 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_15 = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat0.xy = vec2(u_xlat16_15) * u_xlat0.xy + u_xlat16_3.zy;
    u_xlat1.w = (-u_xlat16_3.x);
    u_xlat2.x = float(1.0);
    u_xlat2.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_15) * u_xlat2.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat2.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat2.x = u_xlat1.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_3.x>=u_xlat0.x);
#else
    u_xlatb8 = u_xlat16_3.x>=u_xlat0.x;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat8.x * u_xlat2.w + u_xlat16_3.x;
    u_xlat0.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat0.xyw;
    u_xlat12 = min(u_xlat0.y, u_xlat1.x);
    u_xlat4.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat12 = (-u_xlat12) + u_xlat0.x;
    u_xlat1.x = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat4.x = u_xlat4.x / u_xlat1.x;
    u_xlat4.x = u_xlat4.x + u_xlat0.z;
    u_xlat16_3.x = abs(u_xlat4.x) + _Hue;
    u_xlat16_7.x = u_xlat16_3.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_7.x>=(-u_xlat16_7.x));
#else
    u_xlatb4 = u_xlat16_7.x>=(-u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb4)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_7.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat1.xyz = u_xlat16_7.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = u_xlat0.x + 1.00000001e-10;
    u_xlat4.x = u_xlat12 / u_xlat4.x;
    u_xlat16_3.x = u_xlat4.x * _Saturation;
    u_xlat4.xyz = u_xlat16_3.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    SV_Target0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _Tex_ST;
uniform 	vec4 _Diffuse2_ST;
uniform 	vec4 _Diffuse2_AnseClor;
uniform 	float _Diffuse2_AnseIntensity;
uniform 	float _Diffuse2_Intensity;
uniform 	vec4 _TexColor;
uniform 	vec4 _Dissolve_bianyuan;
uniform 	float _DissolveAmount;
uniform 	vec4 _Dissolve_Diraciton_Transform;
uniform 	float _DirectionSize;
uniform 	float _Dissovle_fanwei;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _Dissolve_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Intensity;
uniform 	vec4 _Diffuse2_Color;
uniform 	vec4 _Diffuse2_saoguang_Tiling_Paner;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Diffuse2_Mask_Tiling_Offset;
uniform 	float _FinalAlpha;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse2;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Tex;
UNITY_LOCATION(3) uniform mediump sampler2D _Saoguang_Ramp;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
mediump vec2 u_xlat16_7;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
mediump float u_xlat16_13;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.zw * _Dissolve_Diraciton_Transform.xy + _Dissolve_Diraciton_Transform.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _DirectionSize;
    u_xlat4.x = _DissolveAmount + 1.0;
    u_xlat0.x = (-u_xlat0.x) + u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Dissovle_fanwei, _Dissovle_fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Dissovle_fanwei);
    u_xlat4.xy = vs_TEXCOORD0.zw * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat16_4 + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xx + (-_Dissolve_bianyuan.xz);
    u_xlat8.xy = (-_Dissolve_bianyuan.xz) + _Dissolve_bianyuan.yw;
    u_xlat8.xy = vec2(1.0, 1.0) / u_xlat8.xy;
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat4.x = dot(u_xlat0.yy, vec2(_Dissolve_Color_Fanwei));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat4.x = u_xlat4.x + (-_Dissolve_Color_Fanwei);
    u_xlat4.x = min(abs(u_xlat4.x), 1.0);
    u_xlat1.x = (-u_xlat4.x) + 1.0;
    u_xlat1.y = 0.0;
    u_xlat16_4 = texture(_Saoguang_Ramp, u_xlat1.xy).y;
    u_xlat4.x = u_xlat16_4 * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xxx * _DissolveColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_DissolveColor_Intensity);
    u_xlat4.xyz = u_xlat4.xyz * _DissolveColor.www;
    u_xlat1.xyz = (-_Diffuse2_AnseClor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xy = vs_TEXCOORD0.zw * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_13 = texture(_Diffuse2, u_xlat2.xy).x;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_13);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Diffuse2_AnseIntensity);
    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
    u_xlat16_2 = texture(_Tex, u_xlat2.xy);
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(vec3(_Diffuse2_Intensity, _Diffuse2_Intensity, _Diffuse2_Intensity)) + u_xlat16_2.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.w;
    u_xlat0.x = u_xlat0.x * _FinalAlpha;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_3.xyz = u_xlat1.xyz * _TexColor.xyz + u_xlat4.xyz;
    u_xlat0.xy = vs_TEXCOORD0.zw * _Diffuse2_saoguang_Tiling_Paner.xy;
    u_xlat0.xy = _Time.yy * _Diffuse2_saoguang_Tiling_Paner.zw + u_xlat0.xy;
    u_xlat16_0 = texture(_Saoguang_Ramp, u_xlat0.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * _Saoguang_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Saoguang_Color.www;
    u_xlat0.xyz = vec3(u_xlat16_13) * u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat16_13) * _Diffuse2_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Saoguang_Intensity);
    u_xlat0.xyz = u_xlat1.xyz * _Diffuse2_Color.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Diffuse2_Intensity, _Diffuse2_Intensity, _Diffuse2_Intensity));
    u_xlat12 = vs_TEXCOORD0.w * _Diffuse2_Mask_Tiling_Offset.y + _Diffuse2_Mask_Tiling_Offset.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_3.xyz;
    u_xlat0.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb8 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_15 = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat0.xy = vec2(u_xlat16_15) * u_xlat0.xy + u_xlat16_3.zy;
    u_xlat1.w = (-u_xlat16_3.x);
    u_xlat2.x = float(1.0);
    u_xlat2.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_15) * u_xlat2.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat2.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat2.x = u_xlat1.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_3.x>=u_xlat0.x);
#else
    u_xlatb8 = u_xlat16_3.x>=u_xlat0.x;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat8.x * u_xlat2.w + u_xlat16_3.x;
    u_xlat0.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat0.xyw;
    u_xlat12 = min(u_xlat0.y, u_xlat1.x);
    u_xlat4.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat12 = (-u_xlat12) + u_xlat0.x;
    u_xlat1.x = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat4.x = u_xlat4.x / u_xlat1.x;
    u_xlat4.x = u_xlat4.x + u_xlat0.z;
    u_xlat16_3.x = abs(u_xlat4.x) + _Hue;
    u_xlat16_7.x = u_xlat16_3.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_7.x>=(-u_xlat16_7.x));
#else
    u_xlatb4 = u_xlat16_7.x>=(-u_xlat16_7.x);
#endif
    u_xlat16_7.xy = (bool(u_xlatb4)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_7.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat1.xyz = u_xlat16_7.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = u_xlat0.x + 1.00000001e-10;
    u_xlat4.x = u_xlat12 / u_xlat4.x;
    u_xlat16_3.x = u_xlat4.x * _Saturation;
    u_xlat4.xyz = u_xlat16_3.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    SV_Target0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _Tex_ST;
uniform 	vec4 _Diffuse2_ST;
uniform 	vec4 _Diffuse2_AnseClor;
uniform 	float _Diffuse2_AnseIntensity;
uniform 	float _Diffuse2_Intensity;
uniform 	vec4 _TexColor;
uniform 	vec4 _Dissolve_bianyuan;
uniform 	float _DissolveAmount;
uniform 	vec4 _Dissolve_Diraciton_Transform;
uniform 	float _DirectionSize;
uniform 	float _Dissovle_fanwei;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _Dissolve_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Intensity;
uniform 	vec4 _Diffuse2_Color;
uniform 	vec4 _Diffuse2_saoguang_Tiling_Paner;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Diffuse2_Mask_Tiling_Offset;
uniform 	float _FinalAlpha;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform lowp sampler2D _Diffuse2;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Tex;
uniform lowp sampler2D _Saoguang_Ramp;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
mediump vec2 u_xlat16_7;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
lowp float u_xlat10_13;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.zw * _Dissolve_Diraciton_Transform.xy + _Dissolve_Diraciton_Transform.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _DirectionSize;
    u_xlat4.x = _DissolveAmount + 1.0;
    u_xlat0.x = (-u_xlat0.x) + u_xlat4.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Dissovle_fanwei, _Dissovle_fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Dissovle_fanwei);
    u_xlat4.xy = vs_TEXCOORD0.zw * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat10_4 + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xx + (-_Dissolve_bianyuan.xz);
    u_xlat8.xy = (-_Dissolve_bianyuan.xz) + _Dissolve_bianyuan.yw;
    u_xlat8.xy = vec2(1.0, 1.0) / u_xlat8.xy;
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat8.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat4.x = dot(u_xlat0.yy, vec2(_Dissolve_Color_Fanwei));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat4.x = u_xlat4.x + (-_Dissolve_Color_Fanwei);
    u_xlat4.x = min(abs(u_xlat4.x), 1.0);
    u_xlat1.x = (-u_xlat4.x) + 1.0;
    u_xlat1.y = 0.0;
    u_xlat10_4 = texture2D(_Saoguang_Ramp, u_xlat1.xy).y;
    u_xlat4.x = u_xlat10_4 * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xxx * _DissolveColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_DissolveColor_Intensity);
    u_xlat4.xyz = u_xlat4.xyz * _DissolveColor.www;
    u_xlat1.xyz = (-_Diffuse2_AnseClor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xy = vs_TEXCOORD0.zw * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_13 = texture2D(_Diffuse2, u_xlat2.xy).x;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat10_13);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Diffuse2_AnseIntensity);
    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy);
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(vec3(_Diffuse2_Intensity, _Diffuse2_Intensity, _Diffuse2_Intensity)) + u_xlat10_2.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat10_2.w;
    u_xlat0.x = u_xlat0.x * _FinalAlpha;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_3.xyz = u_xlat1.xyz * _TexColor.xyz + u_xlat4.xyz;
    u_xlat0.xy = vs_TEXCOORD0.zw * _Diffuse2_saoguang_Tiling_Paner.xy;
    u_xlat0.xy = _Time.yy * _Diffuse2_saoguang_Tiling_Paner.zw + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Saoguang_Ramp, u_xlat0.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_0) * _Saoguang_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Saoguang_Color.www;
    u_xlat0.xyz = vec3(u_xlat10_13) * u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat10_13) * _Diffuse2_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Saoguang_Intensity);
    u_xlat0.xyz = u_xlat1.xyz * _Diffuse2_Color.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Diffuse2_Intensity, _Diffuse2_Intensity, _Diffuse2_Intensity));
    u_xlat12 = vs_TEXCOORD0.w * _Diffuse2_Mask_Tiling_Offset.y + _Diffuse2_Mask_Tiling_Offset.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_3.xyz;
    u_xlat0.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
    u_xlatb8 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_15 = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat0.xy = vec2(u_xlat16_15) * u_xlat0.xy + u_xlat16_3.zy;
    u_xlat1.w = (-u_xlat16_3.x);
    u_xlat2.x = float(1.0);
    u_xlat2.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_15) * u_xlat2.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat2.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat2.x = u_xlat1.x + u_xlat16_3.x;
    u_xlatb8 = u_xlat16_3.x>=u_xlat0.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat8.x * u_xlat2.w + u_xlat16_3.x;
    u_xlat0.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat0.xyw;
    u_xlat12 = min(u_xlat0.y, u_xlat1.x);
    u_xlat4.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat12 = (-u_xlat12) + u_xlat0.x;
    u_xlat1.x = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat4.x = u_xlat4.x / u_xlat1.x;
    u_xlat4.x = u_xlat4.x + u_xlat0.z;
    u_xlat16_3.x = abs(u_xlat4.x) + _Hue;
    u_xlat16_7.x = u_xlat16_3.x * 360.0;
    u_xlatb4 = u_xlat16_7.x>=(-u_xlat16_7.x);
    u_xlat16_7.xy = (bool(u_xlatb4)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_7.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat1.xyz = u_xlat16_7.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = u_xlat0.x + 1.00000001e-10;
    u_xlat4.x = u_xlat12 / u_xlat4.x;
    u_xlat16_3.x = u_xlat4.x * _Saturation;
    u_xlat4.xyz = u_xlat16_3.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    SV_Target0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _Tex_ST;
uniform 	vec4 _Diffuse2_ST;
uniform 	vec4 _Diffuse2_AnseClor;
uniform 	float _Diffuse2_AnseIntensity;
uniform 	float _Diffuse2_Intensity;
uniform 	vec4 _TexColor;
uniform 	vec4 _Dissolve_bianyuan;
uniform 	float _DissolveAmount;
uniform 	vec4 _Dissolve_Diraciton_Transform;
uniform 	float _DirectionSize;
uniform 	float _Dissovle_fanwei;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _Dissolve_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Intensity;
uniform 	vec4 _Diffuse2_Color;
uniform 	vec4 _Diffuse2_saoguang_Tiling_Paner;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Diffuse2_Mask_Tiling_Offset;
uniform 	float _FinalAlpha;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform lowp sampler2D _Diffuse2;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Tex;
uniform lowp sampler2D _Saoguang_Ramp;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
mediump vec2 u_xlat16_7;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
lowp float u_xlat10_13;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.zw * _Dissolve_Diraciton_Transform.xy + _Dissolve_Diraciton_Transform.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _DirectionSize;
    u_xlat4.x = _DissolveAmount + 1.0;
    u_xlat0.x = (-u_xlat0.x) + u_xlat4.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Dissovle_fanwei, _Dissovle_fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Dissovle_fanwei);
    u_xlat4.xy = vs_TEXCOORD0.zw * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat10_4 + u_xlat0.x;
    u_xlat0.xy = u_xlat0.xx + (-_Dissolve_bianyuan.xz);
    u_xlat8.xy = (-_Dissolve_bianyuan.xz) + _Dissolve_bianyuan.yw;
    u_xlat8.xy = vec2(1.0, 1.0) / u_xlat8.xy;
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat8.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat8.xy;
    u_xlat4.x = dot(u_xlat0.yy, vec2(_Dissolve_Color_Fanwei));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat4.x = u_xlat4.x + (-_Dissolve_Color_Fanwei);
    u_xlat4.x = min(abs(u_xlat4.x), 1.0);
    u_xlat1.x = (-u_xlat4.x) + 1.0;
    u_xlat1.y = 0.0;
    u_xlat10_4 = texture2D(_Saoguang_Ramp, u_xlat1.xy).y;
    u_xlat4.x = u_xlat10_4 * u_xlat1.x;
    u_xlat4.xyz = u_xlat4.xxx * _DissolveColor.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_DissolveColor_Intensity);
    u_xlat4.xyz = u_xlat4.xyz * _DissolveColor.www;
    u_xlat1.xyz = (-_Diffuse2_AnseClor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xy = vs_TEXCOORD0.zw * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_13 = texture2D(_Diffuse2, u_xlat2.xy).x;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat10_13);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Diffuse2_AnseIntensity);
    u_xlat2.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
    u_xlat10_2 = texture2D(_Tex, u_xlat2.xy);
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(vec3(_Diffuse2_Intensity, _Diffuse2_Intensity, _Diffuse2_Intensity)) + u_xlat10_2.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat10_2.w;
    u_xlat0.x = u_xlat0.x * _FinalAlpha;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_3.xyz = u_xlat1.xyz * _TexColor.xyz + u_xlat4.xyz;
    u_xlat0.xy = vs_TEXCOORD0.zw * _Diffuse2_saoguang_Tiling_Paner.xy;
    u_xlat0.xy = _Time.yy * _Diffuse2_saoguang_Tiling_Paner.zw + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Saoguang_Ramp, u_xlat0.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_0) * _Saoguang_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Saoguang_Color.www;
    u_xlat0.xyz = vec3(u_xlat10_13) * u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat10_13) * _Diffuse2_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Saoguang_Intensity);
    u_xlat0.xyz = u_xlat1.xyz * _Diffuse2_Color.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Diffuse2_Intensity, _Diffuse2_Intensity, _Diffuse2_Intensity));
    u_xlat12 = vs_TEXCOORD0.w * _Diffuse2_Mask_Tiling_Offset.y + _Diffuse2_Mask_Tiling_Offset.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_3.xyz;
    u_xlat0.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
    u_xlatb8 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_15 = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat0.xy = vec2(u_xlat16_15) * u_xlat0.xy + u_xlat16_3.zy;
    u_xlat1.w = (-u_xlat16_3.x);
    u_xlat2.x = float(1.0);
    u_xlat2.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_15) * u_xlat2.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat2.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat2.x = u_xlat1.x + u_xlat16_3.x;
    u_xlatb8 = u_xlat16_3.x>=u_xlat0.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat8.x * u_xlat2.w + u_xlat16_3.x;
    u_xlat0.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat0.xyw;
    u_xlat12 = min(u_xlat0.y, u_xlat1.x);
    u_xlat4.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat12 = (-u_xlat12) + u_xlat0.x;
    u_xlat1.x = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat4.x = u_xlat4.x / u_xlat1.x;
    u_xlat4.x = u_xlat4.x + u_xlat0.z;
    u_xlat16_3.x = abs(u_xlat4.x) + _Hue;
    u_xlat16_7.x = u_xlat16_3.x * 360.0;
    u_xlatb4 = u_xlat16_7.x>=(-u_xlat16_7.x);
    u_xlat16_7.xy = (bool(u_xlatb4)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_7.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat1.xyz = u_xlat16_7.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = u_xlat0.x + 1.00000001e-10;
    u_xlat4.x = u_xlat12 / u_xlat4.x;
    u_xlat16_3.x = u_xlat4.x * _Saturation;
    u_xlat4.xyz = u_xlat16_3.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    SV_Target0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
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
}
}