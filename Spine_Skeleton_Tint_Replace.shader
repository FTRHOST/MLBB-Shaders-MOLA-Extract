//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Spine/Skeleton Tint Replace" {
Properties {

[Header(Base)] _Color ("Tint Color", Color) = (1,1,1,1)

_Black ("Dark Color", Color) = (0,0,0,0)

_MainTex ("基础色贴图", 2D) = "white" { }

_ChangeColorTex ("换色后基础色贴图", 2D) = "white" { }

[Toggle(_STRAIGHT_ALPHA_INPUT)] _StraightAlphaInput ("Straight Alpha Texture", Float) = 0.0

_Cutoff ("Shadow alpha cutoff", Range(0, 1)) = 0.10000000149011612

[Toggle(_DARK_COLOR_ALPHA_ADDITIVE)] _DarkColorAlphaAdditive ("Additive DarkColor.A", Float) = 0.0

_StencilRef ("Stencil Reference", Float) = 1.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("Stencil Comparison", Float) = 8.0

[Header(Dissolve Change Color)] [Toggle(_SHOW_UV_AREA)] _ShowDissolveArea ("显示映射后UV区域(红色)", Float) = 0.0

_VcertexUVOffsetScale ("映射UV区域(xy:位移;z:缩放)", Vector) = (0,0,1,1)

_Saoguang_Ramp ("换色溶解边缘Ramp(RGB)", 2D) = "white" { }

_DissolveMap ("换色溶解纹理", 2D) = "white" { }

_DissolveAmount ("Dissolve_换色进度", Range(-1, 2)) = -1.0

[Enum(Circle,0,Square,1,Rhombus,2)] _Dissolve_Shape ("换色形状", Float) = 0.0

_Dissolve_Diraciton_Transform ("Dissolve_换色溶解中心位置", Vector) = (1,1,0,0)

_DirectionSize ("Direction换色溶解中心长宽", Vector) = (1,1,0,0)

_Dissolve_bianyuan ("Dissolve_换色溶解软两边渐变度", Vector) = (0.5,1,0.5,1)

_DissolveEdgeColor ("换色溶解边缘颜色", Color) = (1,1,1,1)

_Dissovle_fanwei ("Dissovle_换色溶解锯齿范围", Float) = 5.0

_Dissolve_Color_Fanwei ("Dissolve_换色溶解软边颜色范围", Float) = 1.0

_DissolveColor_Intensity ("Dissolve_换色溶解软边颜色强度", Float) = 1.0

_OutlineWidth ("Outline Width", Range(0, 8)) = 3.0

_OutlineColor ("Outline Color", Color) = (1,1,0,1)

_OutlineReferenceTexWidth ("Reference Texture Width", Float) = 1024.0

_ThresholdEnd ("Outline Threshold", Range(0, 1)) = 0.25

_OutlineSmoothness ("Outline Smoothness", Range(0, 1)) = 1.0

[MaterialToggle(_USE8NEIGHBOURHOOD_ON)] _Use8Neighbourhood ("Sample 8 Neighbours", Float) = 1.0

_OutlineMipLevel ("Outline Mip Level", Range(0, 3)) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "Normal"
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 35066
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
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
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
    vs_TEXCOORD1.xyz = in_POSITION0.xyz;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	vec4 _VcertexUVOffsetScale;
uniform 	vec4 _Dissolve_bianyuan;
uniform 	float _DissolveAmount;
uniform 	int _Dissolve_Shape;
uniform 	vec4 _Dissolve_Diraciton_Transform;
uniform 	mediump vec2 _DirectionSize;
uniform 	float _Dissovle_fanwei;
uniform 	vec4 _DissolveMap_ST;
uniform 	float _Dissolve_Color_Fanwei;
uniform 	vec4 _DissolveEdgeColor;
uniform 	float _DissolveColor_Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ChangeColorTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Saoguang_Ramp;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat6;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD1.xy) + _VcertexUVOffsetScale.xy;
    u_xlat0.xy = u_xlat0.xy / _VcertexUVOffsetScale.zz;
    u_xlat6.xy = u_xlat0.xy * _Dissolve_Diraciton_Transform.xy + _Dissolve_Diraciton_Transform.zw;
    u_xlat0.xy = u_xlat0.xy * _DissolveMap_ST.xy + _DissolveMap_ST.zw;
    u_xlat16_0 = texture(_DissolveMap, u_xlat0.xy).x;
    u_xlat3.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x / _DirectionSize.x;
    u_xlat3.x = (_Dissolve_Shape != 0) ? 0.0 : u_xlat3.x;
    u_xlat1.xy = (-_DirectionSize.xy) * vec2(0.100000001, 0.100000001) + abs(u_xlat6.xy);
    u_xlat6.xy = abs(u_xlat6.xy) / _DirectionSize.xy;
    u_xlat6.x = u_xlat6.y + u_xlat6.x;
    u_xlat9 = max(u_xlat1.y, u_xlat1.x);
    u_xlatb1.xy = equal(ivec4(ivec4(_Dissolve_Shape, _Dissolve_Shape, _Dissolve_Shape, _Dissolve_Shape)), ivec4(1, 2, 0, 0)).xy;
    u_xlat3.x = (u_xlatb1.x) ? u_xlat9 : u_xlat3.x;
    u_xlat3.x = (u_xlatb1.y) ? u_xlat6.x : u_xlat3.x;
    u_xlat6.x = _DissolveAmount + 1.0;
    u_xlat3.x = (-u_xlat3.x) + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = dot(u_xlat3.xx, vec2(_Dissovle_fanwei));
    u_xlat3.x = u_xlat3.x + (-_Dissovle_fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat3.x;
    u_xlat0.xy = u_xlat0.xx + (-_Dissolve_bianyuan.xz);
    u_xlat6.xy = (-_Dissolve_bianyuan.xz) + _Dissolve_bianyuan.yw;
    u_xlat6.xy = vec2(1.0, 1.0) / u_xlat6.xy;
    u_xlat0.xy = u_xlat6.xy * u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat6.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy;
    u_xlat3.x = dot(u_xlat0.yy, vec2(_Dissolve_Color_Fanwei));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3.x = u_xlat3.x + (-_Dissolve_Color_Fanwei);
    u_xlat3.x = min(abs(u_xlat3.x), 1.0);
    u_xlat1.x = (-u_xlat3.x) + 1.0;
    u_xlat1.y = 0.0;
    u_xlat16_3.xyz = texture(_Saoguang_Ramp, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat1.xxx;
    u_xlat3.xyz = u_xlat3.xyz * _DissolveEdgeColor.xyz;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_2 = texture(_ChangeColorTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = (-u_xlat16_1.xyz) + u_xlat16_2.xyz;
    u_xlat10 = min(u_xlat16_1.w, u_xlat16_2.w);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_DissolveColor_Intensity) + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(u_xlat10);
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat0.xyz;
    SV_Target0.w = u_xlat10 * vs_COLOR0.w;
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
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
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
    vs_TEXCOORD1.xyz = in_POSITION0.xyz;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	vec4 _VcertexUVOffsetScale;
uniform 	vec4 _Dissolve_bianyuan;
uniform 	float _DissolveAmount;
uniform 	int _Dissolve_Shape;
uniform 	vec4 _Dissolve_Diraciton_Transform;
uniform 	mediump vec2 _DirectionSize;
uniform 	float _Dissovle_fanwei;
uniform 	vec4 _DissolveMap_ST;
uniform 	float _Dissolve_Color_Fanwei;
uniform 	vec4 _DissolveEdgeColor;
uniform 	float _DissolveColor_Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ChangeColorTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Saoguang_Ramp;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat6;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD1.xy) + _VcertexUVOffsetScale.xy;
    u_xlat0.xy = u_xlat0.xy / _VcertexUVOffsetScale.zz;
    u_xlat6.xy = u_xlat0.xy * _Dissolve_Diraciton_Transform.xy + _Dissolve_Diraciton_Transform.zw;
    u_xlat0.xy = u_xlat0.xy * _DissolveMap_ST.xy + _DissolveMap_ST.zw;
    u_xlat16_0 = texture(_DissolveMap, u_xlat0.xy).x;
    u_xlat3.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x / _DirectionSize.x;
    u_xlat3.x = (_Dissolve_Shape != 0) ? 0.0 : u_xlat3.x;
    u_xlat1.xy = (-_DirectionSize.xy) * vec2(0.100000001, 0.100000001) + abs(u_xlat6.xy);
    u_xlat6.xy = abs(u_xlat6.xy) / _DirectionSize.xy;
    u_xlat6.x = u_xlat6.y + u_xlat6.x;
    u_xlat9 = max(u_xlat1.y, u_xlat1.x);
    u_xlatb1.xy = equal(ivec4(ivec4(_Dissolve_Shape, _Dissolve_Shape, _Dissolve_Shape, _Dissolve_Shape)), ivec4(1, 2, 0, 0)).xy;
    u_xlat3.x = (u_xlatb1.x) ? u_xlat9 : u_xlat3.x;
    u_xlat3.x = (u_xlatb1.y) ? u_xlat6.x : u_xlat3.x;
    u_xlat6.x = _DissolveAmount + 1.0;
    u_xlat3.x = (-u_xlat3.x) + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = dot(u_xlat3.xx, vec2(_Dissovle_fanwei));
    u_xlat3.x = u_xlat3.x + (-_Dissovle_fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat3.x;
    u_xlat0.xy = u_xlat0.xx + (-_Dissolve_bianyuan.xz);
    u_xlat6.xy = (-_Dissolve_bianyuan.xz) + _Dissolve_bianyuan.yw;
    u_xlat6.xy = vec2(1.0, 1.0) / u_xlat6.xy;
    u_xlat0.xy = u_xlat6.xy * u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat6.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy;
    u_xlat3.x = dot(u_xlat0.yy, vec2(_Dissolve_Color_Fanwei));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3.x = u_xlat3.x + (-_Dissolve_Color_Fanwei);
    u_xlat3.x = min(abs(u_xlat3.x), 1.0);
    u_xlat1.x = (-u_xlat3.x) + 1.0;
    u_xlat1.y = 0.0;
    u_xlat16_3.xyz = texture(_Saoguang_Ramp, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat1.xxx;
    u_xlat3.xyz = u_xlat3.xyz * _DissolveEdgeColor.xyz;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_2 = texture(_ChangeColorTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = (-u_xlat16_1.xyz) + u_xlat16_2.xyz;
    u_xlat10 = min(u_xlat16_1.w, u_xlat16_2.w);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_DissolveColor_Intensity) + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(u_xlat10);
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat0.xyz;
    SV_Target0.w = u_xlat10 * vs_COLOR0.w;
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
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
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
    vs_TEXCOORD1.xyz = in_POSITION0.xyz;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	vec4 _VcertexUVOffsetScale;
uniform 	vec4 _Dissolve_bianyuan;
uniform 	float _DissolveAmount;
uniform 	int _Dissolve_Shape;
uniform 	vec4 _Dissolve_Diraciton_Transform;
uniform 	mediump vec2 _DirectionSize;
uniform 	float _Dissovle_fanwei;
uniform 	vec4 _DissolveMap_ST;
uniform 	float _Dissolve_Color_Fanwei;
uniform 	vec4 _DissolveEdgeColor;
uniform 	float _DissolveColor_Intensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ChangeColorTex;
uniform lowp sampler2D _DissolveMap;
uniform lowp sampler2D _Saoguang_Ramp;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec2 u_xlat6;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD1.xy) + _VcertexUVOffsetScale.xy;
    u_xlat0.xy = u_xlat0.xy / _VcertexUVOffsetScale.zz;
    u_xlat6.xy = u_xlat0.xy * _Dissolve_Diraciton_Transform.xy + _Dissolve_Diraciton_Transform.zw;
    u_xlat0.xy = u_xlat0.xy * _DissolveMap_ST.xy + _DissolveMap_ST.zw;
    u_xlat10_0 = texture2D(_DissolveMap, u_xlat0.xy).x;
    u_xlat3.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x / _DirectionSize.x;
    u_xlat3.x = (_Dissolve_Shape != 0) ? 0.0 : u_xlat3.x;
    u_xlat1.xy = (-_DirectionSize.xy) * vec2(0.100000001, 0.100000001) + abs(u_xlat6.xy);
    u_xlat6.xy = abs(u_xlat6.xy) / _DirectionSize.xy;
    u_xlat6.x = u_xlat6.y + u_xlat6.x;
    u_xlat9 = max(u_xlat1.y, u_xlat1.x);
    u_xlatb1.xy = equal(ivec4(ivec4(_Dissolve_Shape, _Dissolve_Shape, _Dissolve_Shape, _Dissolve_Shape)), ivec4(1, 2, 0, 0)).xy;
    u_xlat3.x = (u_xlatb1.x) ? u_xlat9 : u_xlat3.x;
    u_xlat3.x = (u_xlatb1.y) ? u_xlat6.x : u_xlat3.x;
    u_xlat6.x = _DissolveAmount + 1.0;
    u_xlat3.x = (-u_xlat3.x) + u_xlat6.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = dot(u_xlat3.xx, vec2(_Dissovle_fanwei));
    u_xlat3.x = u_xlat3.x + (-_Dissovle_fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat3.x;
    u_xlat0.xy = u_xlat0.xx + (-_Dissolve_bianyuan.xz);
    u_xlat6.xy = (-_Dissolve_bianyuan.xz) + _Dissolve_bianyuan.yw;
    u_xlat6.xy = vec2(1.0, 1.0) / u_xlat6.xy;
    u_xlat0.xy = u_xlat6.xy * u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat6.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy;
    u_xlat3.x = dot(u_xlat0.yy, vec2(_Dissolve_Color_Fanwei));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3.x = u_xlat3.x + (-_Dissolve_Color_Fanwei);
    u_xlat3.x = min(abs(u_xlat3.x), 1.0);
    u_xlat1.x = (-u_xlat3.x) + 1.0;
    u_xlat1.y = 0.0;
    u_xlat10_3.xyz = texture2D(_Saoguang_Ramp, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * u_xlat1.xxx;
    u_xlat3.xyz = u_xlat3.xyz * _DissolveEdgeColor.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.x * u_xlat10_1.w;
    u_xlat10_2 = texture2D(_ChangeColorTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = (-u_xlat10_1.xyz) + u_xlat10_2.xyz;
    u_xlat10 = min(u_xlat10_1.w, u_xlat10_2.w);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_DissolveColor_Intensity) + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(u_xlat10);
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat0.xyz;
    SV_Target0.w = u_xlat10 * vs_COLOR0.w;
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
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
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
    vs_TEXCOORD1.xyz = in_POSITION0.xyz;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	vec4 _VcertexUVOffsetScale;
uniform 	vec4 _Dissolve_bianyuan;
uniform 	float _DissolveAmount;
uniform 	int _Dissolve_Shape;
uniform 	vec4 _Dissolve_Diraciton_Transform;
uniform 	mediump vec2 _DirectionSize;
uniform 	float _Dissovle_fanwei;
uniform 	vec4 _DissolveMap_ST;
uniform 	float _Dissolve_Color_Fanwei;
uniform 	vec4 _DissolveEdgeColor;
uniform 	float _DissolveColor_Intensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ChangeColorTex;
uniform lowp sampler2D _DissolveMap;
uniform lowp sampler2D _Saoguang_Ramp;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec2 u_xlat6;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD1.xy) + _VcertexUVOffsetScale.xy;
    u_xlat0.xy = u_xlat0.xy / _VcertexUVOffsetScale.zz;
    u_xlat6.xy = u_xlat0.xy * _Dissolve_Diraciton_Transform.xy + _Dissolve_Diraciton_Transform.zw;
    u_xlat0.xy = u_xlat0.xy * _DissolveMap_ST.xy + _DissolveMap_ST.zw;
    u_xlat10_0 = texture2D(_DissolveMap, u_xlat0.xy).x;
    u_xlat3.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x / _DirectionSize.x;
    u_xlat3.x = (_Dissolve_Shape != 0) ? 0.0 : u_xlat3.x;
    u_xlat1.xy = (-_DirectionSize.xy) * vec2(0.100000001, 0.100000001) + abs(u_xlat6.xy);
    u_xlat6.xy = abs(u_xlat6.xy) / _DirectionSize.xy;
    u_xlat6.x = u_xlat6.y + u_xlat6.x;
    u_xlat9 = max(u_xlat1.y, u_xlat1.x);
    u_xlatb1.xy = equal(ivec4(ivec4(_Dissolve_Shape, _Dissolve_Shape, _Dissolve_Shape, _Dissolve_Shape)), ivec4(1, 2, 0, 0)).xy;
    u_xlat3.x = (u_xlatb1.x) ? u_xlat9 : u_xlat3.x;
    u_xlat3.x = (u_xlatb1.y) ? u_xlat6.x : u_xlat3.x;
    u_xlat6.x = _DissolveAmount + 1.0;
    u_xlat3.x = (-u_xlat3.x) + u_xlat6.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = dot(u_xlat3.xx, vec2(_Dissovle_fanwei));
    u_xlat3.x = u_xlat3.x + (-_Dissovle_fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat3.x;
    u_xlat0.xy = u_xlat0.xx + (-_Dissolve_bianyuan.xz);
    u_xlat6.xy = (-_Dissolve_bianyuan.xz) + _Dissolve_bianyuan.yw;
    u_xlat6.xy = vec2(1.0, 1.0) / u_xlat6.xy;
    u_xlat0.xy = u_xlat6.xy * u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat6.xy = u_xlat0.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat6.xy;
    u_xlat3.x = dot(u_xlat0.yy, vec2(_Dissolve_Color_Fanwei));
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3.x = u_xlat3.x + (-_Dissolve_Color_Fanwei);
    u_xlat3.x = min(abs(u_xlat3.x), 1.0);
    u_xlat1.x = (-u_xlat3.x) + 1.0;
    u_xlat1.y = 0.0;
    u_xlat10_3.xyz = texture2D(_Saoguang_Ramp, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * u_xlat1.xxx;
    u_xlat3.xyz = u_xlat3.xyz * _DissolveEdgeColor.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = u_xlat0.x * u_xlat10_1.w;
    u_xlat10_2 = texture2D(_ChangeColorTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = (-u_xlat10_1.xyz) + u_xlat10_2.xyz;
    u_xlat10 = min(u_xlat10_1.w, u_xlat10_2.w);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_DissolveColor_Intensity) + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + vec3(u_xlat10);
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat0.xyz;
    SV_Target0.xyz = vec3(u_xlat10) * u_xlat0.xyz;
    SV_Target0.w = u_xlat10 * vs_COLOR0.w;
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
 Name "Caster"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
 Cull Off
 Offset 1.0, 1.0
  GpuProgramID 76573
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vs_TEXCOORD1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vs_TEXCOORD1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat10_0 * vs_TEXCOORD1.w + (-_Cutoff);
    u_xlatb0 = u_xlat0<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat10_0 * vs_TEXCOORD1.w + (-_Cutoff);
    u_xlatb0 = u_xlat0<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vs_TEXCOORD1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vs_TEXCOORD1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0.x = u_xlat10_0 * vs_TEXCOORD1.w + (-_Cutoff);
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = min(u_xlat0.x, 0.999000013);
    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
    u_xlat0 = fract(u_xlat0);
    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0.x = u_xlat10_0 * vs_TEXCOORD1.w + (-_Cutoff);
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = min(u_xlat0.x, 0.999000013);
    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
    u_xlat0 = fract(u_xlat0);
    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
}
CustomEditor "SpineShaderWithOutlineGUI"
}