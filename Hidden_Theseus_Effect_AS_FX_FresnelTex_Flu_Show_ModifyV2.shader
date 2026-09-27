//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/Effect/AS_FX_FresnelTex_Flu_Show_ModifyV2" {
Properties {

_Usage ("仅能用于Theseus工艺的皮肤特效", Float) = 1.0

[Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

_MainColorPower ("MainColorPower", Float) = 1.0

_MainColor ("MainColor", Color) = (1,1,1,1)

_MainTex ("MainTex", 2D) = "white" { }

_Normal ("Normal", 2D) = "bump" { }

_FresnelPower ("FresnelPower", Float) = 0.10000000149011612

_FresnelScale ("FresnelScale", Float) = 1.0

_FresnelTex ("FresnelTex", 2D) = "white" { }

[Toggle] _FresTexUse2U ("FresTex使用2U", Float) = 0.0

_FresnelColor ("FresnelColor", Color) = (0,0,0,1)

_Mask ("Mask(R:菲涅尔)(G:流光)(B:透明区域)", 2D) = "white" { }

[Toggle] _Mask_Use2U ("Mask使用2U", Float) = 1.0

_Mask_B_Alpha ("Mask_B_Alpha", Range(0, 1)) = 1.0

_Alpha ("Alpha", Range(0, 1)) = 1.0

[Enum(2U,0,ScreenUV,1)] _Flu_UV ("Flu_UV", Float) = 0.0

_Flu_Tex ("Flu_Tex(R:流光)", 2D) = "black" { }

_Flu_Color ("Flu_Color", Color) = (1,1,1,1)

_Flu_Speed_U ("Flu_Speed_U", Float) = 0.0

_Flu_Speed_V ("Flu_Speed_V", Float) = 0.0

_Flu_Power ("Flu_Power", Float) = 1.0

_Flu_LineSpace ("Flu_LineSpace", Range(1, 10)) = 10.0

_DissolveTex ("R:溶解纹理 G:溶解扰动", 2D) = "black" { }

[Enum(1U,0,2U,1,ScreenUV,2)] _DisUV_Select ("溶解UV选择", Float) = 0.0

[Enum(U,0,V,1)] _Dissolve_Dir ("溶解UV方向", Float) = 0.0

_DisDir_Weight ("溶解方向权重", Range(0, 1)) = 0.5

_DisNoise_TiSp ("溶解扰动 XY:Tiling ZW:Speed", Vector) = (1,1,0,0)

_DisNoise_Intensity ("溶解扰动强度", Float) = 0.0

_SoftSize ("SoftSize", Range(0, 2)) = 0.0

_DissolveStep ("DissolveStep", Range(0, 1)) = 0.0

[Toggle(_IS_CUSTOM)] _IS_CUSTOM ("自定义颜色", Float) = 0.0

_DissolveColor ("DissolveColor", Color) = (1,1,1,1)

_DissolveColorPW ("DissolveColorPW", Float) = 1.0

_Emissive ("Emissive", 2D) = "black" { }

_EmissivePower ("EmissivePower", Float) = 1.0

[Space(10)] [Toggle] _FresAlpha ("FresAlpha", Float) = 0.0

_FresAlpha_Intensity ("菲涅尔半透强度", Float) = 1.0

_FresAlpha_Power ("菲涅尔半透范围", Range(0.01, 10)) = 1.0

[Toggle(_NerverCut)] _NerverCut ("永不裁剪", Float) = 0.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

[Enum(On, 0,Off, 4)] _MLZTest ("总是最前", Float) = 4.0

[Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Float) = 1.0

}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 40137
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _NerverCut;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_NerverCut==1.0);
#else
    u_xlatb0 = _NerverCut==1.0;
#endif
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
    u_xlat4 = u_xlat1.w * u_xlat1.w;
    u_xlat4 = u_xlat4 * 0.999998987;
    gl_Position.z = (u_xlatb0) ? u_xlat4 : u_xlat1.z;
    gl_Position.xyw = u_xlat1.xyw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Normal_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	vec4 _FresnelTex_ST;
uniform 	mediump float _FresTexUse2U;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _Mask_Use2U;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	float _Flu_LineSpace;
uniform 	vec4 _DissolveTex_ST;
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	vec4 _Emissive_ST;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform 	float _FresAlpha;
uniform 	float _FresAlpha_Power;
uniform 	float _FresAlpha_Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec4 u_xlatb2;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
vec2 u_xlat5;
vec2 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
bool u_xlatb12;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD2.xyz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_7.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_7.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresTexUse2U));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresTexUse2U);
#endif
    u_xlat6.xy = (bool(u_xlatb6)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat6.xy * _FresnelTex_ST.xy + _FresnelTex_ST.zw;
    u_xlat16_6.xyz = texture(_FresnelTex, u_xlat6.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _FresnelColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Mask_Use2U));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Mask_Use2U);
#endif
    u_xlat6.xy = (bool(u_xlatb6)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_6.xyz = texture(_Mask, u_xlat6.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xxx * u_xlat16_7.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_7.xyz;
    u_xlat6.x = _Time.y * _Flu_Speed_V;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Flu_UV==1.0);
#else
    u_xlatb2.x = _Flu_UV==1.0;
#endif
    u_xlat8.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat4.xy = (u_xlatb2.x) ? u_xlat8.xy : vs_TEXCOORD1.xy;
    u_xlat5.y = u_xlat4.y * _Flu_LineSpace + u_xlat6.x;
    u_xlat5.x = _Time.y * _Flu_Speed_U + u_xlat4.x;
    u_xlat4.xy = u_xlat5.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_6.x = texture(_Flu_Tex, u_xlat4.xy).x;
    u_xlat16_3.x = u_xlat16_6.y * u_xlat16_6.x;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Flu_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_7.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_4.xyz = texture(_Emissive, u_xlat6.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_EmissivePower) + u_xlat16_7.xyz;
    u_xlat16_7.x = u_xlat16_4.x + _MainColor.w;
    u_xlat16_13 = u_xlat16_6.z + _Mask_B_Alpha;
    u_xlat16_13 = u_xlat16_6.z * u_xlat16_13;
    u_xlat16_13 = u_xlat16_2.w * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * vs_COLOR0.w;
    u_xlat16_3.w = u_xlat16_13 * _Alpha;
    u_xlat16_4 = _DissolveColor * vec4(_DissolveColorPW) + (-u_xlat16_3);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DisUV_Select));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DisUV_Select);
#endif
    u_xlat6.xy = (bool(u_xlatb6)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlatb2.xw = equal(vec4(_DisUV_Select), vec4(1.0, 0.0, 0.0, 2.0)).xw;
    u_xlat6.xy = (u_xlatb2.w) ? u_xlat8.xy : u_xlat6.xy;
    u_xlat6.xy = (u_xlatb2.x) ? vs_TEXCOORD1.xy : u_xlat6.xy;
    u_xlat2.xy = _Time.yy * _DisNoise_TiSp.zw;
    u_xlat2.xy = u_xlat6.xy * _DisNoise_TiSp.xy + u_xlat2.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat2.xy).y;
    u_xlat2.xy = vec2(u_xlat16_18) * vec2(_DisNoise_Intensity) + u_xlat6.xy;
    u_xlat2.xy = u_xlat2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_18 = texture(_DissolveTex, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat6.x = (u_xlatb2.x) ? u_xlat6.y : u_xlat6.x;
    u_xlat6.x = (-u_xlat16_18) + u_xlat6.x;
    u_xlat6.x = _DisDir_Weight * u_xlat6.x + u_xlat16_18;
    u_xlat6.x = max(u_xlat6.x, 0.00999999978);
    u_xlat6.x = u_xlat6.x + (-_DissolveStep);
    u_xlat16_13 = max(_SoftSize, 0.00999999978);
    u_xlat16_19 = max(_DissolveStep, 0.00999999978);
    u_xlat16_13 = u_xlat16_19 * u_xlat16_13;
    u_xlat6.x = u_xlat6.x / u_xlat16_13;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.800000012>=u_xlat6.x);
#else
    u_xlatb12 = 0.800000012>=u_xlat6.x;
#endif
    u_xlat16_13 = (u_xlatb12) ? _IS_CUSTOM : 0.0;
    u_xlat16_2 = vec4(u_xlat16_13) * u_xlat16_4 + u_xlat16_3;
    u_xlat16_13 = u_xlat6.x * u_xlat16_2.w;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_13;
    u_xlat16_13 = u_xlat16_2.w * u_xlat6.x + (-u_xlat16_7.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13 + u_xlat16_7.x;
    SV_Target0.xyz = u_xlat16_2.xyz;
    u_xlat6.x = _FresAlpha_Power * 8.0 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresAlpha_Intensity;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_FresAlpha);
#else
    u_xlatb6 = 0.0<_FresAlpha;
#endif
    SV_Target0.w = (u_xlatb6) ? u_xlat0.x : u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _NerverCut;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_NerverCut==1.0);
#else
    u_xlatb0 = _NerverCut==1.0;
#endif
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
    u_xlat4 = u_xlat1.w * u_xlat1.w;
    u_xlat4 = u_xlat4 * 0.999998987;
    gl_Position.z = (u_xlatb0) ? u_xlat4 : u_xlat1.z;
    gl_Position.xyw = u_xlat1.xyw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Normal_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	vec4 _FresnelTex_ST;
uniform 	mediump float _FresTexUse2U;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _Mask_Use2U;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	float _Flu_LineSpace;
uniform 	vec4 _DissolveTex_ST;
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	vec4 _Emissive_ST;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform 	float _FresAlpha;
uniform 	float _FresAlpha_Power;
uniform 	float _FresAlpha_Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec4 u_xlatb2;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
vec2 u_xlat5;
vec2 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
bool u_xlatb12;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD2.xyz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_7.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_7.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresTexUse2U));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresTexUse2U);
#endif
    u_xlat6.xy = (bool(u_xlatb6)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat6.xy * _FresnelTex_ST.xy + _FresnelTex_ST.zw;
    u_xlat16_6.xyz = texture(_FresnelTex, u_xlat6.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _FresnelColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Mask_Use2U));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Mask_Use2U);
#endif
    u_xlat6.xy = (bool(u_xlatb6)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_6.xyz = texture(_Mask, u_xlat6.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xxx * u_xlat16_7.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_7.xyz;
    u_xlat6.x = _Time.y * _Flu_Speed_V;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Flu_UV==1.0);
#else
    u_xlatb2.x = _Flu_UV==1.0;
#endif
    u_xlat8.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat4.xy = (u_xlatb2.x) ? u_xlat8.xy : vs_TEXCOORD1.xy;
    u_xlat5.y = u_xlat4.y * _Flu_LineSpace + u_xlat6.x;
    u_xlat5.x = _Time.y * _Flu_Speed_U + u_xlat4.x;
    u_xlat4.xy = u_xlat5.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_6.x = texture(_Flu_Tex, u_xlat4.xy).x;
    u_xlat16_3.x = u_xlat16_6.y * u_xlat16_6.x;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Flu_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_7.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_4.xyz = texture(_Emissive, u_xlat6.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_EmissivePower) + u_xlat16_7.xyz;
    u_xlat16_7.x = u_xlat16_4.x + _MainColor.w;
    u_xlat16_13 = u_xlat16_6.z + _Mask_B_Alpha;
    u_xlat16_13 = u_xlat16_6.z * u_xlat16_13;
    u_xlat16_13 = u_xlat16_2.w * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * vs_COLOR0.w;
    u_xlat16_3.w = u_xlat16_13 * _Alpha;
    u_xlat16_4 = _DissolveColor * vec4(_DissolveColorPW) + (-u_xlat16_3);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DisUV_Select));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DisUV_Select);
#endif
    u_xlat6.xy = (bool(u_xlatb6)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlatb2.xw = equal(vec4(_DisUV_Select), vec4(1.0, 0.0, 0.0, 2.0)).xw;
    u_xlat6.xy = (u_xlatb2.w) ? u_xlat8.xy : u_xlat6.xy;
    u_xlat6.xy = (u_xlatb2.x) ? vs_TEXCOORD1.xy : u_xlat6.xy;
    u_xlat2.xy = _Time.yy * _DisNoise_TiSp.zw;
    u_xlat2.xy = u_xlat6.xy * _DisNoise_TiSp.xy + u_xlat2.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat2.xy).y;
    u_xlat2.xy = vec2(u_xlat16_18) * vec2(_DisNoise_Intensity) + u_xlat6.xy;
    u_xlat2.xy = u_xlat2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_18 = texture(_DissolveTex, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat6.x = (u_xlatb2.x) ? u_xlat6.y : u_xlat6.x;
    u_xlat6.x = (-u_xlat16_18) + u_xlat6.x;
    u_xlat6.x = _DisDir_Weight * u_xlat6.x + u_xlat16_18;
    u_xlat6.x = max(u_xlat6.x, 0.00999999978);
    u_xlat6.x = u_xlat6.x + (-_DissolveStep);
    u_xlat16_13 = max(_SoftSize, 0.00999999978);
    u_xlat16_19 = max(_DissolveStep, 0.00999999978);
    u_xlat16_13 = u_xlat16_19 * u_xlat16_13;
    u_xlat6.x = u_xlat6.x / u_xlat16_13;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.800000012>=u_xlat6.x);
#else
    u_xlatb12 = 0.800000012>=u_xlat6.x;
#endif
    u_xlat16_13 = (u_xlatb12) ? _IS_CUSTOM : 0.0;
    u_xlat16_2 = vec4(u_xlat16_13) * u_xlat16_4 + u_xlat16_3;
    u_xlat16_13 = u_xlat6.x * u_xlat16_2.w;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_13;
    u_xlat16_13 = u_xlat16_2.w * u_xlat6.x + (-u_xlat16_7.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13 + u_xlat16_7.x;
    SV_Target0.xyz = u_xlat16_2.xyz;
    u_xlat6.x = _FresAlpha_Power * 8.0 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresAlpha_Intensity;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_FresAlpha);
#else
    u_xlatb6 = 0.0<_FresAlpha;
#endif
    SV_Target0.w = (u_xlatb6) ? u_xlat0.x : u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _NerverCut;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlatb0 = _NerverCut==1.0;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
    u_xlat4 = u_xlat1.w * u_xlat1.w;
    u_xlat4 = u_xlat4 * 0.999998987;
    gl_Position.z = (u_xlatb0) ? u_xlat4 : u_xlat1.z;
    gl_Position.xyw = u_xlat1.xyw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Normal_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	vec4 _FresnelTex_ST;
uniform 	mediump float _FresTexUse2U;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _Mask_Use2U;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	float _Flu_LineSpace;
uniform 	vec4 _DissolveTex_ST;
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	vec4 _Emissive_ST;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform 	float _FresAlpha;
uniform 	float _FresAlpha_Power;
uniform 	float _FresAlpha_Intensity;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _FresnelTex;
uniform lowp sampler2D _Emissive;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
bvec4 u_xlatb2;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
vec2 u_xlat6;
lowp vec3 u_xlat10_6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
bool u_xlatb12;
mediump float u_xlat16_13;
float u_xlat18;
lowp float u_xlat10_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_0.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD2.xyz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_7.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_7.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresTexUse2U);
    u_xlat6.xy = (bool(u_xlatb6)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat6.xy * _FresnelTex_ST.xy + _FresnelTex_ST.zw;
    u_xlat10_6.xyz = texture2D(_FresnelTex, u_xlat6.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_6.xyz * _FresnelColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Mask_Use2U);
    u_xlat6.xy = (bool(u_xlatb6)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_6.xyz = texture2D(_Mask, u_xlat6.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_6.xxx * u_xlat16_7.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_7.xyz;
    u_xlat6.x = _Time.y * _Flu_Speed_V;
    u_xlatb2.x = _Flu_UV==1.0;
    u_xlat8.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat4.xy = (u_xlatb2.x) ? u_xlat8.xy : vs_TEXCOORD1.xy;
    u_xlat5.y = u_xlat4.y * _Flu_LineSpace + u_xlat6.x;
    u_xlat5.x = _Time.y * _Flu_Speed_U + u_xlat4.x;
    u_xlat4.xy = u_xlat5.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_6.x = texture2D(_Flu_Tex, u_xlat4.xy).x;
    u_xlat16_3.x = u_xlat10_6.y * u_xlat10_6.x;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Flu_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_7.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_4.xyz = texture2D(_Emissive, u_xlat6.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_4.xyz * vec3(_EmissivePower) + u_xlat16_7.xyz;
    u_xlat16_7.x = u_xlat10_4.x + _MainColor.w;
    u_xlat16_13 = u_xlat10_6.z + _Mask_B_Alpha;
    u_xlat16_13 = u_xlat10_6.z * u_xlat16_13;
    u_xlat16_13 = u_xlat10_2.w * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * vs_COLOR0.w;
    u_xlat16_3.w = u_xlat16_13 * _Alpha;
    u_xlat16_4 = _DissolveColor * vec4(_DissolveColorPW) + (-u_xlat16_3);
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DisUV_Select);
    u_xlat6.xy = (bool(u_xlatb6)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlatb2.xw = equal(vec4(_DisUV_Select), vec4(1.0, 0.0, 0.0, 2.0)).xw;
    u_xlat6.xy = (u_xlatb2.w) ? u_xlat8.xy : u_xlat6.xy;
    u_xlat6.xy = (u_xlatb2.x) ? vs_TEXCOORD1.xy : u_xlat6.xy;
    u_xlat2.xy = _Time.yy * _DisNoise_TiSp.zw;
    u_xlat2.xy = u_xlat6.xy * _DisNoise_TiSp.xy + u_xlat2.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat2.xy).y;
    u_xlat2.xy = vec2(u_xlat10_18) * vec2(_DisNoise_Intensity) + u_xlat6.xy;
    u_xlat2.xy = u_xlat2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat2.xy).x;
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat6.x = (u_xlatb2.x) ? u_xlat6.y : u_xlat6.x;
    u_xlat6.x = (-u_xlat10_18) + u_xlat6.x;
    u_xlat6.x = _DisDir_Weight * u_xlat6.x + u_xlat10_18;
    u_xlat6.x = max(u_xlat6.x, 0.00999999978);
    u_xlat6.x = u_xlat6.x + (-_DissolveStep);
    u_xlat16_13 = max(_SoftSize, 0.00999999978);
    u_xlat16_19 = max(_DissolveStep, 0.00999999978);
    u_xlat16_13 = u_xlat16_19 * u_xlat16_13;
    u_xlat6.x = u_xlat6.x / u_xlat16_13;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlatb12 = 0.800000012>=u_xlat6.x;
    u_xlat16_13 = (u_xlatb12) ? _IS_CUSTOM : 0.0;
    u_xlat16_2 = vec4(u_xlat16_13) * u_xlat16_4 + u_xlat16_3;
    u_xlat16_13 = u_xlat6.x * u_xlat16_2.w;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_13;
    u_xlat16_13 = u_xlat16_2.w * u_xlat6.x + (-u_xlat16_7.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13 + u_xlat16_7.x;
    SV_Target0.xyz = u_xlat16_2.xyz;
    u_xlat6.x = _FresAlpha_Power * 8.0 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresAlpha_Intensity;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlatb6 = 0.0<_FresAlpha;
    SV_Target0.w = (u_xlatb6) ? u_xlat0.x : u_xlat16_1.x;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _NerverCut;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlatb0 = _NerverCut==1.0;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
    u_xlat4 = u_xlat1.w * u_xlat1.w;
    u_xlat4 = u_xlat4 * 0.999998987;
    gl_Position.z = (u_xlatb0) ? u_xlat4 : u_xlat1.z;
    gl_Position.xyw = u_xlat1.xyw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Normal_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	vec4 _FresnelTex_ST;
uniform 	mediump float _FresTexUse2U;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _Mask_Use2U;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	float _Flu_LineSpace;
uniform 	vec4 _DissolveTex_ST;
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	vec4 _Emissive_ST;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform 	float _FresAlpha;
uniform 	float _FresAlpha_Power;
uniform 	float _FresAlpha_Intensity;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _FresnelTex;
uniform lowp sampler2D _Emissive;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
bvec4 u_xlatb2;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
vec2 u_xlat6;
lowp vec3 u_xlat10_6;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
bool u_xlatb12;
mediump float u_xlat16_13;
float u_xlat18;
lowp float u_xlat10_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_0.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD2.xyz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_7.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = max(u_xlat16_7.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresTexUse2U);
    u_xlat6.xy = (bool(u_xlatb6)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat6.xy * _FresnelTex_ST.xy + _FresnelTex_ST.zw;
    u_xlat10_6.xyz = texture2D(_FresnelTex, u_xlat6.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_6.xyz * _FresnelColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Mask_Use2U);
    u_xlat6.xy = (bool(u_xlatb6)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_6.xyz = texture2D(_Mask, u_xlat6.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_6.xxx * u_xlat16_7.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_7.xyz;
    u_xlat6.x = _Time.y * _Flu_Speed_V;
    u_xlatb2.x = _Flu_UV==1.0;
    u_xlat8.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat4.xy = (u_xlatb2.x) ? u_xlat8.xy : vs_TEXCOORD1.xy;
    u_xlat5.y = u_xlat4.y * _Flu_LineSpace + u_xlat6.x;
    u_xlat5.x = _Time.y * _Flu_Speed_U + u_xlat4.x;
    u_xlat4.xy = u_xlat5.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_6.x = texture2D(_Flu_Tex, u_xlat4.xy).x;
    u_xlat16_3.x = u_xlat10_6.y * u_xlat10_6.x;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Flu_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_7.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_4.xyz = texture2D(_Emissive, u_xlat6.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_4.xyz * vec3(_EmissivePower) + u_xlat16_7.xyz;
    u_xlat16_7.x = u_xlat10_4.x + _MainColor.w;
    u_xlat16_13 = u_xlat10_6.z + _Mask_B_Alpha;
    u_xlat16_13 = u_xlat10_6.z * u_xlat16_13;
    u_xlat16_13 = u_xlat10_2.w * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * vs_COLOR0.w;
    u_xlat16_3.w = u_xlat16_13 * _Alpha;
    u_xlat16_4 = _DissolveColor * vec4(_DissolveColorPW) + (-u_xlat16_3);
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DisUV_Select);
    u_xlat6.xy = (bool(u_xlatb6)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlatb2.xw = equal(vec4(_DisUV_Select), vec4(1.0, 0.0, 0.0, 2.0)).xw;
    u_xlat6.xy = (u_xlatb2.w) ? u_xlat8.xy : u_xlat6.xy;
    u_xlat6.xy = (u_xlatb2.x) ? vs_TEXCOORD1.xy : u_xlat6.xy;
    u_xlat2.xy = _Time.yy * _DisNoise_TiSp.zw;
    u_xlat2.xy = u_xlat6.xy * _DisNoise_TiSp.xy + u_xlat2.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat2.xy).y;
    u_xlat2.xy = vec2(u_xlat10_18) * vec2(_DisNoise_Intensity) + u_xlat6.xy;
    u_xlat2.xy = u_xlat2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat2.xy).x;
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat6.x = (u_xlatb2.x) ? u_xlat6.y : u_xlat6.x;
    u_xlat6.x = (-u_xlat10_18) + u_xlat6.x;
    u_xlat6.x = _DisDir_Weight * u_xlat6.x + u_xlat10_18;
    u_xlat6.x = max(u_xlat6.x, 0.00999999978);
    u_xlat6.x = u_xlat6.x + (-_DissolveStep);
    u_xlat16_13 = max(_SoftSize, 0.00999999978);
    u_xlat16_19 = max(_DissolveStep, 0.00999999978);
    u_xlat16_13 = u_xlat16_19 * u_xlat16_13;
    u_xlat6.x = u_xlat6.x / u_xlat16_13;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlatb12 = 0.800000012>=u_xlat6.x;
    u_xlat16_13 = (u_xlatb12) ? _IS_CUSTOM : 0.0;
    u_xlat16_2 = vec4(u_xlat16_13) * u_xlat16_4 + u_xlat16_3;
    u_xlat16_13 = u_xlat6.x * u_xlat16_2.w;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_13;
    u_xlat16_13 = u_xlat16_2.w * u_xlat6.x + (-u_xlat16_7.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13 + u_xlat16_7.x;
    SV_Target0.xyz = u_xlat16_2.xyz;
    u_xlat6.x = _FresAlpha_Power * 8.0 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresAlpha_Intensity;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlatb6 = 0.0<_FresAlpha;
    SV_Target0.w = (u_xlatb6) ? u_xlat0.x : u_xlat16_1.x;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _NerverCut;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_NerverCut==1.0);
#else
    u_xlatb0 = _NerverCut==1.0;
#endif
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
    u_xlat4 = u_xlat1.w * u_xlat1.w;
    u_xlat4 = u_xlat4 * 0.999998987;
    gl_Position.z = (u_xlatb0) ? u_xlat4 : u_xlat1.z;
    gl_Position.xyw = u_xlat1.xyw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Normal_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	vec4 _FresnelTex_ST;
uniform 	mediump float _FresTexUse2U;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _Mask_Use2U;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	float _Flu_LineSpace;
uniform 	vec4 _DissolveTex_ST;
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	vec4 _Emissive_ST;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform 	float _FresAlpha;
uniform 	float _FresAlpha_Power;
uniform 	float _FresAlpha_Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
bool u_xlatb14;
float u_xlat21;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresTexUse2U));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresTexUse2U);
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _FresnelTex_ST.xy + _FresnelTex_ST.zw;
    u_xlat16_0.xyz = texture(_FresnelTex, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_3.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * vs_TEXCOORD2.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_23 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_3.x = (-u_xlat16_23) + 1.0;
    u_xlat16_23 = u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat0.x = log2(u_xlat16_23);
    u_xlat16_23 = max(u_xlat16_3.x, 0.00100000005);
    u_xlat16_23 = log2(u_xlat16_23);
    u_xlat16_23 = u_xlat16_23 * _FresnelPower;
    u_xlat16_23 = exp2(u_xlat16_23);
    u_xlat16_23 = u_xlat16_23 * _FresnelScale;
    u_xlat16_23 = u_xlat16_23 * _FresnelColor.w;
    u_xlat16_2.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Mask_Use2U));
#else
    u_xlatb7 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Mask_Use2U);
#endif
    u_xlat7.xy = (bool(u_xlatb7)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_7.xyz = texture(_Mask, u_xlat7.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_1.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat4.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_3.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_2.xyz;
    u_xlat7.x = _Time.y * _Flu_Speed_V;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Flu_UV==1.0);
#else
    u_xlatb1.x = _Flu_UV==1.0;
#endif
    u_xlat8.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat4.xy = (u_xlatb1.x) ? u_xlat8.xy : vs_TEXCOORD1.xy;
    u_xlat6.y = u_xlat4.y * _Flu_LineSpace + u_xlat7.x;
    u_xlat6.x = _Time.y * _Flu_Speed_U + u_xlat4.x;
    u_xlat4.xy = u_xlat6.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_7.x = texture(_Flu_Tex, u_xlat4.xy).x;
    u_xlat1.x = u_xlat16_7.x * 0.305306017 + 0.682171106;
    u_xlat1.x = u_xlat16_7.x * u_xlat1.x + 0.0125228781;
    u_xlat7.x = u_xlat16_7.x * u_xlat1.x;
    u_xlat16_3.x = u_xlat16_7.y * u_xlat7.x;
    u_xlat16_10.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_2.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_4.xyz = texture(_Emissive, u_xlat7.xy).xyz;
    u_xlat6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_4.xyz * u_xlat6.xyz;
    u_xlat16_3.x = u_xlat16_4.x * u_xlat6.x + _MainColor.w;
    u_xlat16_4.xyz = u_xlat11.xyz * vec3(_EmissivePower) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat16_5.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat16_2.x = u_xlat16_7.z + _Mask_B_Alpha;
    u_xlat16_2.x = u_xlat16_7.z * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_1.w * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * vs_COLOR0.w;
    u_xlat16_4.w = u_xlat16_2.x * _Alpha;
    u_xlat16_5 = (-u_xlat16_4) + u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DisUV_Select));
#else
    u_xlatb7 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DisUV_Select);
#endif
    u_xlat7.xy = (bool(u_xlatb7)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlatb1.xw = equal(vec4(_DisUV_Select), vec4(1.0, 0.0, 0.0, 2.0)).xw;
    u_xlat7.xy = (u_xlatb1.w) ? u_xlat8.xy : u_xlat7.xy;
    u_xlat7.xy = (u_xlatb1.x) ? vs_TEXCOORD1.xy : u_xlat7.xy;
    u_xlat1.xy = _Time.yy * _DisNoise_TiSp.zw;
    u_xlat1.xy = u_xlat7.xy * _DisNoise_TiSp.xy + u_xlat1.xy;
    u_xlat16_21 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_21) * vec2(_DisNoise_Intensity) + u_xlat7.xy;
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb1.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat7.x = (u_xlatb1.x) ? u_xlat7.y : u_xlat7.x;
    u_xlat7.x = (-u_xlat16_21) + u_xlat7.x;
    u_xlat7.x = _DisDir_Weight * u_xlat7.x + u_xlat16_21;
    u_xlat7.x = max(u_xlat7.x, 0.00999999978);
    u_xlat7.x = u_xlat7.x + (-_DissolveStep);
    u_xlat16_2.x = max(_SoftSize, 0.00999999978);
    u_xlat16_9.x = max(_DissolveStep, 0.00999999978);
    u_xlat16_2.x = u_xlat16_9.x * u_xlat16_2.x;
    u_xlat7.x = u_xlat7.x / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat16_2.x = (u_xlatb14) ? _IS_CUSTOM : 0.0;
    u_xlat16_1 = u_xlat16_2.xxxx * u_xlat16_5 + u_xlat16_4;
    u_xlat16_2.x = u_xlat7.x * u_xlat16_1.w;
    u_xlat16_2.x = u_xlat16_3.x * u_xlat16_2.x;
    u_xlat16_9.x = u_xlat16_1.w * u_xlat7.x + (-u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_23 * u_xlat16_9.x + u_xlat16_2.x;
    u_xlat16_9.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = log2(u_xlat16_9.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat7.xyz;
    u_xlat7.x = _FresAlpha_Power * 8.0 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresAlpha_Intensity;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_FresAlpha);
#else
    u_xlatb7 = 0.0<_FresAlpha;
#endif
    SV_Target0.w = (u_xlatb7) ? u_xlat0.x : u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _NerverCut;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_NerverCut==1.0);
#else
    u_xlatb0 = _NerverCut==1.0;
#endif
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
    u_xlat4 = u_xlat1.w * u_xlat1.w;
    u_xlat4 = u_xlat4 * 0.999998987;
    gl_Position.z = (u_xlatb0) ? u_xlat4 : u_xlat1.z;
    gl_Position.xyw = u_xlat1.xyw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Normal_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	vec4 _FresnelTex_ST;
uniform 	mediump float _FresTexUse2U;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _Mask_Use2U;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	float _Flu_LineSpace;
uniform 	vec4 _DissolveTex_ST;
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	vec4 _Emissive_ST;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform 	float _FresAlpha;
uniform 	float _FresAlpha_Power;
uniform 	float _FresAlpha_Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _FresnelTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Emissive;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
bool u_xlatb14;
float u_xlat21;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresTexUse2U));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresTexUse2U);
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _FresnelTex_ST.xy + _FresnelTex_ST.zw;
    u_xlat16_0.xyz = texture(_FresnelTex, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_3.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * vs_TEXCOORD2.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_23 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_3.x = (-u_xlat16_23) + 1.0;
    u_xlat16_23 = u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat0.x = log2(u_xlat16_23);
    u_xlat16_23 = max(u_xlat16_3.x, 0.00100000005);
    u_xlat16_23 = log2(u_xlat16_23);
    u_xlat16_23 = u_xlat16_23 * _FresnelPower;
    u_xlat16_23 = exp2(u_xlat16_23);
    u_xlat16_23 = u_xlat16_23 * _FresnelScale;
    u_xlat16_23 = u_xlat16_23 * _FresnelColor.w;
    u_xlat16_2.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Mask_Use2U));
#else
    u_xlatb7 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Mask_Use2U);
#endif
    u_xlat7.xy = (bool(u_xlatb7)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_7.xyz = texture(_Mask, u_xlat7.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_7.xxx * u_xlat16_2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_1.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat4.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_3.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_2.xyz;
    u_xlat7.x = _Time.y * _Flu_Speed_V;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Flu_UV==1.0);
#else
    u_xlatb1.x = _Flu_UV==1.0;
#endif
    u_xlat8.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat4.xy = (u_xlatb1.x) ? u_xlat8.xy : vs_TEXCOORD1.xy;
    u_xlat6.y = u_xlat4.y * _Flu_LineSpace + u_xlat7.x;
    u_xlat6.x = _Time.y * _Flu_Speed_U + u_xlat4.x;
    u_xlat4.xy = u_xlat6.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_7.x = texture(_Flu_Tex, u_xlat4.xy).x;
    u_xlat1.x = u_xlat16_7.x * 0.305306017 + 0.682171106;
    u_xlat1.x = u_xlat16_7.x * u_xlat1.x + 0.0125228781;
    u_xlat7.x = u_xlat16_7.x * u_xlat1.x;
    u_xlat16_3.x = u_xlat16_7.y * u_xlat7.x;
    u_xlat16_10.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_2.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_4.xyz = texture(_Emissive, u_xlat7.xy).xyz;
    u_xlat6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_4.xyz * u_xlat6.xyz;
    u_xlat16_3.x = u_xlat16_4.x * u_xlat6.x + _MainColor.w;
    u_xlat16_4.xyz = u_xlat11.xyz * vec3(_EmissivePower) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat16_5.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat16_2.x = u_xlat16_7.z + _Mask_B_Alpha;
    u_xlat16_2.x = u_xlat16_7.z * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_1.w * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * vs_COLOR0.w;
    u_xlat16_4.w = u_xlat16_2.x * _Alpha;
    u_xlat16_5 = (-u_xlat16_4) + u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DisUV_Select));
#else
    u_xlatb7 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DisUV_Select);
#endif
    u_xlat7.xy = (bool(u_xlatb7)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlatb1.xw = equal(vec4(_DisUV_Select), vec4(1.0, 0.0, 0.0, 2.0)).xw;
    u_xlat7.xy = (u_xlatb1.w) ? u_xlat8.xy : u_xlat7.xy;
    u_xlat7.xy = (u_xlatb1.x) ? vs_TEXCOORD1.xy : u_xlat7.xy;
    u_xlat1.xy = _Time.yy * _DisNoise_TiSp.zw;
    u_xlat1.xy = u_xlat7.xy * _DisNoise_TiSp.xy + u_xlat1.xy;
    u_xlat16_21 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_21) * vec2(_DisNoise_Intensity) + u_xlat7.xy;
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb1.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat7.x = (u_xlatb1.x) ? u_xlat7.y : u_xlat7.x;
    u_xlat7.x = (-u_xlat16_21) + u_xlat7.x;
    u_xlat7.x = _DisDir_Weight * u_xlat7.x + u_xlat16_21;
    u_xlat7.x = max(u_xlat7.x, 0.00999999978);
    u_xlat7.x = u_xlat7.x + (-_DissolveStep);
    u_xlat16_2.x = max(_SoftSize, 0.00999999978);
    u_xlat16_9.x = max(_DissolveStep, 0.00999999978);
    u_xlat16_2.x = u_xlat16_9.x * u_xlat16_2.x;
    u_xlat7.x = u_xlat7.x / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat16_2.x = (u_xlatb14) ? _IS_CUSTOM : 0.0;
    u_xlat16_1 = u_xlat16_2.xxxx * u_xlat16_5 + u_xlat16_4;
    u_xlat16_2.x = u_xlat7.x * u_xlat16_1.w;
    u_xlat16_2.x = u_xlat16_3.x * u_xlat16_2.x;
    u_xlat16_9.x = u_xlat16_1.w * u_xlat7.x + (-u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_23 * u_xlat16_9.x + u_xlat16_2.x;
    u_xlat16_9.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = log2(u_xlat16_9.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat7.xyz;
    u_xlat7.x = _FresAlpha_Power * 8.0 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresAlpha_Intensity;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_FresAlpha);
#else
    u_xlatb7 = 0.0<_FresAlpha;
#endif
    SV_Target0.w = (u_xlatb7) ? u_xlat0.x : u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _NerverCut;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlatb0 = _NerverCut==1.0;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
    u_xlat4 = u_xlat1.w * u_xlat1.w;
    u_xlat4 = u_xlat4 * 0.999998987;
    gl_Position.z = (u_xlatb0) ? u_xlat4 : u_xlat1.z;
    gl_Position.xyw = u_xlat1.xyw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Normal_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	vec4 _FresnelTex_ST;
uniform 	mediump float _FresTexUse2U;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _Mask_Use2U;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	float _Flu_LineSpace;
uniform 	vec4 _DissolveTex_ST;
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	vec4 _Emissive_ST;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform 	float _FresAlpha;
uniform 	float _FresAlpha_Power;
uniform 	float _FresAlpha_Intensity;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _FresnelTex;
uniform lowp sampler2D _Emissive;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bvec4 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
bool u_xlatb7;
vec2 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
bool u_xlatb14;
float u_xlat21;
lowp float u_xlat10_21;
mediump float u_xlat16_23;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresTexUse2U);
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _FresnelTex_ST.xy + _FresnelTex_ST.zw;
    u_xlat10_0.xyz = texture2D(_FresnelTex, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_0.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_3.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * vs_TEXCOORD2.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_23 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_3.x = (-u_xlat16_23) + 1.0;
    u_xlat16_23 = u_xlat16_23;
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
    u_xlat0.x = log2(u_xlat16_23);
    u_xlat16_23 = max(u_xlat16_3.x, 0.00100000005);
    u_xlat16_23 = log2(u_xlat16_23);
    u_xlat16_23 = u_xlat16_23 * _FresnelPower;
    u_xlat16_23 = exp2(u_xlat16_23);
    u_xlat16_23 = u_xlat16_23 * _FresnelScale;
    u_xlat16_23 = u_xlat16_23 * _FresnelColor.w;
    u_xlat16_2.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz;
    u_xlatb7 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Mask_Use2U);
    u_xlat7.xy = (bool(u_xlatb7)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_7.xyz = texture2D(_Mask, u_xlat7.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_7.xxx * u_xlat16_2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_1.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat4.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_3.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_2.xyz;
    u_xlat7.x = _Time.y * _Flu_Speed_V;
    u_xlatb1.x = _Flu_UV==1.0;
    u_xlat8.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat4.xy = (u_xlatb1.x) ? u_xlat8.xy : vs_TEXCOORD1.xy;
    u_xlat6.y = u_xlat4.y * _Flu_LineSpace + u_xlat7.x;
    u_xlat6.x = _Time.y * _Flu_Speed_U + u_xlat4.x;
    u_xlat4.xy = u_xlat6.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_7.x = texture2D(_Flu_Tex, u_xlat4.xy).x;
    u_xlat1.x = u_xlat10_7.x * 0.305306017 + 0.682171106;
    u_xlat1.x = u_xlat10_7.x * u_xlat1.x + 0.0125228781;
    u_xlat7.x = u_xlat10_7.x * u_xlat1.x;
    u_xlat16_3.x = u_xlat10_7.y * u_xlat7.x;
    u_xlat16_10.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_2.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_4.xyz = texture2D(_Emissive, u_xlat7.xy).xyz;
    u_xlat6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_4.xyz * u_xlat6.xyz;
    u_xlat16_3.x = u_xlat10_4.x * u_xlat6.x + _MainColor.w;
    u_xlat16_4.xyz = u_xlat11.xyz * vec3(_EmissivePower) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat16_5.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat16_2.x = u_xlat10_7.z + _Mask_B_Alpha;
    u_xlat16_2.x = u_xlat10_7.z * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat10_1.w * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * vs_COLOR0.w;
    u_xlat16_4.w = u_xlat16_2.x * _Alpha;
    u_xlat16_5 = (-u_xlat16_4) + u_xlat16_5;
    u_xlatb7 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DisUV_Select);
    u_xlat7.xy = (bool(u_xlatb7)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlatb1.xw = equal(vec4(_DisUV_Select), vec4(1.0, 0.0, 0.0, 2.0)).xw;
    u_xlat7.xy = (u_xlatb1.w) ? u_xlat8.xy : u_xlat7.xy;
    u_xlat7.xy = (u_xlatb1.x) ? vs_TEXCOORD1.xy : u_xlat7.xy;
    u_xlat1.xy = _Time.yy * _DisNoise_TiSp.zw;
    u_xlat1.xy = u_xlat7.xy * _DisNoise_TiSp.xy + u_xlat1.xy;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_21) * vec2(_DisNoise_Intensity) + u_xlat7.xy;
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlatb1.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat7.x = (u_xlatb1.x) ? u_xlat7.y : u_xlat7.x;
    u_xlat7.x = (-u_xlat10_21) + u_xlat7.x;
    u_xlat7.x = _DisDir_Weight * u_xlat7.x + u_xlat10_21;
    u_xlat7.x = max(u_xlat7.x, 0.00999999978);
    u_xlat7.x = u_xlat7.x + (-_DissolveStep);
    u_xlat16_2.x = max(_SoftSize, 0.00999999978);
    u_xlat16_9.x = max(_DissolveStep, 0.00999999978);
    u_xlat16_2.x = u_xlat16_9.x * u_xlat16_2.x;
    u_xlat7.x = u_xlat7.x / u_xlat16_2.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat16_2.x = (u_xlatb14) ? _IS_CUSTOM : 0.0;
    u_xlat16_1 = u_xlat16_2.xxxx * u_xlat16_5 + u_xlat16_4;
    u_xlat16_2.x = u_xlat7.x * u_xlat16_1.w;
    u_xlat16_2.x = u_xlat16_3.x * u_xlat16_2.x;
    u_xlat16_9.x = u_xlat16_1.w * u_xlat7.x + (-u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_23 * u_xlat16_9.x + u_xlat16_2.x;
    u_xlat16_9.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = log2(u_xlat16_9.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat7.xyz;
    u_xlat7.x = _FresAlpha_Power * 8.0 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresAlpha_Intensity;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_FresAlpha;
    SV_Target0.w = (u_xlatb7) ? u_xlat0.x : u_xlat16_2.x;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _NerverCut;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlatb0 = _NerverCut==1.0;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
    u_xlat4 = u_xlat1.w * u_xlat1.w;
    u_xlat4 = u_xlat4 * 0.999998987;
    gl_Position.z = (u_xlatb0) ? u_xlat4 : u_xlat1.z;
    gl_Position.xyw = u_xlat1.xyw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Normal_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	vec4 _FresnelTex_ST;
uniform 	mediump float _FresTexUse2U;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _Mask_Use2U;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	float _Flu_LineSpace;
uniform 	vec4 _DissolveTex_ST;
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	vec4 _Emissive_ST;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform 	float _FresAlpha;
uniform 	float _FresAlpha_Power;
uniform 	float _FresAlpha_Intensity;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _FresnelTex;
uniform lowp sampler2D _Emissive;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bvec4 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
bool u_xlatb7;
vec2 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
bool u_xlatb14;
float u_xlat21;
lowp float u_xlat10_21;
mediump float u_xlat16_23;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresTexUse2U);
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _FresnelTex_ST.xy + _FresnelTex_ST.zw;
    u_xlat10_0.xyz = texture2D(_FresnelTex, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_0.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_3.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * vs_TEXCOORD2.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_23 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_3.x = (-u_xlat16_23) + 1.0;
    u_xlat16_23 = u_xlat16_23;
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
    u_xlat0.x = log2(u_xlat16_23);
    u_xlat16_23 = max(u_xlat16_3.x, 0.00100000005);
    u_xlat16_23 = log2(u_xlat16_23);
    u_xlat16_23 = u_xlat16_23 * _FresnelPower;
    u_xlat16_23 = exp2(u_xlat16_23);
    u_xlat16_23 = u_xlat16_23 * _FresnelScale;
    u_xlat16_23 = u_xlat16_23 * _FresnelColor.w;
    u_xlat16_2.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz;
    u_xlatb7 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Mask_Use2U);
    u_xlat7.xy = (bool(u_xlatb7)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_7.xyz = texture2D(_Mask, u_xlat7.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_7.xxx * u_xlat16_2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_1.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat4.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_3.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_2.xyz;
    u_xlat7.x = _Time.y * _Flu_Speed_V;
    u_xlatb1.x = _Flu_UV==1.0;
    u_xlat8.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat4.xy = (u_xlatb1.x) ? u_xlat8.xy : vs_TEXCOORD1.xy;
    u_xlat6.y = u_xlat4.y * _Flu_LineSpace + u_xlat7.x;
    u_xlat6.x = _Time.y * _Flu_Speed_U + u_xlat4.x;
    u_xlat4.xy = u_xlat6.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_7.x = texture2D(_Flu_Tex, u_xlat4.xy).x;
    u_xlat1.x = u_xlat10_7.x * 0.305306017 + 0.682171106;
    u_xlat1.x = u_xlat10_7.x * u_xlat1.x + 0.0125228781;
    u_xlat7.x = u_xlat10_7.x * u_xlat1.x;
    u_xlat16_3.x = u_xlat10_7.y * u_xlat7.x;
    u_xlat16_10.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_3.xxx;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_2.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_4.xyz = texture2D(_Emissive, u_xlat7.xy).xyz;
    u_xlat6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_4.xyz * u_xlat6.xyz;
    u_xlat16_3.x = u_xlat10_4.x * u_xlat6.x + _MainColor.w;
    u_xlat16_4.xyz = u_xlat11.xyz * vec3(_EmissivePower) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat16_5.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat16_2.x = u_xlat10_7.z + _Mask_B_Alpha;
    u_xlat16_2.x = u_xlat10_7.z * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat10_1.w * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * vs_COLOR0.w;
    u_xlat16_4.w = u_xlat16_2.x * _Alpha;
    u_xlat16_5 = (-u_xlat16_4) + u_xlat16_5;
    u_xlatb7 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DisUV_Select);
    u_xlat7.xy = (bool(u_xlatb7)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlatb1.xw = equal(vec4(_DisUV_Select), vec4(1.0, 0.0, 0.0, 2.0)).xw;
    u_xlat7.xy = (u_xlatb1.w) ? u_xlat8.xy : u_xlat7.xy;
    u_xlat7.xy = (u_xlatb1.x) ? vs_TEXCOORD1.xy : u_xlat7.xy;
    u_xlat1.xy = _Time.yy * _DisNoise_TiSp.zw;
    u_xlat1.xy = u_xlat7.xy * _DisNoise_TiSp.xy + u_xlat1.xy;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_21) * vec2(_DisNoise_Intensity) + u_xlat7.xy;
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlatb1.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat7.x = (u_xlatb1.x) ? u_xlat7.y : u_xlat7.x;
    u_xlat7.x = (-u_xlat10_21) + u_xlat7.x;
    u_xlat7.x = _DisDir_Weight * u_xlat7.x + u_xlat10_21;
    u_xlat7.x = max(u_xlat7.x, 0.00999999978);
    u_xlat7.x = u_xlat7.x + (-_DissolveStep);
    u_xlat16_2.x = max(_SoftSize, 0.00999999978);
    u_xlat16_9.x = max(_DissolveStep, 0.00999999978);
    u_xlat16_2.x = u_xlat16_9.x * u_xlat16_2.x;
    u_xlat7.x = u_xlat7.x / u_xlat16_2.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat16_2.x = (u_xlatb14) ? _IS_CUSTOM : 0.0;
    u_xlat16_1 = u_xlat16_2.xxxx * u_xlat16_5 + u_xlat16_4;
    u_xlat16_2.x = u_xlat7.x * u_xlat16_1.w;
    u_xlat16_2.x = u_xlat16_3.x * u_xlat16_2.x;
    u_xlat16_9.x = u_xlat16_1.w * u_xlat7.x + (-u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_23 * u_xlat16_9.x + u_xlat16_2.x;
    u_xlat16_9.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = log2(u_xlat16_9.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat7.xyz;
    u_xlat7.x = _FresAlpha_Power * 8.0 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresAlpha_Intensity;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_FresAlpha;
    SV_Target0.w = (u_xlatb7) ? u_xlat0.x : u_xlat16_2.x;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
CustomEditor "HeroShowRenderingGUI.VFX.ASEffectShaderGUI"
}