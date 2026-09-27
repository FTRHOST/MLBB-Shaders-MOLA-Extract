//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/UISpecial_SGMB_BlendSG" {
Properties {

[Enum(UnityEngine.Rendering.BlendMode)] _Src ("Src", Float) = 5.0

[Enum(UnityEngine.Rendering.BlendMode)] _Dst ("Dst", Float) = 10.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

_MainTex ("MainTex", 2D) = "white" { }

_MainMask ("MainMask", 2D) = "white" { }

_ColorTint ("ColorTint", Color) = (1,1,1,1)

[Header(saoguang)] _Saoguang_Color ("Saoguang_Color", Color) = (1,1,1,1)

_Saoguang_Intensity ("Saoguang_Intensity", Range(0, 10)) = 1.0

[Enum(Add,0,Blend,1,Multiply,2)] _Saoguang_Mode ("扫光混合模式", Float) = 0.0

_Saoguang ("Saoguang", 2D) = "black" { }

_Saoguang_RatatorCenter ("Saoguang_RatatorCenter", Vector) = (0.5,0.5,0,0)

_Saoguang_RatatorIntensity ("Saoguang_RatatorIntensity", Float) = 0.0

_RotSpeed ("RotSpeed", Float) = 0.0

_Saoguang_Jiange ("Saoguang_Jiange", Float) = 1.0

_SmallTexUV_Scale ("SmallTexUV_Scale", Float) = 1.0

_MainTexSpeedx ("MainTexSpeedx", Float) = 0.0

_MainTexSpeedy ("MainTexSpeedy", Float) = 0.0

[Toggle] _MainTexTil ("MainTexTil", Float) = 0.0

[Header(miaobian)] [Toggle] _miaobianTogole ("miaobianTogole", Float) = 0.0

_MiaobianModel ("miaobianModel", Range(0, 1)) = 0.0

_MiaobianIntensity ("MiaobianIntensity", Float) = 0.0

_miaobianColor ("miaobianColor", Color) = (1,1,1,1)

[Toggle] _MainTexTogole ("MainTexTogole", Float) = 0.0

[Toggle] _jianyingTologe ("jianyingTologe", Float) = 0.0

_jianyingColor ("jianyingColor", Color) = (1,1,1,1)

_PrefabSize ("PrefabSize", Float) = 1024.0

_Offset_Size ("Offset_Size", Vector) = (0,0,0,0)

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

_StencilRef ("StencilRef", Float) = 0.0

_PanelRect ("PanelRect", Vector) = (0,0,0,0)

_PanelClipInfo ("ClipInfo", Vector) = (0,0,0,0)

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Transparent" "RenderType" = "Opaque" }
 Pass {
 Name "Base"
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
 ZWrite Off
 Cull Off
  GpuProgramID 48165
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
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MiaobianModel;
uniform 	float _MiaobianIntensity;
uniform 	float _miaobianTogole;
uniform 	vec4 _miaobianColor;
uniform 	float _MainTexTogole;
uniform 	vec4 _jianyingColor;
uniform 	float _jianyingTologe;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Mode;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainMask;
UNITY_LOCATION(2) uniform mediump sampler2D _Saoguang;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
ivec2 u_xlati8;
bvec2 u_xlatb8;
float u_xlat14;
mediump float u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_15;
vec2 u_xlat16;
ivec2 u_xlati16;
bvec2 u_xlatb16;
float u_xlat22;
float u_xlat23;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat7.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat14 = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat14 * u_xlat7.x;
    u_xlat7.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat7.x * u_xlat14;
    u_xlat7.x = u_xlat7.x + (-_Offset_Size.w);
    u_xlat2.y = u_xlat14 * u_xlat7.x;
    u_xlat2.x = u_xlat14 * _Offset_Size.x;
    u_xlat7.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat1.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy / u_xlat7.xy;
    u_xlat15.xy = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xw = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = floor(u_xlat15.xy);
    u_xlat1.xy = min(abs(u_xlat1.xy), vec2(1.0, 1.0));
    u_xlat1.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xwxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb16.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat0.xwxw).xy;
    u_xlati8.xy = ivec2(uvec2((uint(u_xlatb8.x) * 0xffffffffu) & (uint(u_xlatb16.x) * 0xffffffffu), (uint(u_xlatb8.y) * 0xffffffffu) & (uint(u_xlatb16.y) * 0xffffffffu)));
    u_xlat8.xy = uintBitsToFloat(uvec2(uint(u_xlati8.x) & uint(1065353216u), uint(u_xlati8.y) & uint(1065353216u)));
    u_xlat8.x = u_xlat8.x * u_xlat8.y + (-u_xlat1.x);
    u_xlat1.x = _MainTexTil * u_xlat8.x + u_xlat1.x;
    u_xlat8.xy = vec2(1.0, 1.0) / _Offset_Size.zw;
    u_xlat16.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + vec2(1.0, 1.0);
    u_xlatb16.xy = greaterThanEqual(u_xlat16.xyxy, u_xlat0.xwxw).xy;
    u_xlat3.xy = u_xlat8.xy * vec2(_MiaobianIntensity);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xwxx, (-u_xlat3.xyxx)).xy;
    u_xlati16.xy = ivec2(uvec2((uint(u_xlatb16.x) * 0xffffffffu) & (uint(u_xlatb4.x) * 0xffffffffu), (uint(u_xlatb16.y) * 0xffffffffu) & (uint(u_xlatb4.y) * 0xffffffffu)));
    u_xlat16.xy = uintBitsToFloat(uvec2(uint(u_xlati16.x) & uint(1065353216u), uint(u_xlati16.y) & uint(1065353216u)));
    u_xlat22 = u_xlat16.y * u_xlat16.x;
    u_xlat22 = u_xlat1.x * u_xlat22 + (-u_xlat1.x);
    u_xlat1.x = _miaobianTogole * u_xlat22 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16.xy = (-vec2(_MiaobianIntensity)) * u_xlat8.xy + u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = u_xlat8.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat16_8 = texture(_MainMask, u_xlat8.xy).x;
    u_xlat15.xy = u_xlat16.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat15.xy = u_xlat1.xx * u_xlat15.xy;
    u_xlat16_15 = texture(_MainMask, u_xlat15.xy).x;
    u_xlat8.x = (-u_xlat16_8) + u_xlat16_15;
    u_xlat3.zw = (-u_xlat3.xy);
    u_xlat3 = u_xlat0.xwxw + (-u_xlat3.zyxw);
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xw = min(max(u_xlat0.xw, 0.0), 1.0);
#else
    u_xlat0.xw = clamp(u_xlat0.xw, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat0.xw * u_xlat7.xy + u_xlat2.xy;
    u_xlat2 = u_xlat3 * u_xlat7.xyxy + u_xlat2.xyxy;
    u_xlat2 = u_xlat1.xxxx * u_xlat2;
    u_xlat16_7 = texture(_MainMask, u_xlat2.xy).x;
    u_xlat16_14 = texture(_MainMask, u_xlat2.zw).x;
    u_xlat7.x = (-u_xlat16_14) + u_xlat16_7;
    u_xlat7.x = abs(u_xlat7.x) + abs(u_xlat8.x);
    u_xlat7.x = min(u_xlat7.x, 1.0);
    u_xlat16_14 = texture(_MainMask, u_xlat0.xw).x;
    u_xlat2.xyz = texture(_MainTex, u_xlat0.xw).xyz;
    u_xlat0.x = (-u_xlat1.x) * u_xlat16_14 + u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat0.x = _MiaobianModel * u_xlat7.x + u_xlat0.x;
    u_xlat7.x = u_xlat0.x * _miaobianColor.w;
    u_xlat3.w = u_xlat1.x * u_xlat16_14 + u_xlat7.x;
    u_xlat2.w = u_xlat16_14 * u_xlat1.x;
    u_xlat7.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat0.xxx);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat0.xxx * _miaobianColor.xyz + u_xlat7.xyz;
    u_xlat1 = (-u_xlat2) + u_xlat3;
    u_xlat1 = vec4(vec4(_miaobianTogole, _miaobianTogole, _miaobianTogole, _miaobianTogole)) * u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat0.xxxx * _miaobianColor + (-u_xlat1);
    u_xlat0 = vec4(_MainTexTogole) * u_xlat0 + u_xlat1;
    u_xlat1 = u_xlat2.wwww * _jianyingColor + (-u_xlat0);
    u_xlat0 = vec4(_jianyingTologe) * u_xlat1 + u_xlat0;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat1.xy = u_xlat1.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat15.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + _Saoguang_RatatorCenter.xy;
    u_xlat15.x = _Time.y * 0.300000012;
    u_xlat2.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat1.xy = u_xlat15.xx * u_xlat2.xy + u_xlat1.xy;
    u_xlat15.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat1.xy = u_xlat1.xy / u_xlat15.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat15.xy * u_xlat1.xy;
    u_xlat16_1 = texture(_Saoguang, u_xlat1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * _Saoguang_Color.xyz + (-u_xlat0.xyz);
    u_xlat1 = u_xlat16_1 * _Saoguang_Color;
    u_xlat23 = u_xlat1.w * _Saoguang_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz + (-u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Saoguang_Intensity) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlatb3.xy = lessThan(vec4(vec4(_Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode)), vec4(0.5, 1.5, 0.0, 0.0)).xy;
    u_xlat16_5.xyz = (u_xlatb3.y) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat16_5.xyz = (u_xlatb3.x) ? u_xlat1.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_26 = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_26 = (-u_xlat16_26) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_5.xyz;
    SV_Target0.w = u_xlat0.w * u_xlat16_26;
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
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MiaobianModel;
uniform 	float _MiaobianIntensity;
uniform 	float _miaobianTogole;
uniform 	vec4 _miaobianColor;
uniform 	float _MainTexTogole;
uniform 	vec4 _jianyingColor;
uniform 	float _jianyingTologe;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Mode;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainMask;
UNITY_LOCATION(2) uniform mediump sampler2D _Saoguang;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
ivec2 u_xlati8;
bvec2 u_xlatb8;
float u_xlat14;
mediump float u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_15;
vec2 u_xlat16;
ivec2 u_xlati16;
bvec2 u_xlatb16;
float u_xlat22;
float u_xlat23;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat7.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat14 = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat14 * u_xlat7.x;
    u_xlat7.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat7.x * u_xlat14;
    u_xlat7.x = u_xlat7.x + (-_Offset_Size.w);
    u_xlat2.y = u_xlat14 * u_xlat7.x;
    u_xlat2.x = u_xlat14 * _Offset_Size.x;
    u_xlat7.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat1.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy / u_xlat7.xy;
    u_xlat15.xy = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xw = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = floor(u_xlat15.xy);
    u_xlat1.xy = min(abs(u_xlat1.xy), vec2(1.0, 1.0));
    u_xlat1.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xwxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb16.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat0.xwxw).xy;
    u_xlati8.xy = ivec2(uvec2((uint(u_xlatb8.x) * 0xffffffffu) & (uint(u_xlatb16.x) * 0xffffffffu), (uint(u_xlatb8.y) * 0xffffffffu) & (uint(u_xlatb16.y) * 0xffffffffu)));
    u_xlat8.xy = uintBitsToFloat(uvec2(uint(u_xlati8.x) & uint(1065353216u), uint(u_xlati8.y) & uint(1065353216u)));
    u_xlat8.x = u_xlat8.x * u_xlat8.y + (-u_xlat1.x);
    u_xlat1.x = _MainTexTil * u_xlat8.x + u_xlat1.x;
    u_xlat8.xy = vec2(1.0, 1.0) / _Offset_Size.zw;
    u_xlat16.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + vec2(1.0, 1.0);
    u_xlatb16.xy = greaterThanEqual(u_xlat16.xyxy, u_xlat0.xwxw).xy;
    u_xlat3.xy = u_xlat8.xy * vec2(_MiaobianIntensity);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xwxx, (-u_xlat3.xyxx)).xy;
    u_xlati16.xy = ivec2(uvec2((uint(u_xlatb16.x) * 0xffffffffu) & (uint(u_xlatb4.x) * 0xffffffffu), (uint(u_xlatb16.y) * 0xffffffffu) & (uint(u_xlatb4.y) * 0xffffffffu)));
    u_xlat16.xy = uintBitsToFloat(uvec2(uint(u_xlati16.x) & uint(1065353216u), uint(u_xlati16.y) & uint(1065353216u)));
    u_xlat22 = u_xlat16.y * u_xlat16.x;
    u_xlat22 = u_xlat1.x * u_xlat22 + (-u_xlat1.x);
    u_xlat1.x = _miaobianTogole * u_xlat22 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16.xy = (-vec2(_MiaobianIntensity)) * u_xlat8.xy + u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = u_xlat8.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat16_8 = texture(_MainMask, u_xlat8.xy).x;
    u_xlat15.xy = u_xlat16.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat15.xy = u_xlat1.xx * u_xlat15.xy;
    u_xlat16_15 = texture(_MainMask, u_xlat15.xy).x;
    u_xlat8.x = (-u_xlat16_8) + u_xlat16_15;
    u_xlat3.zw = (-u_xlat3.xy);
    u_xlat3 = u_xlat0.xwxw + (-u_xlat3.zyxw);
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xw = min(max(u_xlat0.xw, 0.0), 1.0);
#else
    u_xlat0.xw = clamp(u_xlat0.xw, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat0.xw * u_xlat7.xy + u_xlat2.xy;
    u_xlat2 = u_xlat3 * u_xlat7.xyxy + u_xlat2.xyxy;
    u_xlat2 = u_xlat1.xxxx * u_xlat2;
    u_xlat16_7 = texture(_MainMask, u_xlat2.xy).x;
    u_xlat16_14 = texture(_MainMask, u_xlat2.zw).x;
    u_xlat7.x = (-u_xlat16_14) + u_xlat16_7;
    u_xlat7.x = abs(u_xlat7.x) + abs(u_xlat8.x);
    u_xlat7.x = min(u_xlat7.x, 1.0);
    u_xlat16_14 = texture(_MainMask, u_xlat0.xw).x;
    u_xlat2.xyz = texture(_MainTex, u_xlat0.xw).xyz;
    u_xlat0.x = (-u_xlat1.x) * u_xlat16_14 + u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat0.x = _MiaobianModel * u_xlat7.x + u_xlat0.x;
    u_xlat7.x = u_xlat0.x * _miaobianColor.w;
    u_xlat3.w = u_xlat1.x * u_xlat16_14 + u_xlat7.x;
    u_xlat2.w = u_xlat16_14 * u_xlat1.x;
    u_xlat7.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat0.xxx);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat0.xxx * _miaobianColor.xyz + u_xlat7.xyz;
    u_xlat1 = (-u_xlat2) + u_xlat3;
    u_xlat1 = vec4(vec4(_miaobianTogole, _miaobianTogole, _miaobianTogole, _miaobianTogole)) * u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat0.xxxx * _miaobianColor + (-u_xlat1);
    u_xlat0 = vec4(_MainTexTogole) * u_xlat0 + u_xlat1;
    u_xlat1 = u_xlat2.wwww * _jianyingColor + (-u_xlat0);
    u_xlat0 = vec4(_jianyingTologe) * u_xlat1 + u_xlat0;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat1.xy = u_xlat1.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat15.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + _Saoguang_RatatorCenter.xy;
    u_xlat15.x = _Time.y * 0.300000012;
    u_xlat2.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat1.xy = u_xlat15.xx * u_xlat2.xy + u_xlat1.xy;
    u_xlat15.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat1.xy = u_xlat1.xy / u_xlat15.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat15.xy * u_xlat1.xy;
    u_xlat16_1 = texture(_Saoguang, u_xlat1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * _Saoguang_Color.xyz + (-u_xlat0.xyz);
    u_xlat1 = u_xlat16_1 * _Saoguang_Color;
    u_xlat23 = u_xlat1.w * _Saoguang_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz + (-u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Saoguang_Intensity) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlatb3.xy = lessThan(vec4(vec4(_Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode)), vec4(0.5, 1.5, 0.0, 0.0)).xy;
    u_xlat16_5.xyz = (u_xlatb3.y) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat16_5.xyz = (u_xlatb3.x) ? u_xlat1.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_26 = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_26 = (-u_xlat16_26) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_5.xyz;
    SV_Target0.w = u_xlat0.w * u_xlat16_26;
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
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MiaobianModel;
uniform 	float _MiaobianIntensity;
uniform 	float _miaobianTogole;
uniform 	vec4 _miaobianColor;
uniform 	float _MainTexTogole;
uniform 	vec4 _jianyingColor;
uniform 	float _jianyingTologe;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Mode;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MainMask;
uniform lowp sampler2D _Saoguang;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec2 u_xlat8;
lowp float u_xlat10_8;
ivec2 u_xlati8;
bvec2 u_xlatb8;
float u_xlat14;
lowp float u_xlat10_14;
vec2 u_xlat15;
lowp float u_xlat10_15;
vec2 u_xlat16;
ivec2 u_xlati16;
bvec2 u_xlatb16;
float u_xlat22;
float u_xlat23;
mediump float u_xlat16_26;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlat0.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat7.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat14 = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat14 * u_xlat7.x;
    u_xlat7.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat7.x * u_xlat14;
    u_xlat7.x = u_xlat7.x + (-_Offset_Size.w);
    u_xlat2.y = u_xlat14 * u_xlat7.x;
    u_xlat2.x = u_xlat14 * _Offset_Size.x;
    u_xlat7.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat1.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy / u_xlat7.xy;
    u_xlat15.xy = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xw = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = floor(u_xlat15.xy);
    u_xlat1.xy = min(abs(u_xlat1.xy), vec2(1.0, 1.0));
    u_xlat1.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xwxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb16.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat0.xwxw).xy;
    u_xlati8.xy = op_and((ivec2(u_xlatb8.xy) * -1), (ivec2(u_xlatb16.xy) * -1));
    u_xlat8.xy = vec2(op_and(u_xlati8.xy, ivec2(1065353216, 1065353216)));
    u_xlat8.x = u_xlat8.x * u_xlat8.y + (-u_xlat1.x);
    u_xlat1.x = _MainTexTil * u_xlat8.x + u_xlat1.x;
    u_xlat8.xy = vec2(1.0, 1.0) / _Offset_Size.zw;
    u_xlat16.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + vec2(1.0, 1.0);
    u_xlatb16.xy = greaterThanEqual(u_xlat16.xyxy, u_xlat0.xwxw).xy;
    u_xlat3.xy = u_xlat8.xy * vec2(_MiaobianIntensity);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xwxx, (-u_xlat3.xyxx)).xy;
    u_xlati16.xy = op_and((ivec2(u_xlatb16.xy) * -1), (ivec2(u_xlatb4.xy) * -1));
    u_xlat16.xy = vec2(op_and(u_xlati16.xy, ivec2(1065353216, 1065353216)));
    u_xlat22 = u_xlat16.y * u_xlat16.x;
    u_xlat22 = u_xlat1.x * u_xlat22 + (-u_xlat1.x);
    u_xlat1.x = _miaobianTogole * u_xlat22 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat16.xy = (-vec2(_MiaobianIntensity)) * u_xlat8.xy + u_xlat0.xw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat8.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + u_xlat0.xw;
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat8.xy = u_xlat8.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat10_8 = texture2D(_MainMask, u_xlat8.xy).x;
    u_xlat15.xy = u_xlat16.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat15.xy = u_xlat1.xx * u_xlat15.xy;
    u_xlat10_15 = texture2D(_MainMask, u_xlat15.xy).x;
    u_xlat8.x = (-u_xlat10_8) + u_xlat10_15;
    u_xlat3.zw = (-u_xlat3.xy);
    u_xlat3 = u_xlat0.xwxw + (-u_xlat3.zyxw);
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xw = u_xlat0.xw;
    u_xlat0.xw = clamp(u_xlat0.xw, 0.0, 1.0);
    u_xlat0.xw = u_xlat0.xw * u_xlat7.xy + u_xlat2.xy;
    u_xlat2 = u_xlat3 * u_xlat7.xyxy + u_xlat2.xyxy;
    u_xlat2 = u_xlat1.xxxx * u_xlat2;
    u_xlat10_7 = texture2D(_MainMask, u_xlat2.xy).x;
    u_xlat10_14 = texture2D(_MainMask, u_xlat2.zw).x;
    u_xlat7.x = (-u_xlat10_14) + u_xlat10_7;
    u_xlat7.x = abs(u_xlat7.x) + abs(u_xlat8.x);
    u_xlat7.x = min(u_xlat7.x, 1.0);
    u_xlat10_14 = texture2D(_MainMask, u_xlat0.xw).x;
    u_xlat2.xyz = texture2D(_MainTex, u_xlat0.xw).xyz;
    u_xlat0.x = (-u_xlat1.x) * u_xlat10_14 + u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat0.x = _MiaobianModel * u_xlat7.x + u_xlat0.x;
    u_xlat7.x = u_xlat0.x * _miaobianColor.w;
    u_xlat3.w = u_xlat1.x * u_xlat10_14 + u_xlat7.x;
    u_xlat2.w = u_xlat10_14 * u_xlat1.x;
    u_xlat7.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat0.xxx);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat0.xxx * _miaobianColor.xyz + u_xlat7.xyz;
    u_xlat1 = (-u_xlat2) + u_xlat3;
    u_xlat1 = vec4(vec4(_miaobianTogole, _miaobianTogole, _miaobianTogole, _miaobianTogole)) * u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat0.xxxx * _miaobianColor + (-u_xlat1);
    u_xlat0 = vec4(_MainTexTogole) * u_xlat0 + u_xlat1;
    u_xlat1 = u_xlat2.wwww * _jianyingColor + (-u_xlat0);
    u_xlat0 = vec4(_jianyingTologe) * u_xlat1 + u_xlat0;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat1.xy = u_xlat1.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat15.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + _Saoguang_RatatorCenter.xy;
    u_xlat15.x = _Time.y * 0.300000012;
    u_xlat2.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat1.xy = u_xlat15.xx * u_xlat2.xy + u_xlat1.xy;
    u_xlat15.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat1.xy = u_xlat1.xy / u_xlat15.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat15.xy * u_xlat1.xy;
    u_xlat10_1 = texture2D(_Saoguang, u_xlat1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * _Saoguang_Color.xyz + (-u_xlat0.xyz);
    u_xlat1 = u_xlat10_1 * _Saoguang_Color;
    u_xlat23 = u_xlat1.w * _Saoguang_Intensity;
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz + (-u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Saoguang_Intensity) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlatb3.xy = lessThan(vec4(vec4(_Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode)), vec4(0.5, 1.5, 0.0, 0.0)).xy;
    u_xlat16_5.xyz = (u_xlatb3.y) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat16_5.xyz = (u_xlatb3.x) ? u_xlat1.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_26 = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_26 = (-u_xlat16_26) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_5.xyz;
    SV_Target0.w = u_xlat0.w * u_xlat16_26;
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
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MiaobianModel;
uniform 	float _MiaobianIntensity;
uniform 	float _miaobianTogole;
uniform 	vec4 _miaobianColor;
uniform 	float _MainTexTogole;
uniform 	vec4 _jianyingColor;
uniform 	float _jianyingTologe;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Mode;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MainMask;
uniform lowp sampler2D _Saoguang;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec2 u_xlat8;
lowp float u_xlat10_8;
ivec2 u_xlati8;
bvec2 u_xlatb8;
float u_xlat14;
lowp float u_xlat10_14;
vec2 u_xlat15;
lowp float u_xlat10_15;
vec2 u_xlat16;
ivec2 u_xlati16;
bvec2 u_xlatb16;
float u_xlat22;
float u_xlat23;
mediump float u_xlat16_26;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlat0.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat7.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat14 = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat14 * u_xlat7.x;
    u_xlat7.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat7.x * u_xlat14;
    u_xlat7.x = u_xlat7.x + (-_Offset_Size.w);
    u_xlat2.y = u_xlat14 * u_xlat7.x;
    u_xlat2.x = u_xlat14 * _Offset_Size.x;
    u_xlat7.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat1.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy / u_xlat7.xy;
    u_xlat15.xy = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xw = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = floor(u_xlat15.xy);
    u_xlat1.xy = min(abs(u_xlat1.xy), vec2(1.0, 1.0));
    u_xlat1.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xwxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb16.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat0.xwxw).xy;
    u_xlati8.xy = op_and((ivec2(u_xlatb8.xy) * -1), (ivec2(u_xlatb16.xy) * -1));
    u_xlat8.xy = vec2(op_and(u_xlati8.xy, ivec2(1065353216, 1065353216)));
    u_xlat8.x = u_xlat8.x * u_xlat8.y + (-u_xlat1.x);
    u_xlat1.x = _MainTexTil * u_xlat8.x + u_xlat1.x;
    u_xlat8.xy = vec2(1.0, 1.0) / _Offset_Size.zw;
    u_xlat16.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + vec2(1.0, 1.0);
    u_xlatb16.xy = greaterThanEqual(u_xlat16.xyxy, u_xlat0.xwxw).xy;
    u_xlat3.xy = u_xlat8.xy * vec2(_MiaobianIntensity);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xwxx, (-u_xlat3.xyxx)).xy;
    u_xlati16.xy = op_and((ivec2(u_xlatb16.xy) * -1), (ivec2(u_xlatb4.xy) * -1));
    u_xlat16.xy = vec2(op_and(u_xlati16.xy, ivec2(1065353216, 1065353216)));
    u_xlat22 = u_xlat16.y * u_xlat16.x;
    u_xlat22 = u_xlat1.x * u_xlat22 + (-u_xlat1.x);
    u_xlat1.x = _miaobianTogole * u_xlat22 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat16.xy = (-vec2(_MiaobianIntensity)) * u_xlat8.xy + u_xlat0.xw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat8.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + u_xlat0.xw;
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat8.xy = u_xlat8.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat10_8 = texture2D(_MainMask, u_xlat8.xy).x;
    u_xlat15.xy = u_xlat16.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat15.xy = u_xlat1.xx * u_xlat15.xy;
    u_xlat10_15 = texture2D(_MainMask, u_xlat15.xy).x;
    u_xlat8.x = (-u_xlat10_8) + u_xlat10_15;
    u_xlat3.zw = (-u_xlat3.xy);
    u_xlat3 = u_xlat0.xwxw + (-u_xlat3.zyxw);
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xw = u_xlat0.xw;
    u_xlat0.xw = clamp(u_xlat0.xw, 0.0, 1.0);
    u_xlat0.xw = u_xlat0.xw * u_xlat7.xy + u_xlat2.xy;
    u_xlat2 = u_xlat3 * u_xlat7.xyxy + u_xlat2.xyxy;
    u_xlat2 = u_xlat1.xxxx * u_xlat2;
    u_xlat10_7 = texture2D(_MainMask, u_xlat2.xy).x;
    u_xlat10_14 = texture2D(_MainMask, u_xlat2.zw).x;
    u_xlat7.x = (-u_xlat10_14) + u_xlat10_7;
    u_xlat7.x = abs(u_xlat7.x) + abs(u_xlat8.x);
    u_xlat7.x = min(u_xlat7.x, 1.0);
    u_xlat10_14 = texture2D(_MainMask, u_xlat0.xw).x;
    u_xlat2.xyz = texture2D(_MainTex, u_xlat0.xw).xyz;
    u_xlat0.x = (-u_xlat1.x) * u_xlat10_14 + u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat0.x = _MiaobianModel * u_xlat7.x + u_xlat0.x;
    u_xlat7.x = u_xlat0.x * _miaobianColor.w;
    u_xlat3.w = u_xlat1.x * u_xlat10_14 + u_xlat7.x;
    u_xlat2.w = u_xlat10_14 * u_xlat1.x;
    u_xlat7.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat0.xxx);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat0.xxx * _miaobianColor.xyz + u_xlat7.xyz;
    u_xlat1 = (-u_xlat2) + u_xlat3;
    u_xlat1 = vec4(vec4(_miaobianTogole, _miaobianTogole, _miaobianTogole, _miaobianTogole)) * u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat0.xxxx * _miaobianColor + (-u_xlat1);
    u_xlat0 = vec4(_MainTexTogole) * u_xlat0 + u_xlat1;
    u_xlat1 = u_xlat2.wwww * _jianyingColor + (-u_xlat0);
    u_xlat0 = vec4(_jianyingTologe) * u_xlat1 + u_xlat0;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat1.xy = u_xlat1.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat15.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + _Saoguang_RatatorCenter.xy;
    u_xlat15.x = _Time.y * 0.300000012;
    u_xlat2.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat1.xy = u_xlat15.xx * u_xlat2.xy + u_xlat1.xy;
    u_xlat15.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat1.xy = u_xlat1.xy / u_xlat15.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat15.xy * u_xlat1.xy;
    u_xlat10_1 = texture2D(_Saoguang, u_xlat1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * _Saoguang_Color.xyz + (-u_xlat0.xyz);
    u_xlat1 = u_xlat10_1 * _Saoguang_Color;
    u_xlat23 = u_xlat1.w * _Saoguang_Intensity;
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz + (-u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Saoguang_Intensity) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlatb3.xy = lessThan(vec4(vec4(_Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode)), vec4(0.5, 1.5, 0.0, 0.0)).xy;
    u_xlat16_5.xyz = (u_xlatb3.y) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat16_5.xyz = (u_xlatb3.x) ? u_xlat1.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_26 = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_26 = (-u_xlat16_26) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_5.xyz;
    SV_Target0.w = u_xlat0.w * u_xlat16_26;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MiaobianModel;
uniform 	float _MiaobianIntensity;
uniform 	float _miaobianTogole;
uniform 	vec4 _miaobianColor;
uniform 	float _MainTexTogole;
uniform 	vec4 _jianyingColor;
uniform 	float _jianyingTologe;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Mode;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainMask;
UNITY_LOCATION(2) uniform mediump sampler2D _Saoguang;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
ivec2 u_xlati8;
bvec2 u_xlatb8;
float u_xlat14;
mediump float u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_15;
vec2 u_xlat16;
ivec2 u_xlati16;
bvec2 u_xlatb16;
float u_xlat22;
float u_xlat23;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat7.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat14 = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat14 * u_xlat7.x;
    u_xlat7.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat7.x * u_xlat14;
    u_xlat7.x = u_xlat7.x + (-_Offset_Size.w);
    u_xlat2.y = u_xlat14 * u_xlat7.x;
    u_xlat2.x = u_xlat14 * _Offset_Size.x;
    u_xlat7.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat1.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy / u_xlat7.xy;
    u_xlat15.xy = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xw = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = floor(u_xlat15.xy);
    u_xlat1.xy = min(abs(u_xlat1.xy), vec2(1.0, 1.0));
    u_xlat1.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xwxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb16.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat0.xwxw).xy;
    u_xlati8.xy = ivec2(uvec2((uint(u_xlatb8.x) * 0xffffffffu) & (uint(u_xlatb16.x) * 0xffffffffu), (uint(u_xlatb8.y) * 0xffffffffu) & (uint(u_xlatb16.y) * 0xffffffffu)));
    u_xlat8.xy = uintBitsToFloat(uvec2(uint(u_xlati8.x) & uint(1065353216u), uint(u_xlati8.y) & uint(1065353216u)));
    u_xlat8.x = u_xlat8.x * u_xlat8.y + (-u_xlat1.x);
    u_xlat1.x = _MainTexTil * u_xlat8.x + u_xlat1.x;
    u_xlat8.xy = vec2(1.0, 1.0) / _Offset_Size.zw;
    u_xlat16.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + vec2(1.0, 1.0);
    u_xlatb16.xy = greaterThanEqual(u_xlat16.xyxy, u_xlat0.xwxw).xy;
    u_xlat3.xy = u_xlat8.xy * vec2(_MiaobianIntensity);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xwxx, (-u_xlat3.xyxx)).xy;
    u_xlati16.xy = ivec2(uvec2((uint(u_xlatb16.x) * 0xffffffffu) & (uint(u_xlatb4.x) * 0xffffffffu), (uint(u_xlatb16.y) * 0xffffffffu) & (uint(u_xlatb4.y) * 0xffffffffu)));
    u_xlat16.xy = uintBitsToFloat(uvec2(uint(u_xlati16.x) & uint(1065353216u), uint(u_xlati16.y) & uint(1065353216u)));
    u_xlat22 = u_xlat16.y * u_xlat16.x;
    u_xlat22 = u_xlat1.x * u_xlat22 + (-u_xlat1.x);
    u_xlat1.x = _miaobianTogole * u_xlat22 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16.xy = (-vec2(_MiaobianIntensity)) * u_xlat8.xy + u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = u_xlat8.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat16_8 = texture(_MainMask, u_xlat8.xy).x;
    u_xlat15.xy = u_xlat16.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat15.xy = u_xlat1.xx * u_xlat15.xy;
    u_xlat16_15 = texture(_MainMask, u_xlat15.xy).x;
    u_xlat8.x = (-u_xlat16_8) + u_xlat16_15;
    u_xlat3.zw = (-u_xlat3.xy);
    u_xlat3 = u_xlat0.xwxw + (-u_xlat3.zyxw);
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xw = min(max(u_xlat0.xw, 0.0), 1.0);
#else
    u_xlat0.xw = clamp(u_xlat0.xw, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat0.xw * u_xlat7.xy + u_xlat2.xy;
    u_xlat2 = u_xlat3 * u_xlat7.xyxy + u_xlat2.xyxy;
    u_xlat2 = u_xlat1.xxxx * u_xlat2;
    u_xlat16_7 = texture(_MainMask, u_xlat2.xy).x;
    u_xlat16_14 = texture(_MainMask, u_xlat2.zw).x;
    u_xlat7.x = (-u_xlat16_14) + u_xlat16_7;
    u_xlat7.x = abs(u_xlat7.x) + abs(u_xlat8.x);
    u_xlat7.x = min(u_xlat7.x, 1.0);
    u_xlat16_14 = texture(_MainMask, u_xlat0.xw).x;
    u_xlat2.xyz = texture(_MainTex, u_xlat0.xw).xyz;
    u_xlat0.x = (-u_xlat1.x) * u_xlat16_14 + u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat0.x = _MiaobianModel * u_xlat7.x + u_xlat0.x;
    u_xlat7.x = u_xlat0.x * _miaobianColor.w;
    u_xlat3.w = u_xlat1.x * u_xlat16_14 + u_xlat7.x;
    u_xlat2.w = u_xlat16_14 * u_xlat1.x;
    u_xlat7.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat0.xxx);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat0.xxx * _miaobianColor.xyz + u_xlat7.xyz;
    u_xlat1 = (-u_xlat2) + u_xlat3;
    u_xlat1 = vec4(vec4(_miaobianTogole, _miaobianTogole, _miaobianTogole, _miaobianTogole)) * u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat0.xxxx * _miaobianColor + (-u_xlat1);
    u_xlat0 = vec4(_MainTexTogole) * u_xlat0 + u_xlat1;
    u_xlat1 = u_xlat2.wwww * _jianyingColor + (-u_xlat0);
    u_xlat0 = vec4(_jianyingTologe) * u_xlat1 + u_xlat0;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat1.xy = u_xlat1.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat15.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + _Saoguang_RatatorCenter.xy;
    u_xlat15.x = _Time.y * 0.300000012;
    u_xlat2.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat1.xy = u_xlat15.xx * u_xlat2.xy + u_xlat1.xy;
    u_xlat15.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat1.xy = u_xlat1.xy / u_xlat15.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat15.xy * u_xlat1.xy;
    u_xlat16_1 = texture(_Saoguang, u_xlat1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * _Saoguang_Color.xyz + (-u_xlat0.xyz);
    u_xlat1 = u_xlat16_1 * _Saoguang_Color;
    u_xlat23 = u_xlat1.w * _Saoguang_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz + (-u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Saoguang_Intensity) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlatb3.xy = lessThan(vec4(vec4(_Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode)), vec4(0.5, 1.5, 0.0, 0.0)).xy;
    u_xlat16_5.xyz = (u_xlatb3.y) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat16_5.xyz = (u_xlatb3.x) ? u_xlat1.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_26 = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_26 = (-u_xlat16_26) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_5.xyz;
    SV_Target0.w = u_xlat0.w * u_xlat16_26;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MiaobianModel;
uniform 	float _MiaobianIntensity;
uniform 	float _miaobianTogole;
uniform 	vec4 _miaobianColor;
uniform 	float _MainTexTogole;
uniform 	vec4 _jianyingColor;
uniform 	float _jianyingTologe;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Mode;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainMask;
UNITY_LOCATION(2) uniform mediump sampler2D _Saoguang;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
ivec2 u_xlati8;
bvec2 u_xlatb8;
float u_xlat14;
mediump float u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_15;
vec2 u_xlat16;
ivec2 u_xlati16;
bvec2 u_xlatb16;
float u_xlat22;
float u_xlat23;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat7.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat14 = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat14 * u_xlat7.x;
    u_xlat7.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat7.x * u_xlat14;
    u_xlat7.x = u_xlat7.x + (-_Offset_Size.w);
    u_xlat2.y = u_xlat14 * u_xlat7.x;
    u_xlat2.x = u_xlat14 * _Offset_Size.x;
    u_xlat7.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat1.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy / u_xlat7.xy;
    u_xlat15.xy = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xw = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = floor(u_xlat15.xy);
    u_xlat1.xy = min(abs(u_xlat1.xy), vec2(1.0, 1.0));
    u_xlat1.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xwxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb16.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat0.xwxw).xy;
    u_xlati8.xy = ivec2(uvec2((uint(u_xlatb8.x) * 0xffffffffu) & (uint(u_xlatb16.x) * 0xffffffffu), (uint(u_xlatb8.y) * 0xffffffffu) & (uint(u_xlatb16.y) * 0xffffffffu)));
    u_xlat8.xy = uintBitsToFloat(uvec2(uint(u_xlati8.x) & uint(1065353216u), uint(u_xlati8.y) & uint(1065353216u)));
    u_xlat8.x = u_xlat8.x * u_xlat8.y + (-u_xlat1.x);
    u_xlat1.x = _MainTexTil * u_xlat8.x + u_xlat1.x;
    u_xlat8.xy = vec2(1.0, 1.0) / _Offset_Size.zw;
    u_xlat16.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + vec2(1.0, 1.0);
    u_xlatb16.xy = greaterThanEqual(u_xlat16.xyxy, u_xlat0.xwxw).xy;
    u_xlat3.xy = u_xlat8.xy * vec2(_MiaobianIntensity);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xwxx, (-u_xlat3.xyxx)).xy;
    u_xlati16.xy = ivec2(uvec2((uint(u_xlatb16.x) * 0xffffffffu) & (uint(u_xlatb4.x) * 0xffffffffu), (uint(u_xlatb16.y) * 0xffffffffu) & (uint(u_xlatb4.y) * 0xffffffffu)));
    u_xlat16.xy = uintBitsToFloat(uvec2(uint(u_xlati16.x) & uint(1065353216u), uint(u_xlati16.y) & uint(1065353216u)));
    u_xlat22 = u_xlat16.y * u_xlat16.x;
    u_xlat22 = u_xlat1.x * u_xlat22 + (-u_xlat1.x);
    u_xlat1.x = _miaobianTogole * u_xlat22 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16.xy = (-vec2(_MiaobianIntensity)) * u_xlat8.xy + u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = u_xlat8.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat16_8 = texture(_MainMask, u_xlat8.xy).x;
    u_xlat15.xy = u_xlat16.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat15.xy = u_xlat1.xx * u_xlat15.xy;
    u_xlat16_15 = texture(_MainMask, u_xlat15.xy).x;
    u_xlat8.x = (-u_xlat16_8) + u_xlat16_15;
    u_xlat3.zw = (-u_xlat3.xy);
    u_xlat3 = u_xlat0.xwxw + (-u_xlat3.zyxw);
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xw = min(max(u_xlat0.xw, 0.0), 1.0);
#else
    u_xlat0.xw = clamp(u_xlat0.xw, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat0.xw * u_xlat7.xy + u_xlat2.xy;
    u_xlat2 = u_xlat3 * u_xlat7.xyxy + u_xlat2.xyxy;
    u_xlat2 = u_xlat1.xxxx * u_xlat2;
    u_xlat16_7 = texture(_MainMask, u_xlat2.xy).x;
    u_xlat16_14 = texture(_MainMask, u_xlat2.zw).x;
    u_xlat7.x = (-u_xlat16_14) + u_xlat16_7;
    u_xlat7.x = abs(u_xlat7.x) + abs(u_xlat8.x);
    u_xlat7.x = min(u_xlat7.x, 1.0);
    u_xlat16_14 = texture(_MainMask, u_xlat0.xw).x;
    u_xlat2.xyz = texture(_MainTex, u_xlat0.xw).xyz;
    u_xlat0.x = (-u_xlat1.x) * u_xlat16_14 + u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat0.x = _MiaobianModel * u_xlat7.x + u_xlat0.x;
    u_xlat7.x = u_xlat0.x * _miaobianColor.w;
    u_xlat3.w = u_xlat1.x * u_xlat16_14 + u_xlat7.x;
    u_xlat2.w = u_xlat16_14 * u_xlat1.x;
    u_xlat7.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat0.xxx);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat0.xxx * _miaobianColor.xyz + u_xlat7.xyz;
    u_xlat1 = (-u_xlat2) + u_xlat3;
    u_xlat1 = vec4(vec4(_miaobianTogole, _miaobianTogole, _miaobianTogole, _miaobianTogole)) * u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat0.xxxx * _miaobianColor + (-u_xlat1);
    u_xlat0 = vec4(_MainTexTogole) * u_xlat0 + u_xlat1;
    u_xlat1 = u_xlat2.wwww * _jianyingColor + (-u_xlat0);
    u_xlat0 = vec4(_jianyingTologe) * u_xlat1 + u_xlat0;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat1.xy = u_xlat1.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat15.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + _Saoguang_RatatorCenter.xy;
    u_xlat15.x = _Time.y * 0.300000012;
    u_xlat2.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat1.xy = u_xlat15.xx * u_xlat2.xy + u_xlat1.xy;
    u_xlat15.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat1.xy = u_xlat1.xy / u_xlat15.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat15.xy * u_xlat1.xy;
    u_xlat16_1 = texture(_Saoguang, u_xlat1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * _Saoguang_Color.xyz + (-u_xlat0.xyz);
    u_xlat1 = u_xlat16_1 * _Saoguang_Color;
    u_xlat23 = u_xlat1.w * _Saoguang_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz + (-u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Saoguang_Intensity) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlatb3.xy = lessThan(vec4(vec4(_Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode)), vec4(0.5, 1.5, 0.0, 0.0)).xy;
    u_xlat16_5.xyz = (u_xlatb3.y) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat16_5.xyz = (u_xlatb3.x) ? u_xlat1.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_26 = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_26 = (-u_xlat16_26) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_5.xyz;
    SV_Target0.w = u_xlat0.w * u_xlat16_26;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MiaobianModel;
uniform 	float _MiaobianIntensity;
uniform 	float _miaobianTogole;
uniform 	vec4 _miaobianColor;
uniform 	float _MainTexTogole;
uniform 	vec4 _jianyingColor;
uniform 	float _jianyingTologe;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Mode;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MainMask;
uniform lowp sampler2D _Saoguang;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec2 u_xlat8;
lowp float u_xlat10_8;
ivec2 u_xlati8;
bvec2 u_xlatb8;
float u_xlat14;
lowp float u_xlat10_14;
vec2 u_xlat15;
lowp float u_xlat10_15;
vec2 u_xlat16;
ivec2 u_xlati16;
bvec2 u_xlatb16;
float u_xlat22;
float u_xlat23;
mediump float u_xlat16_26;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlat0.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat7.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat14 = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat14 * u_xlat7.x;
    u_xlat7.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat7.x * u_xlat14;
    u_xlat7.x = u_xlat7.x + (-_Offset_Size.w);
    u_xlat2.y = u_xlat14 * u_xlat7.x;
    u_xlat2.x = u_xlat14 * _Offset_Size.x;
    u_xlat7.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat1.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy / u_xlat7.xy;
    u_xlat15.xy = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xw = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = floor(u_xlat15.xy);
    u_xlat1.xy = min(abs(u_xlat1.xy), vec2(1.0, 1.0));
    u_xlat1.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xwxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb16.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat0.xwxw).xy;
    u_xlati8.xy = op_and((ivec2(u_xlatb8.xy) * -1), (ivec2(u_xlatb16.xy) * -1));
    u_xlat8.xy = vec2(op_and(u_xlati8.xy, ivec2(1065353216, 1065353216)));
    u_xlat8.x = u_xlat8.x * u_xlat8.y + (-u_xlat1.x);
    u_xlat1.x = _MainTexTil * u_xlat8.x + u_xlat1.x;
    u_xlat8.xy = vec2(1.0, 1.0) / _Offset_Size.zw;
    u_xlat16.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + vec2(1.0, 1.0);
    u_xlatb16.xy = greaterThanEqual(u_xlat16.xyxy, u_xlat0.xwxw).xy;
    u_xlat3.xy = u_xlat8.xy * vec2(_MiaobianIntensity);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xwxx, (-u_xlat3.xyxx)).xy;
    u_xlati16.xy = op_and((ivec2(u_xlatb16.xy) * -1), (ivec2(u_xlatb4.xy) * -1));
    u_xlat16.xy = vec2(op_and(u_xlati16.xy, ivec2(1065353216, 1065353216)));
    u_xlat22 = u_xlat16.y * u_xlat16.x;
    u_xlat22 = u_xlat1.x * u_xlat22 + (-u_xlat1.x);
    u_xlat1.x = _miaobianTogole * u_xlat22 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat16.xy = (-vec2(_MiaobianIntensity)) * u_xlat8.xy + u_xlat0.xw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat8.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + u_xlat0.xw;
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat8.xy = u_xlat8.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat10_8 = texture2D(_MainMask, u_xlat8.xy).x;
    u_xlat15.xy = u_xlat16.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat15.xy = u_xlat1.xx * u_xlat15.xy;
    u_xlat10_15 = texture2D(_MainMask, u_xlat15.xy).x;
    u_xlat8.x = (-u_xlat10_8) + u_xlat10_15;
    u_xlat3.zw = (-u_xlat3.xy);
    u_xlat3 = u_xlat0.xwxw + (-u_xlat3.zyxw);
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xw = u_xlat0.xw;
    u_xlat0.xw = clamp(u_xlat0.xw, 0.0, 1.0);
    u_xlat0.xw = u_xlat0.xw * u_xlat7.xy + u_xlat2.xy;
    u_xlat2 = u_xlat3 * u_xlat7.xyxy + u_xlat2.xyxy;
    u_xlat2 = u_xlat1.xxxx * u_xlat2;
    u_xlat10_7 = texture2D(_MainMask, u_xlat2.xy).x;
    u_xlat10_14 = texture2D(_MainMask, u_xlat2.zw).x;
    u_xlat7.x = (-u_xlat10_14) + u_xlat10_7;
    u_xlat7.x = abs(u_xlat7.x) + abs(u_xlat8.x);
    u_xlat7.x = min(u_xlat7.x, 1.0);
    u_xlat10_14 = texture2D(_MainMask, u_xlat0.xw).x;
    u_xlat2.xyz = texture2D(_MainTex, u_xlat0.xw).xyz;
    u_xlat0.x = (-u_xlat1.x) * u_xlat10_14 + u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat0.x = _MiaobianModel * u_xlat7.x + u_xlat0.x;
    u_xlat7.x = u_xlat0.x * _miaobianColor.w;
    u_xlat3.w = u_xlat1.x * u_xlat10_14 + u_xlat7.x;
    u_xlat2.w = u_xlat10_14 * u_xlat1.x;
    u_xlat7.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat0.xxx);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat0.xxx * _miaobianColor.xyz + u_xlat7.xyz;
    u_xlat1 = (-u_xlat2) + u_xlat3;
    u_xlat1 = vec4(vec4(_miaobianTogole, _miaobianTogole, _miaobianTogole, _miaobianTogole)) * u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat0.xxxx * _miaobianColor + (-u_xlat1);
    u_xlat0 = vec4(_MainTexTogole) * u_xlat0 + u_xlat1;
    u_xlat1 = u_xlat2.wwww * _jianyingColor + (-u_xlat0);
    u_xlat0 = vec4(_jianyingTologe) * u_xlat1 + u_xlat0;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat1.xy = u_xlat1.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat15.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + _Saoguang_RatatorCenter.xy;
    u_xlat15.x = _Time.y * 0.300000012;
    u_xlat2.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat1.xy = u_xlat15.xx * u_xlat2.xy + u_xlat1.xy;
    u_xlat15.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat1.xy = u_xlat1.xy / u_xlat15.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat15.xy * u_xlat1.xy;
    u_xlat10_1 = texture2D(_Saoguang, u_xlat1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * _Saoguang_Color.xyz + (-u_xlat0.xyz);
    u_xlat1 = u_xlat10_1 * _Saoguang_Color;
    u_xlat23 = u_xlat1.w * _Saoguang_Intensity;
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz + (-u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Saoguang_Intensity) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlatb3.xy = lessThan(vec4(vec4(_Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode)), vec4(0.5, 1.5, 0.0, 0.0)).xy;
    u_xlat16_5.xyz = (u_xlatb3.y) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat16_5.xyz = (u_xlatb3.x) ? u_xlat1.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_26 = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_26 = (-u_xlat16_26) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_5.xyz;
    SV_Target0.w = u_xlat0.w * u_xlat16_26;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MiaobianModel;
uniform 	float _MiaobianIntensity;
uniform 	float _miaobianTogole;
uniform 	vec4 _miaobianColor;
uniform 	float _MainTexTogole;
uniform 	vec4 _jianyingColor;
uniform 	float _jianyingTologe;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Mode;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MainMask;
uniform lowp sampler2D _Saoguang;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec2 u_xlat8;
lowp float u_xlat10_8;
ivec2 u_xlati8;
bvec2 u_xlatb8;
float u_xlat14;
lowp float u_xlat10_14;
vec2 u_xlat15;
lowp float u_xlat10_15;
vec2 u_xlat16;
ivec2 u_xlati16;
bvec2 u_xlatb16;
float u_xlat22;
float u_xlat23;
mediump float u_xlat16_26;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlat0.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat7.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat14 = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat14 * u_xlat7.x;
    u_xlat7.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat7.x * u_xlat14;
    u_xlat7.x = u_xlat7.x + (-_Offset_Size.w);
    u_xlat2.y = u_xlat14 * u_xlat7.x;
    u_xlat2.x = u_xlat14 * _Offset_Size.x;
    u_xlat7.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat1.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat1.xy = (-u_xlat2.xy) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy / u_xlat7.xy;
    u_xlat15.xy = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xw = u_xlat1.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat0.xx;
    u_xlat1.xy = floor(u_xlat15.xy);
    u_xlat1.xy = min(abs(u_xlat1.xy), vec2(1.0, 1.0));
    u_xlat1.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlatb8.xy = greaterThanEqual(u_xlat0.xwxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb16.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat0.xwxw).xy;
    u_xlati8.xy = op_and((ivec2(u_xlatb8.xy) * -1), (ivec2(u_xlatb16.xy) * -1));
    u_xlat8.xy = vec2(op_and(u_xlati8.xy, ivec2(1065353216, 1065353216)));
    u_xlat8.x = u_xlat8.x * u_xlat8.y + (-u_xlat1.x);
    u_xlat1.x = _MainTexTil * u_xlat8.x + u_xlat1.x;
    u_xlat8.xy = vec2(1.0, 1.0) / _Offset_Size.zw;
    u_xlat16.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + vec2(1.0, 1.0);
    u_xlatb16.xy = greaterThanEqual(u_xlat16.xyxy, u_xlat0.xwxw).xy;
    u_xlat3.xy = u_xlat8.xy * vec2(_MiaobianIntensity);
    u_xlatb4.xy = greaterThanEqual(u_xlat0.xwxx, (-u_xlat3.xyxx)).xy;
    u_xlati16.xy = op_and((ivec2(u_xlatb16.xy) * -1), (ivec2(u_xlatb4.xy) * -1));
    u_xlat16.xy = vec2(op_and(u_xlati16.xy, ivec2(1065353216, 1065353216)));
    u_xlat22 = u_xlat16.y * u_xlat16.x;
    u_xlat22 = u_xlat1.x * u_xlat22 + (-u_xlat1.x);
    u_xlat1.x = _miaobianTogole * u_xlat22 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat16.xy = (-vec2(_MiaobianIntensity)) * u_xlat8.xy + u_xlat0.xw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat8.xy = vec2(_MiaobianIntensity) * u_xlat8.xy + u_xlat0.xw;
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat8.xy = u_xlat8.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat10_8 = texture2D(_MainMask, u_xlat8.xy).x;
    u_xlat15.xy = u_xlat16.xy * u_xlat7.xy + u_xlat2.xy;
    u_xlat15.xy = u_xlat1.xx * u_xlat15.xy;
    u_xlat10_15 = texture2D(_MainMask, u_xlat15.xy).x;
    u_xlat8.x = (-u_xlat10_8) + u_xlat10_15;
    u_xlat3.zw = (-u_xlat3.xy);
    u_xlat3 = u_xlat0.xwxw + (-u_xlat3.zyxw);
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.xw = u_xlat0.xw;
    u_xlat0.xw = clamp(u_xlat0.xw, 0.0, 1.0);
    u_xlat0.xw = u_xlat0.xw * u_xlat7.xy + u_xlat2.xy;
    u_xlat2 = u_xlat3 * u_xlat7.xyxy + u_xlat2.xyxy;
    u_xlat2 = u_xlat1.xxxx * u_xlat2;
    u_xlat10_7 = texture2D(_MainMask, u_xlat2.xy).x;
    u_xlat10_14 = texture2D(_MainMask, u_xlat2.zw).x;
    u_xlat7.x = (-u_xlat10_14) + u_xlat10_7;
    u_xlat7.x = abs(u_xlat7.x) + abs(u_xlat8.x);
    u_xlat7.x = min(u_xlat7.x, 1.0);
    u_xlat10_14 = texture2D(_MainMask, u_xlat0.xw).x;
    u_xlat2.xyz = texture2D(_MainTex, u_xlat0.xw).xyz;
    u_xlat0.x = (-u_xlat1.x) * u_xlat10_14 + u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = (-u_xlat0.x) + u_xlat7.x;
    u_xlat0.x = _MiaobianModel * u_xlat7.x + u_xlat0.x;
    u_xlat7.x = u_xlat0.x * _miaobianColor.w;
    u_xlat3.w = u_xlat1.x * u_xlat10_14 + u_xlat7.x;
    u_xlat2.w = u_xlat10_14 * u_xlat1.x;
    u_xlat7.xyz = u_xlat2.xyz * u_xlat2.www + (-u_xlat0.xxx);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat0.xxx * _miaobianColor.xyz + u_xlat7.xyz;
    u_xlat1 = (-u_xlat2) + u_xlat3;
    u_xlat1 = vec4(vec4(_miaobianTogole, _miaobianTogole, _miaobianTogole, _miaobianTogole)) * u_xlat1 + u_xlat2;
    u_xlat0 = u_xlat0.xxxx * _miaobianColor + (-u_xlat1);
    u_xlat0 = vec4(_MainTexTogole) * u_xlat0 + u_xlat1;
    u_xlat1 = u_xlat2.wwww * _jianyingColor + (-u_xlat0);
    u_xlat0 = vec4(_jianyingTologe) * u_xlat1 + u_xlat0;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat1.xy = u_xlat1.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat15.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + _Saoguang_RatatorCenter.xy;
    u_xlat15.x = _Time.y * 0.300000012;
    u_xlat2.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat1.xy = u_xlat15.xx * u_xlat2.xy + u_xlat1.xy;
    u_xlat15.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat1.xy = u_xlat1.xy / u_xlat15.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat15.xy * u_xlat1.xy;
    u_xlat10_1 = texture2D(_Saoguang, u_xlat1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * _Saoguang_Color.xyz + (-u_xlat0.xyz);
    u_xlat1 = u_xlat10_1 * _Saoguang_Color;
    u_xlat23 = u_xlat1.w * _Saoguang_Intensity;
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz + (-u_xlat0.xyz);
    u_xlat1.xyz = u_xlat1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Saoguang_Intensity) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlatb3.xy = lessThan(vec4(vec4(_Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode, _Saoguang_Mode)), vec4(0.5, 1.5, 0.0, 0.0)).xy;
    u_xlat16_5.xyz = (u_xlatb3.y) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat16_5.xyz = (u_xlatb3.x) ? u_xlat1.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_26 = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_26 = (-u_xlat16_26) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_26) * u_xlat16_5.xyz;
    SV_Target0.w = u_xlat0.w * u_xlat16_26;
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