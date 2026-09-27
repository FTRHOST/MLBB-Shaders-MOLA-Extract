//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Shader Forge/meta_juese_HYRZ" {
Properties {

_ColorNormWeight ("顶点色法线权重", Range(0, 1)) = 0.0

_MainTex ("MainTex", 2D) = "white" { }

_MainColor ("MainColor", Color) = (1,1,1,1)

_NormalMap ("NormalMap", 2D) = "bump" { }

_LightOffset ("灯光方向", Vector) = (0,0,1,0)

_MaskTex ("R:Ramp索引 G:扰动纹理 B:补光遮罩", 2D) = "white" { }

_RampTex ("Ramp图", 2D) = "white" { }

_RampOffset ("Ramp左右偏移", Range(0.001, 0.999)) = 0.5

[Toggle] _Noise_Use3U ("扰动纹理使用3U", Float) = 0.0

_Noise_TiSp ("扰动XY:Tiling ZW:Speed", Vector) = (1,1,0,0)

_Noise_Intensity ("扰动强度", Float) = 0.0

[Space(10)] [Header(Sanshe)] [Toggle(_Directional_Sanshe)] _Directional_Sanshe ("补光类型(关闭:边缘光;打开:平行光)", Float) = 0.0

[Toggle] _ViewDirectional ("补光跟随视角(平行光)", Float) = 0.0

_Sanshe_Step ("补光色阶数(整体)", Range(1, 255)) = 255.0

_Sanshe_color ("补光颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe_Fw ("补光范围", Range(0.0001, 10)) = 1.0

_Sanshe_Power ("补光强度", Float) = 0.0

_Sanshe_X ("补光X轴偏移", Range(-1, 1)) = 0.0

_Sanshe_Y ("补光Y轴偏移", Range(-1, 1)) = 0.0

[Header(RongJie)] [Toggle] _Dissovle_Use_2U ("溶解使用2U", Float) = 1.0

[Enum(LeftRight,0,DownUp,1,NoUV,2)] _Dissolve_Dir ("溶解UV方向", Float) = 0.0

_Rongjie_saoguang_liangbian ("R:溶解遮罩 G:溶解纹理 B:溶解拖尾", 2D) = "white" { }

_Rongjie_TiSP ("溶解纹理_Tiling_Speed", Vector) = (1,1,0,0)

_DissolveColor ("拖尾颜色", Color) = (1,1,1,1)

_Rongjie_Fanwei ("边缘压缩", Float) = 4.0

_Rongjie_Color_Fanwei ("拖尾范围", Float) = 1.0

_DissolveColor_Power ("拖尾强度", Float) = 1.0

_ClipAmount ("溶解进度", Range(-2, 1)) = 1.0

[Header(RongJie2)] [Toggle] _Dissovle2_Use_3U ("溶解使用3U", Float) = 1.0

[Enum(LeftRight,0,DownUp,1,NoUV,2)] _Dissolve2_Dir ("溶解UV方向", Float) = 0.0

[Toggle] _ReverseDis2Dir ("翻转溶解方向", Float) = 0.0

_Rongjie2_saoguang_liangbian ("R:溶解遮罩 G:溶解纹理 B:溶解拖尾", 2D) = "white" { }

_Rongjie2_TiSP ("溶解纹理_Tiling_Speed", Vector) = (1,1,0,0)

_Dissolve2Color ("拖尾颜色", Color) = (1,1,1,1)

_Rongjie2_Fanwei ("边缘压缩", Float) = 4.0

_Rongjie2_Color_Fanwei ("拖尾范围", Float) = 1.0

_Dissolve2Color_Power ("拖尾强度", Float) = 1.0

_Clip2Amount ("溶解进度", Range(-2, 1)) = 1.0

[Space(10)] [Header(Outline)] _Outline_Width ("Outline_Width", Float) = 0.019999999552965164

_Outline_Sampler ("Outline_Sampler", 2D) = "white" { }

_Outline_Color ("Outline_Color", Color) = (0.5,0.5,0.5,1)

_Outline_Offset_X ("Outline_Offset_X", Float) = 0.0

_Outline_Offset_Y ("Outline_Offset_Y", Float) = 0.0

_InSideOnline ("InSideOnline", 2D) = "white" { }

_InSideOnline_Width ("InSideOnline_Width", Float) = 0.10000000149011612

[Header(Stencil)] _StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "FORWARD"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
  GpuProgramID 5850
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
uniform 	float _Noise_Use3U;
uniform 	float _Dissovle_Use_2U;
uniform 	float _Dissovle2_Use_3U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec3 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_COLOR0;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD2.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Noise_Use3U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Noise_Use3U);
#endif
    vs_TEXCOORD2.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    vs_COLOR0.xyz = in_COLOR0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.yzx * in_NORMAL0.zxy;
    u_xlat1.xyz = in_NORMAL0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD6.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _ColorNormWeight;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _RampOffset;
uniform 	vec4 _LightOffset;
uniform 	vec4 _Noise_TiSp;
uniform 	float _Noise_Intensity;
uniform 	float _Sanshe_Step;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	float _ReverseDis2Dir;
uniform 	vec4 _Rongjie_TiSP;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Dissolve2_Dir;
uniform 	vec4 _Rongjie2_TiSP;
uniform 	vec4 _Dissolve2Color;
uniform 	float _Dissolve2Color_Power;
uniform 	float _Clip2Amount;
uniform 	float _Rongjie2_Fanwei;
uniform 	float _Rongjie2_Color_Fanwei;
uniform 	vec4 _InSideOnline_ST;
uniform 	float _InSideOnline_Width;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _InSideOnline;
UNITY_LOCATION(4) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(6) uniform mediump sampler2D _Rongjie2_saoguang_liangbian;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_COLOR0;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat8;
bvec3 u_xlatb8;
mediump float u_xlat16_9;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat18;
float u_xlat24;
mediump float u_xlat16_24;
float u_xlat25;
void main()
{
    u_xlat0.xy = _Time.yy * _Rongjie_TiSP.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_TiSP.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlatb8.xyz = equal(vec4(_Dissolve_Dir, _Dissolve_Dir, _ReverseDis2Dir, _ReverseDis2Dir), vec4(0.0, 1.0, 1.0, 1.0)).xyz;
    u_xlat8 = (u_xlatb8.x) ? vs_TEXCOORD1.x : 1.0;
    u_xlat8 = (u_xlatb8.y) ? vs_TEXCOORD1.y : u_xlat8;
    u_xlat8 = u_xlat8 + _ClipAmount;
    u_xlat8 = dot(vec2(u_xlat8), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat8 = u_xlat8 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat8;
    u_xlat8 = u_xlat0.x + -1.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = texture(_Rongjie_saoguang_liangbian, vs_TEXCOORD1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=0.100000001);
#else
    u_xlatb0 = u_xlat0.x>=0.100000001;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat8 = u_xlat0.x * u_xlat8 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8.x = !!(u_xlat8<0.0);
#else
    u_xlatb8.x = u_xlat8<0.0;
#endif
    if(u_xlatb8.x){discard;}
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat8 = (u_xlatb8.x) ? vs_TEXCOORD1.z : 1.0;
    u_xlat8 = (u_xlatb8.y) ? vs_TEXCOORD1.w : u_xlat8;
    u_xlat16.x = (-u_xlat8) + 1.0;
    u_xlat8 = (u_xlatb8.z) ? u_xlat16.x : u_xlat8;
    u_xlat8 = u_xlat8 + _Clip2Amount;
    u_xlat8 = dot(vec2(u_xlat8), vec2(vec2(_Rongjie2_Fanwei, _Rongjie2_Fanwei)));
    u_xlat8 = u_xlat8 + (-_Rongjie2_Fanwei);
    u_xlat16.xy = _Time.yy * _Rongjie2_TiSP.zw;
    u_xlat16.xy = vs_TEXCOORD1.zw * _Rongjie2_TiSP.xy + u_xlat16.xy;
    u_xlat16_16 = texture(_Rongjie2_saoguang_liangbian, u_xlat16.xy).y;
    u_xlat8 = u_xlat16_16 + u_xlat8;
    u_xlat16.x = u_xlat8 + -1.0;
    u_xlat8 = dot(vec2(u_xlat8), vec2(vec2(_Rongjie2_Color_Fanwei, _Rongjie2_Color_Fanwei)));
    u_xlat8 = u_xlat8 + (-_Rongjie2_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat17.x = (-u_xlat8) + 1.0;
    u_xlat8 = texture(_Rongjie2_saoguang_liangbian, vs_TEXCOORD1.zw).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8.x = !!(u_xlat8>=0.100000001);
#else
    u_xlatb8.x = u_xlat8>=0.100000001;
#endif
    u_xlat8 = u_xlatb8.x ? 1.0 : float(0.0);
    u_xlat16.x = u_xlat8 * u_xlat16.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16.x<0.0);
#else
    u_xlatb16 = u_xlat16.x<0.0;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = _Dissolve2Color.w * _Dissolve2Color.x;
    u_xlat16.x = u_xlat16.x * _Dissolve2Color_Power;
    u_xlat16.x = u_xlat17.x * u_xlat16.x;
    u_xlat1.y = float(0.0);
    u_xlat17.y = float(0.0);
    u_xlat16_24 = texture(_Rongjie2_saoguang_liangbian, u_xlat17.xy).z;
    u_xlat16_9 = texture(_Rongjie_saoguang_liangbian, u_xlat1.xy).z;
    u_xlat16.x = u_xlat16_24 * u_xlat16.x;
    u_xlat8 = u_xlat8 * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16.x = _DissolveColor.w * _DissolveColor.x;
    u_xlat16.x = u_xlat16.x * _DissolveColor_Power;
    u_xlat16.x = u_xlat1.x * u_xlat16.x;
    u_xlat16.x = u_xlat16_9 * u_xlat16.x;
    u_xlat0.x = u_xlat0.x * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat1.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat2.yyy * vs_TEXCOORD6.xyz;
    u_xlat2.xyw = u_xlat2.xxx * vs_TEXCOORD5.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.zzz * u_xlat1.xyz + u_xlat2.xyw;
    u_xlat16.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz;
    u_xlat16.x = dot(_LightOffset.xyz, _LightOffset.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat3.xyz = u_xlat16.xxx * _LightOffset.xyz;
    u_xlat16.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_NormalMap, u_xlat2.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = u_xlat16_5.yyy * vs_TEXCOORD6.xyz;
    u_xlat4.xyz = u_xlat16_5.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat16_5.zzz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat16.x = (-u_xlat24) + u_xlat16.x;
    u_xlat16.x = _ColorNormWeight * u_xlat16.x + u_xlat24;
    u_xlat16.x = u_xlat16.x * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat18.xy = _Time.yy * _Noise_TiSp.zw;
    u_xlat18.xy = vs_TEXCOORD2.xy * _Noise_TiSp.xy + u_xlat18.xy;
    u_xlat16_24 = texture(_MaskTex, u_xlat18.xy).y;
    u_xlat16.x = (-u_xlat16_24) * _Noise_Intensity + u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat16.x + (-_RampOffset);
    u_xlat25 = (-_RampOffset) + 1.0;
    u_xlat24 = u_xlat24 / u_xlat25;
    u_xlat24 = u_xlat24 * 0.5 + 0.5;
    u_xlat25 = u_xlat16.x / _RampOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_RampOffset>=u_xlat16.x);
#else
    u_xlatb16 = _RampOffset>=u_xlat16.x;
#endif
    u_xlat25 = u_xlat25 * 0.5;
    u_xlat3.x = (u_xlatb16) ? u_xlat25 : u_xlat24;
    u_xlat3.yz = texture(_MaskTex, u_xlat2.xy).xz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat4.xyz = u_xlat3.zzz * _Sanshe_color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Sanshe_Power, _Sanshe_Power, _Sanshe_Power));
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat7.z = u_xlat16.x * u_xlat6.z;
    u_xlat7.xy = u_xlat6.xy * u_xlat16.xx + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat16.x = dot(u_xlat1.xyz, u_xlat7.xyz);
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = log2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * _Sanshe_Fw;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * _Sanshe_Step;
    u_xlat16.x = roundEven(u_xlat16.x);
    u_xlat1.xyz = u_xlat16.xxx * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat1.xyz / vec3(vec3(_Sanshe_Step, _Sanshe_Step, _Sanshe_Step));
    u_xlat16.xy = vs_TEXCOORD0.zw * _InSideOnline_ST.xy + _InSideOnline_ST.zw;
    u_xlat16_4.xyz = texture(_InSideOnline, u_xlat16.xy).xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + (-u_xlat16_2.xyz);
    u_xlat2.xyz = vec3(_InSideOnline_Width) * u_xlat4.xyz + u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainColor.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.xyz + u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _DissolveColor.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + _Dissolve2Color.xyz;
    u_xlat0.xyz = vec3(u_xlat8) * u_xlat1.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	float _Noise_Use3U;
uniform 	float _Dissovle_Use_2U;
uniform 	float _Dissovle2_Use_3U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec3 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_COLOR0;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD2.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Noise_Use3U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Noise_Use3U);
#endif
    vs_TEXCOORD2.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    vs_COLOR0.xyz = in_COLOR0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.yzx * in_NORMAL0.zxy;
    u_xlat1.xyz = in_NORMAL0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD6.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _ColorNormWeight;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _RampOffset;
uniform 	vec4 _LightOffset;
uniform 	vec4 _Noise_TiSp;
uniform 	float _Noise_Intensity;
uniform 	float _Sanshe_Step;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	float _ReverseDis2Dir;
uniform 	vec4 _Rongjie_TiSP;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Dissolve2_Dir;
uniform 	vec4 _Rongjie2_TiSP;
uniform 	vec4 _Dissolve2Color;
uniform 	float _Dissolve2Color_Power;
uniform 	float _Clip2Amount;
uniform 	float _Rongjie2_Fanwei;
uniform 	float _Rongjie2_Color_Fanwei;
uniform 	vec4 _InSideOnline_ST;
uniform 	float _InSideOnline_Width;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _InSideOnline;
UNITY_LOCATION(4) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(6) uniform mediump sampler2D _Rongjie2_saoguang_liangbian;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_COLOR0;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat8;
bvec3 u_xlatb8;
mediump float u_xlat16_9;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat18;
float u_xlat24;
mediump float u_xlat16_24;
float u_xlat25;
void main()
{
    u_xlat0.xy = _Time.yy * _Rongjie_TiSP.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_TiSP.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlatb8.xyz = equal(vec4(_Dissolve_Dir, _Dissolve_Dir, _ReverseDis2Dir, _ReverseDis2Dir), vec4(0.0, 1.0, 1.0, 1.0)).xyz;
    u_xlat8 = (u_xlatb8.x) ? vs_TEXCOORD1.x : 1.0;
    u_xlat8 = (u_xlatb8.y) ? vs_TEXCOORD1.y : u_xlat8;
    u_xlat8 = u_xlat8 + _ClipAmount;
    u_xlat8 = dot(vec2(u_xlat8), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat8 = u_xlat8 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat8;
    u_xlat8 = u_xlat0.x + -1.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = texture(_Rongjie_saoguang_liangbian, vs_TEXCOORD1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=0.100000001);
#else
    u_xlatb0 = u_xlat0.x>=0.100000001;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat8 = u_xlat0.x * u_xlat8 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8.x = !!(u_xlat8<0.0);
#else
    u_xlatb8.x = u_xlat8<0.0;
#endif
    if(u_xlatb8.x){discard;}
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat8 = (u_xlatb8.x) ? vs_TEXCOORD1.z : 1.0;
    u_xlat8 = (u_xlatb8.y) ? vs_TEXCOORD1.w : u_xlat8;
    u_xlat16.x = (-u_xlat8) + 1.0;
    u_xlat8 = (u_xlatb8.z) ? u_xlat16.x : u_xlat8;
    u_xlat8 = u_xlat8 + _Clip2Amount;
    u_xlat8 = dot(vec2(u_xlat8), vec2(vec2(_Rongjie2_Fanwei, _Rongjie2_Fanwei)));
    u_xlat8 = u_xlat8 + (-_Rongjie2_Fanwei);
    u_xlat16.xy = _Time.yy * _Rongjie2_TiSP.zw;
    u_xlat16.xy = vs_TEXCOORD1.zw * _Rongjie2_TiSP.xy + u_xlat16.xy;
    u_xlat16_16 = texture(_Rongjie2_saoguang_liangbian, u_xlat16.xy).y;
    u_xlat8 = u_xlat16_16 + u_xlat8;
    u_xlat16.x = u_xlat8 + -1.0;
    u_xlat8 = dot(vec2(u_xlat8), vec2(vec2(_Rongjie2_Color_Fanwei, _Rongjie2_Color_Fanwei)));
    u_xlat8 = u_xlat8 + (-_Rongjie2_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat17.x = (-u_xlat8) + 1.0;
    u_xlat8 = texture(_Rongjie2_saoguang_liangbian, vs_TEXCOORD1.zw).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8.x = !!(u_xlat8>=0.100000001);
#else
    u_xlatb8.x = u_xlat8>=0.100000001;
#endif
    u_xlat8 = u_xlatb8.x ? 1.0 : float(0.0);
    u_xlat16.x = u_xlat8 * u_xlat16.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16.x<0.0);
#else
    u_xlatb16 = u_xlat16.x<0.0;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = _Dissolve2Color.w * _Dissolve2Color.x;
    u_xlat16.x = u_xlat16.x * _Dissolve2Color_Power;
    u_xlat16.x = u_xlat17.x * u_xlat16.x;
    u_xlat1.y = float(0.0);
    u_xlat17.y = float(0.0);
    u_xlat16_24 = texture(_Rongjie2_saoguang_liangbian, u_xlat17.xy).z;
    u_xlat16_9 = texture(_Rongjie_saoguang_liangbian, u_xlat1.xy).z;
    u_xlat16.x = u_xlat16_24 * u_xlat16.x;
    u_xlat8 = u_xlat8 * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16.x = _DissolveColor.w * _DissolveColor.x;
    u_xlat16.x = u_xlat16.x * _DissolveColor_Power;
    u_xlat16.x = u_xlat1.x * u_xlat16.x;
    u_xlat16.x = u_xlat16_9 * u_xlat16.x;
    u_xlat0.x = u_xlat0.x * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat1.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat2.yyy * vs_TEXCOORD6.xyz;
    u_xlat2.xyw = u_xlat2.xxx * vs_TEXCOORD5.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.zzz * u_xlat1.xyz + u_xlat2.xyw;
    u_xlat16.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz;
    u_xlat16.x = dot(_LightOffset.xyz, _LightOffset.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat3.xyz = u_xlat16.xxx * _LightOffset.xyz;
    u_xlat16.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_NormalMap, u_xlat2.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = u_xlat16_5.yyy * vs_TEXCOORD6.xyz;
    u_xlat4.xyz = u_xlat16_5.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat16_5.zzz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat16.x = (-u_xlat24) + u_xlat16.x;
    u_xlat16.x = _ColorNormWeight * u_xlat16.x + u_xlat24;
    u_xlat16.x = u_xlat16.x * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat18.xy = _Time.yy * _Noise_TiSp.zw;
    u_xlat18.xy = vs_TEXCOORD2.xy * _Noise_TiSp.xy + u_xlat18.xy;
    u_xlat16_24 = texture(_MaskTex, u_xlat18.xy).y;
    u_xlat16.x = (-u_xlat16_24) * _Noise_Intensity + u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat16.x + (-_RampOffset);
    u_xlat25 = (-_RampOffset) + 1.0;
    u_xlat24 = u_xlat24 / u_xlat25;
    u_xlat24 = u_xlat24 * 0.5 + 0.5;
    u_xlat25 = u_xlat16.x / _RampOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_RampOffset>=u_xlat16.x);
#else
    u_xlatb16 = _RampOffset>=u_xlat16.x;
#endif
    u_xlat25 = u_xlat25 * 0.5;
    u_xlat3.x = (u_xlatb16) ? u_xlat25 : u_xlat24;
    u_xlat3.yz = texture(_MaskTex, u_xlat2.xy).xz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat4.xyz = u_xlat3.zzz * _Sanshe_color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Sanshe_Power, _Sanshe_Power, _Sanshe_Power));
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat7.z = u_xlat16.x * u_xlat6.z;
    u_xlat7.xy = u_xlat6.xy * u_xlat16.xx + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat16.x = dot(u_xlat1.xyz, u_xlat7.xyz);
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = log2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * _Sanshe_Fw;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * _Sanshe_Step;
    u_xlat16.x = roundEven(u_xlat16.x);
    u_xlat1.xyz = u_xlat16.xxx * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat1.xyz / vec3(vec3(_Sanshe_Step, _Sanshe_Step, _Sanshe_Step));
    u_xlat16.xy = vs_TEXCOORD0.zw * _InSideOnline_ST.xy + _InSideOnline_ST.zw;
    u_xlat16_4.xyz = texture(_InSideOnline, u_xlat16.xy).xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + (-u_xlat16_2.xyz);
    u_xlat2.xyz = vec3(_InSideOnline_Width) * u_xlat4.xyz + u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainColor.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.xyz + u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _DissolveColor.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + _Dissolve2Color.xyz;
    u_xlat0.xyz = vec3(u_xlat8) * u_xlat1.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	float _Noise_Use3U;
uniform 	float _Dissovle_Use_2U;
uniform 	float _Dissovle2_Use_3U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD2.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Noise_Use3U);
    vs_TEXCOORD2.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    vs_COLOR0.xyz = in_COLOR0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.yzx * in_NORMAL0.zxy;
    u_xlat1.xyz = in_NORMAL0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD6.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _ColorNormWeight;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _RampOffset;
uniform 	vec4 _LightOffset;
uniform 	vec4 _Noise_TiSp;
uniform 	float _Noise_Intensity;
uniform 	float _Sanshe_Step;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	float _ReverseDis2Dir;
uniform 	vec4 _Rongjie_TiSP;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Dissolve2_Dir;
uniform 	vec4 _Rongjie2_TiSP;
uniform 	vec4 _Dissolve2Color;
uniform 	float _Dissolve2Color_Power;
uniform 	float _Clip2Amount;
uniform 	float _Rongjie2_Fanwei;
uniform 	float _Rongjie2_Color_Fanwei;
uniform 	vec4 _InSideOnline_ST;
uniform 	float _InSideOnline_Width;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _InSideOnline;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp sampler2D _Rongjie2_saoguang_liangbian;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat8;
bvec3 u_xlatb8;
lowp float u_xlat10_9;
vec2 u_xlat16;
lowp float u_xlat10_16;
bool u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat18;
float u_xlat24;
lowp float u_xlat10_24;
float u_xlat25;
float unity_roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 unity_roundEven(vec2 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); return a; }
vec3 unity_roundEven(vec3 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); return a; }
vec4 unity_roundEven(vec4 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); a.w = unity_roundEven(a.w); return a; }

void main()
{
    u_xlat0.xy = _Time.yy * _Rongjie_TiSP.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_TiSP.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlatb8.xyz = equal(vec4(_Dissolve_Dir, _Dissolve_Dir, _ReverseDis2Dir, _ReverseDis2Dir), vec4(0.0, 1.0, 1.0, 1.0)).xyz;
    u_xlat8 = (u_xlatb8.x) ? vs_TEXCOORD1.x : 1.0;
    u_xlat8 = (u_xlatb8.y) ? vs_TEXCOORD1.y : u_xlat8;
    u_xlat8 = u_xlat8 + _ClipAmount;
    u_xlat8 = dot(vec2(u_xlat8), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat8 = u_xlat8 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat8;
    u_xlat8 = u_xlat0.x + -1.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = texture2D(_Rongjie_saoguang_liangbian, vs_TEXCOORD1.xy).x;
    u_xlatb0 = u_xlat0.x>=0.100000001;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat8 = u_xlat0.x * u_xlat8 + 0.5;
    u_xlatb8.x = u_xlat8<0.0;
    if(u_xlatb8.x){discard;}
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat8 = (u_xlatb8.x) ? vs_TEXCOORD1.z : 1.0;
    u_xlat8 = (u_xlatb8.y) ? vs_TEXCOORD1.w : u_xlat8;
    u_xlat16.x = (-u_xlat8) + 1.0;
    u_xlat8 = (u_xlatb8.z) ? u_xlat16.x : u_xlat8;
    u_xlat8 = u_xlat8 + _Clip2Amount;
    u_xlat8 = dot(vec2(u_xlat8), vec2(vec2(_Rongjie2_Fanwei, _Rongjie2_Fanwei)));
    u_xlat8 = u_xlat8 + (-_Rongjie2_Fanwei);
    u_xlat16.xy = _Time.yy * _Rongjie2_TiSP.zw;
    u_xlat16.xy = vs_TEXCOORD1.zw * _Rongjie2_TiSP.xy + u_xlat16.xy;
    u_xlat10_16 = texture2D(_Rongjie2_saoguang_liangbian, u_xlat16.xy).y;
    u_xlat8 = u_xlat10_16 + u_xlat8;
    u_xlat16.x = u_xlat8 + -1.0;
    u_xlat8 = dot(vec2(u_xlat8), vec2(vec2(_Rongjie2_Color_Fanwei, _Rongjie2_Color_Fanwei)));
    u_xlat8 = u_xlat8 + (-_Rongjie2_Color_Fanwei);
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat17.x = (-u_xlat8) + 1.0;
    u_xlat8 = texture2D(_Rongjie2_saoguang_liangbian, vs_TEXCOORD1.zw).x;
    u_xlatb8.x = u_xlat8>=0.100000001;
    u_xlat8 = u_xlatb8.x ? 1.0 : float(0.0);
    u_xlat16.x = u_xlat8 * u_xlat16.x + 0.5;
    u_xlatb16 = u_xlat16.x<0.0;
    if(u_xlatb16){discard;}
    u_xlat16.x = _Dissolve2Color.w * _Dissolve2Color.x;
    u_xlat16.x = u_xlat16.x * _Dissolve2Color_Power;
    u_xlat16.x = u_xlat17.x * u_xlat16.x;
    u_xlat1.y = float(0.0);
    u_xlat17.y = float(0.0);
    u_xlat10_24 = texture2D(_Rongjie2_saoguang_liangbian, u_xlat17.xy).z;
    u_xlat10_9 = texture2D(_Rongjie_saoguang_liangbian, u_xlat1.xy).z;
    u_xlat16.x = u_xlat10_24 * u_xlat16.x;
    u_xlat8 = u_xlat8 * u_xlat16.x;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat16.x = _DissolveColor.w * _DissolveColor.x;
    u_xlat16.x = u_xlat16.x * _DissolveColor_Power;
    u_xlat16.x = u_xlat1.x * u_xlat16.x;
    u_xlat16.x = u_xlat10_9 * u_xlat16.x;
    u_xlat0.x = u_xlat0.x * u_xlat16.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat1.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat2.yyy * vs_TEXCOORD6.xyz;
    u_xlat2.xyw = u_xlat2.xxx * vs_TEXCOORD5.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.zzz * u_xlat1.xyz + u_xlat2.xyw;
    u_xlat16.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz;
    u_xlat16.x = dot(_LightOffset.xyz, _LightOffset.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat3.xyz = u_xlat16.xxx * _LightOffset.xyz;
    u_xlat16.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_4.xyz = texture2D(_NormalMap, u_xlat2.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = u_xlat16_5.yyy * vs_TEXCOORD6.xyz;
    u_xlat4.xyz = u_xlat16_5.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat16_5.zzz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat16.x = (-u_xlat24) + u_xlat16.x;
    u_xlat16.x = _ColorNormWeight * u_xlat16.x + u_xlat24;
    u_xlat16.x = u_xlat16.x * 0.5 + 0.5;
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlat18.xy = _Time.yy * _Noise_TiSp.zw;
    u_xlat18.xy = vs_TEXCOORD2.xy * _Noise_TiSp.xy + u_xlat18.xy;
    u_xlat10_24 = texture2D(_MaskTex, u_xlat18.xy).y;
    u_xlat16.x = (-u_xlat10_24) * _Noise_Intensity + u_xlat16.x;
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlat24 = u_xlat16.x + (-_RampOffset);
    u_xlat25 = (-_RampOffset) + 1.0;
    u_xlat24 = u_xlat24 / u_xlat25;
    u_xlat24 = u_xlat24 * 0.5 + 0.5;
    u_xlat25 = u_xlat16.x / _RampOffset;
    u_xlatb16 = _RampOffset>=u_xlat16.x;
    u_xlat25 = u_xlat25 * 0.5;
    u_xlat3.x = (u_xlatb16) ? u_xlat25 : u_xlat24;
    u_xlat3.yz = texture2D(_MaskTex, u_xlat2.xy).xz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
    u_xlat4.xyz = u_xlat3.zzz * _Sanshe_color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Sanshe_Power, _Sanshe_Power, _Sanshe_Power));
    u_xlat10_3.xyz = texture2D(_RampTex, u_xlat3.xy).xyz;
    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat7.z = u_xlat16.x * u_xlat6.z;
    u_xlat7.xy = u_xlat6.xy * u_xlat16.xx + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat16.x = dot(u_xlat1.xyz, u_xlat7.xyz);
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = log2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * _Sanshe_Fw;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * _Sanshe_Step;
    u_xlat16.x = unity_roundEven(u_xlat16.x);
    u_xlat1.xyz = u_xlat16.xxx * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat1.xyz / vec3(vec3(_Sanshe_Step, _Sanshe_Step, _Sanshe_Step));
    u_xlat16.xy = vs_TEXCOORD0.zw * _InSideOnline_ST.xy + _InSideOnline_ST.zw;
    u_xlat10_4.xyz = texture2D(_InSideOnline, u_xlat16.xy).xyz;
    u_xlat4.xyz = u_xlat10_2.xyz * u_xlat10_4.xyz + (-u_xlat10_2.xyz);
    u_xlat2.xyz = vec3(_InSideOnline_Width) * u_xlat4.xyz + u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainColor.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_3.xyz + u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _DissolveColor.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + _Dissolve2Color.xyz;
    u_xlat0.xyz = vec3(u_xlat8) * u_xlat1.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	float _Noise_Use3U;
uniform 	float _Dissovle_Use_2U;
uniform 	float _Dissovle2_Use_3U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD2.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Noise_Use3U);
    vs_TEXCOORD2.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    vs_COLOR0.xyz = in_COLOR0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.yzx * in_NORMAL0.zxy;
    u_xlat1.xyz = in_NORMAL0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD6.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _ColorNormWeight;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _RampOffset;
uniform 	vec4 _LightOffset;
uniform 	vec4 _Noise_TiSp;
uniform 	float _Noise_Intensity;
uniform 	float _Sanshe_Step;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	float _ReverseDis2Dir;
uniform 	vec4 _Rongjie_TiSP;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Dissolve2_Dir;
uniform 	vec4 _Rongjie2_TiSP;
uniform 	vec4 _Dissolve2Color;
uniform 	float _Dissolve2Color_Power;
uniform 	float _Clip2Amount;
uniform 	float _Rongjie2_Fanwei;
uniform 	float _Rongjie2_Color_Fanwei;
uniform 	vec4 _InSideOnline_ST;
uniform 	float _InSideOnline_Width;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _InSideOnline;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp sampler2D _Rongjie2_saoguang_liangbian;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat8;
bvec3 u_xlatb8;
lowp float u_xlat10_9;
vec2 u_xlat16;
lowp float u_xlat10_16;
bool u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat18;
float u_xlat24;
lowp float u_xlat10_24;
float u_xlat25;
float unity_roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 unity_roundEven(vec2 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); return a; }
vec3 unity_roundEven(vec3 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); return a; }
vec4 unity_roundEven(vec4 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); a.w = unity_roundEven(a.w); return a; }

void main()
{
    u_xlat0.xy = _Time.yy * _Rongjie_TiSP.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_TiSP.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlatb8.xyz = equal(vec4(_Dissolve_Dir, _Dissolve_Dir, _ReverseDis2Dir, _ReverseDis2Dir), vec4(0.0, 1.0, 1.0, 1.0)).xyz;
    u_xlat8 = (u_xlatb8.x) ? vs_TEXCOORD1.x : 1.0;
    u_xlat8 = (u_xlatb8.y) ? vs_TEXCOORD1.y : u_xlat8;
    u_xlat8 = u_xlat8 + _ClipAmount;
    u_xlat8 = dot(vec2(u_xlat8), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat8 = u_xlat8 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat8;
    u_xlat8 = u_xlat0.x + -1.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = texture2D(_Rongjie_saoguang_liangbian, vs_TEXCOORD1.xy).x;
    u_xlatb0 = u_xlat0.x>=0.100000001;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat8 = u_xlat0.x * u_xlat8 + 0.5;
    u_xlatb8.x = u_xlat8<0.0;
    if(u_xlatb8.x){discard;}
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat8 = (u_xlatb8.x) ? vs_TEXCOORD1.z : 1.0;
    u_xlat8 = (u_xlatb8.y) ? vs_TEXCOORD1.w : u_xlat8;
    u_xlat16.x = (-u_xlat8) + 1.0;
    u_xlat8 = (u_xlatb8.z) ? u_xlat16.x : u_xlat8;
    u_xlat8 = u_xlat8 + _Clip2Amount;
    u_xlat8 = dot(vec2(u_xlat8), vec2(vec2(_Rongjie2_Fanwei, _Rongjie2_Fanwei)));
    u_xlat8 = u_xlat8 + (-_Rongjie2_Fanwei);
    u_xlat16.xy = _Time.yy * _Rongjie2_TiSP.zw;
    u_xlat16.xy = vs_TEXCOORD1.zw * _Rongjie2_TiSP.xy + u_xlat16.xy;
    u_xlat10_16 = texture2D(_Rongjie2_saoguang_liangbian, u_xlat16.xy).y;
    u_xlat8 = u_xlat10_16 + u_xlat8;
    u_xlat16.x = u_xlat8 + -1.0;
    u_xlat8 = dot(vec2(u_xlat8), vec2(vec2(_Rongjie2_Color_Fanwei, _Rongjie2_Color_Fanwei)));
    u_xlat8 = u_xlat8 + (-_Rongjie2_Color_Fanwei);
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat17.x = (-u_xlat8) + 1.0;
    u_xlat8 = texture2D(_Rongjie2_saoguang_liangbian, vs_TEXCOORD1.zw).x;
    u_xlatb8.x = u_xlat8>=0.100000001;
    u_xlat8 = u_xlatb8.x ? 1.0 : float(0.0);
    u_xlat16.x = u_xlat8 * u_xlat16.x + 0.5;
    u_xlatb16 = u_xlat16.x<0.0;
    if(u_xlatb16){discard;}
    u_xlat16.x = _Dissolve2Color.w * _Dissolve2Color.x;
    u_xlat16.x = u_xlat16.x * _Dissolve2Color_Power;
    u_xlat16.x = u_xlat17.x * u_xlat16.x;
    u_xlat1.y = float(0.0);
    u_xlat17.y = float(0.0);
    u_xlat10_24 = texture2D(_Rongjie2_saoguang_liangbian, u_xlat17.xy).z;
    u_xlat10_9 = texture2D(_Rongjie_saoguang_liangbian, u_xlat1.xy).z;
    u_xlat16.x = u_xlat10_24 * u_xlat16.x;
    u_xlat8 = u_xlat8 * u_xlat16.x;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat16.x = _DissolveColor.w * _DissolveColor.x;
    u_xlat16.x = u_xlat16.x * _DissolveColor_Power;
    u_xlat16.x = u_xlat1.x * u_xlat16.x;
    u_xlat16.x = u_xlat10_9 * u_xlat16.x;
    u_xlat0.x = u_xlat0.x * u_xlat16.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat1.xyz = u_xlat16.xxx * vs_TEXCOORD4.xyz;
    u_xlat2.xyz = vs_COLOR0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat2.yyy * vs_TEXCOORD6.xyz;
    u_xlat2.xyw = u_xlat2.xxx * vs_TEXCOORD5.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.zzz * u_xlat1.xyz + u_xlat2.xyw;
    u_xlat16.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz;
    u_xlat16.x = dot(_LightOffset.xyz, _LightOffset.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat3.xyz = u_xlat16.xxx * _LightOffset.xyz;
    u_xlat16.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_4.xyz = texture2D(_NormalMap, u_xlat2.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = u_xlat16_5.yyy * vs_TEXCOORD6.xyz;
    u_xlat4.xyz = u_xlat16_5.xxx * vs_TEXCOORD5.xyz + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat16_5.zzz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat3.xyz);
    u_xlat16.x = (-u_xlat24) + u_xlat16.x;
    u_xlat16.x = _ColorNormWeight * u_xlat16.x + u_xlat24;
    u_xlat16.x = u_xlat16.x * 0.5 + 0.5;
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlat18.xy = _Time.yy * _Noise_TiSp.zw;
    u_xlat18.xy = vs_TEXCOORD2.xy * _Noise_TiSp.xy + u_xlat18.xy;
    u_xlat10_24 = texture2D(_MaskTex, u_xlat18.xy).y;
    u_xlat16.x = (-u_xlat10_24) * _Noise_Intensity + u_xlat16.x;
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlat24 = u_xlat16.x + (-_RampOffset);
    u_xlat25 = (-_RampOffset) + 1.0;
    u_xlat24 = u_xlat24 / u_xlat25;
    u_xlat24 = u_xlat24 * 0.5 + 0.5;
    u_xlat25 = u_xlat16.x / _RampOffset;
    u_xlatb16 = _RampOffset>=u_xlat16.x;
    u_xlat25 = u_xlat25 * 0.5;
    u_xlat3.x = (u_xlatb16) ? u_xlat25 : u_xlat24;
    u_xlat3.yz = texture2D(_MaskTex, u_xlat2.xy).xz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
    u_xlat4.xyz = u_xlat3.zzz * _Sanshe_color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Sanshe_Power, _Sanshe_Power, _Sanshe_Power));
    u_xlat10_3.xyz = texture2D(_RampTex, u_xlat3.xy).xyz;
    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat7.z = u_xlat16.x * u_xlat6.z;
    u_xlat7.xy = u_xlat6.xy * u_xlat16.xx + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat16.x = dot(u_xlat1.xyz, u_xlat7.xyz);
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = log2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * _Sanshe_Fw;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * _Sanshe_Step;
    u_xlat16.x = unity_roundEven(u_xlat16.x);
    u_xlat1.xyz = u_xlat16.xxx * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat1.xyz / vec3(vec3(_Sanshe_Step, _Sanshe_Step, _Sanshe_Step));
    u_xlat16.xy = vs_TEXCOORD0.zw * _InSideOnline_ST.xy + _InSideOnline_ST.zw;
    u_xlat10_4.xyz = texture2D(_InSideOnline, u_xlat16.xy).xyz;
    u_xlat4.xyz = u_xlat10_2.xyz * u_xlat10_4.xyz + (-u_xlat10_2.xyz);
    u_xlat2.xyz = vec3(_InSideOnline_Width) * u_xlat4.xyz + u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainColor.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_3.xyz + u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _DissolveColor.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + _Dissolve2Color.xyz;
    u_xlat0.xyz = vec3(u_xlat8) * u_xlat1.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" }
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
uniform 	float _Noise_Use3U;
uniform 	float _Dissovle_Use_2U;
uniform 	float _Dissovle2_Use_3U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec3 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_COLOR0;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD2.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Noise_Use3U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Noise_Use3U);
#endif
    vs_TEXCOORD2.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    vs_COLOR0.xyz = in_COLOR0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.yzx * in_NORMAL0.zxy;
    u_xlat1.xyz = in_NORMAL0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD6.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _ColorNormWeight;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _RampOffset;
uniform 	vec4 _LightOffset;
uniform 	vec4 _Noise_TiSp;
uniform 	float _Noise_Intensity;
uniform 	float _ViewDirectional;
uniform 	float _Sanshe_Step;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	float _ReverseDis2Dir;
uniform 	vec4 _Rongjie_TiSP;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Dissolve2_Dir;
uniform 	vec4 _Rongjie2_TiSP;
uniform 	vec4 _Dissolve2Color;
uniform 	float _Dissolve2Color_Power;
uniform 	float _Clip2Amount;
uniform 	float _Rongjie2_Fanwei;
uniform 	float _Rongjie2_Color_Fanwei;
uniform 	vec4 _InSideOnline_ST;
uniform 	float _InSideOnline_Width;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _InSideOnline;
UNITY_LOCATION(4) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(6) uniform mediump sampler2D _Rongjie2_saoguang_liangbian;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_COLOR0;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
float u_xlat9;
bvec3 u_xlatb9;
mediump float u_xlat16_10;
vec2 u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
vec2 u_xlat19;
float u_xlat27;
mediump float u_xlat16_27;
float u_xlat28;
bool u_xlatb28;
void main()
{
    u_xlat0.xy = _Time.yy * _Rongjie_TiSP.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_TiSP.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlatb9.xyz = equal(vec4(_Dissolve_Dir, _Dissolve_Dir, _ReverseDis2Dir, _ReverseDis2Dir), vec4(0.0, 1.0, 1.0, 1.0)).xyz;
    u_xlat9 = (u_xlatb9.x) ? vs_TEXCOORD1.x : 1.0;
    u_xlat9 = (u_xlatb9.y) ? vs_TEXCOORD1.y : u_xlat9;
    u_xlat9 = u_xlat9 + _ClipAmount;
    u_xlat9 = dot(vec2(u_xlat9), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat9 = u_xlat9 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat9;
    u_xlat9 = u_xlat0.x + -1.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = texture(_Rongjie_saoguang_liangbian, vs_TEXCOORD1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=0.100000001);
#else
    u_xlatb0 = u_xlat0.x>=0.100000001;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat9 = u_xlat0.x * u_xlat9 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9.x = !!(u_xlat9<0.0);
#else
    u_xlatb9.x = u_xlat9<0.0;
#endif
    if(u_xlatb9.x){discard;}
    u_xlatb9.xy = equal(vec4(vec4(_Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat9 = (u_xlatb9.x) ? vs_TEXCOORD1.z : 1.0;
    u_xlat9 = (u_xlatb9.y) ? vs_TEXCOORD1.w : u_xlat9;
    u_xlat18.x = (-u_xlat9) + 1.0;
    u_xlat9 = (u_xlatb9.z) ? u_xlat18.x : u_xlat9;
    u_xlat9 = u_xlat9 + _Clip2Amount;
    u_xlat9 = dot(vec2(u_xlat9), vec2(vec2(_Rongjie2_Fanwei, _Rongjie2_Fanwei)));
    u_xlat9 = u_xlat9 + (-_Rongjie2_Fanwei);
    u_xlat18.xy = _Time.yy * _Rongjie2_TiSP.zw;
    u_xlat18.xy = vs_TEXCOORD1.zw * _Rongjie2_TiSP.xy + u_xlat18.xy;
    u_xlat16_18 = texture(_Rongjie2_saoguang_liangbian, u_xlat18.xy).y;
    u_xlat9 = u_xlat16_18 + u_xlat9;
    u_xlat18.x = u_xlat9 + -1.0;
    u_xlat9 = dot(vec2(u_xlat9), vec2(vec2(_Rongjie2_Color_Fanwei, _Rongjie2_Color_Fanwei)));
    u_xlat9 = u_xlat9 + (-_Rongjie2_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat19.x = (-u_xlat9) + 1.0;
    u_xlat9 = texture(_Rongjie2_saoguang_liangbian, vs_TEXCOORD1.zw).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9.x = !!(u_xlat9>=0.100000001);
#else
    u_xlatb9.x = u_xlat9>=0.100000001;
#endif
    u_xlat9 = u_xlatb9.x ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat9 * u_xlat18.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x<0.0);
#else
    u_xlatb18 = u_xlat18.x<0.0;
#endif
    if(u_xlatb18){discard;}
    u_xlat18.x = _Dissolve2Color.w * _Dissolve2Color.x;
    u_xlat18.x = u_xlat18.x * _Dissolve2Color_Power;
    u_xlat18.x = u_xlat19.x * u_xlat18.x;
    u_xlat1.y = float(0.0);
    u_xlat19.y = float(0.0);
    u_xlat16_27 = texture(_Rongjie2_saoguang_liangbian, u_xlat19.xy).z;
    u_xlat16_10 = texture(_Rongjie_saoguang_liangbian, u_xlat1.xy).z;
    u_xlat18.x = u_xlat16_27 * u_xlat18.x;
    u_xlat9 = u_xlat9 * u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat18.x = _DissolveColor.w * _DissolveColor.x;
    u_xlat18.x = u_xlat18.x * _DissolveColor_Power;
    u_xlat18.x = u_xlat1.x * u_xlat18.x;
    u_xlat18.x = u_xlat16_10 * u_xlat18.x;
    u_xlat0.x = u_xlat0.x * u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat1.xyz = u_xlat18.xxx * vs_TEXCOORD4.xyz;
    u_xlat18.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_NormalMap, u_xlat18.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD6.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD5.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat2.zzz + u_xlat4.xyz;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat3.w = (-u_xlat3.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ViewDirectional));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ViewDirectional);
#endif
    u_xlat4.xyz = (bool(u_xlatb28)) ? u_xlat3.xyw : u_xlat2.xyz;
    u_xlat5.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat5.xy = u_xlat5.xy * vec2(3.1400001, 3.1400001);
    u_xlat6.x = sin(u_xlat5.x);
    u_xlat5.x = cos(u_xlat5.x);
    u_xlat7.x = sin(u_xlat5.y);
    u_xlat8.x = cos(u_xlat5.y);
    u_xlat28 = u_xlat5.x + u_xlat8.x;
    u_xlat6.y = u_xlat7.x;
    u_xlat6.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Step;
    u_xlat28 = roundEven(u_xlat28);
    u_xlat4.yz = texture(_MaskTex, u_xlat18.xy).xz;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat18.xy).xyz;
    u_xlat6.xyz = u_xlat4.zzz * _Sanshe_color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Sanshe_Power, _Sanshe_Power, _Sanshe_Power));
    u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz / vec3(vec3(_Sanshe_Step, _Sanshe_Step, _Sanshe_Step));
    u_xlat7.xyz = vs_COLOR0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = u_xlat7.yyy * vs_TEXCOORD6.xyz;
    u_xlat7.xyw = u_xlat7.xxx * vs_TEXCOORD5.xyz + u_xlat8.xyz;
    u_xlat1.xyz = u_xlat7.zzz * u_xlat1.xyz + u_xlat7.xyw;
    u_xlat18.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat18.x = dot(_LightOffset.xyz, _LightOffset.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat7.xyz = u_xlat18.xxx * _LightOffset.xyz;
    u_xlat18.x = dot(u_xlat1.xyz, u_xlat7.xyz);
    u_xlat27 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat18.x = (-u_xlat27) + u_xlat18.x;
    u_xlat18.x = _ColorNormWeight * u_xlat18.x + u_xlat27;
    u_xlat18.x = u_xlat18.x * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat1.xy = _Time.yy * _Noise_TiSp.zw;
    u_xlat1.xy = vs_TEXCOORD2.xy * _Noise_TiSp.xy + u_xlat1.xy;
    u_xlat16_27 = texture(_MaskTex, u_xlat1.xy).y;
    u_xlat18.x = (-u_xlat16_27) * _Noise_Intensity + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat18.x + (-_RampOffset);
    u_xlat1.x = (-_RampOffset) + 1.0;
    u_xlat27 = u_xlat27 / u_xlat1.x;
    u_xlat27 = u_xlat27 * 0.5 + 0.5;
    u_xlat1.x = u_xlat18.x / _RampOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_RampOffset>=u_xlat18.x);
#else
    u_xlatb18 = _RampOffset>=u_xlat18.x;
#endif
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat4.x = (u_xlatb18) ? u_xlat1.x : u_xlat27;
    u_xlat16_1.xyz = texture(_RampTex, u_xlat4.xy).xyz;
    u_xlat18.xy = vs_TEXCOORD0.zw * _InSideOnline_ST.xy + _InSideOnline_ST.zw;
    u_xlat16_2.xyz = texture(_InSideOnline, u_xlat18.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz + (-u_xlat16_5.xyz);
    u_xlat2.xyz = vec3(_InSideOnline_Width) * u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainColor.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_1.xyz + u_xlat6.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _DissolveColor.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + _Dissolve2Color.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat1.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" }
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
uniform 	float _Noise_Use3U;
uniform 	float _Dissovle_Use_2U;
uniform 	float _Dissovle2_Use_3U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec3 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_COLOR0;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD2.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Noise_Use3U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Noise_Use3U);
#endif
    vs_TEXCOORD2.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    vs_COLOR0.xyz = in_COLOR0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.yzx * in_NORMAL0.zxy;
    u_xlat1.xyz = in_NORMAL0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD6.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _ColorNormWeight;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _RampOffset;
uniform 	vec4 _LightOffset;
uniform 	vec4 _Noise_TiSp;
uniform 	float _Noise_Intensity;
uniform 	float _ViewDirectional;
uniform 	float _Sanshe_Step;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	float _ReverseDis2Dir;
uniform 	vec4 _Rongjie_TiSP;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Dissolve2_Dir;
uniform 	vec4 _Rongjie2_TiSP;
uniform 	vec4 _Dissolve2Color;
uniform 	float _Dissolve2Color_Power;
uniform 	float _Clip2Amount;
uniform 	float _Rongjie2_Fanwei;
uniform 	float _Rongjie2_Color_Fanwei;
uniform 	vec4 _InSideOnline_ST;
uniform 	float _InSideOnline_Width;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _InSideOnline;
UNITY_LOCATION(4) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(6) uniform mediump sampler2D _Rongjie2_saoguang_liangbian;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_COLOR0;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
float u_xlat9;
bvec3 u_xlatb9;
mediump float u_xlat16_10;
vec2 u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
vec2 u_xlat19;
float u_xlat27;
mediump float u_xlat16_27;
float u_xlat28;
bool u_xlatb28;
void main()
{
    u_xlat0.xy = _Time.yy * _Rongjie_TiSP.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_TiSP.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlatb9.xyz = equal(vec4(_Dissolve_Dir, _Dissolve_Dir, _ReverseDis2Dir, _ReverseDis2Dir), vec4(0.0, 1.0, 1.0, 1.0)).xyz;
    u_xlat9 = (u_xlatb9.x) ? vs_TEXCOORD1.x : 1.0;
    u_xlat9 = (u_xlatb9.y) ? vs_TEXCOORD1.y : u_xlat9;
    u_xlat9 = u_xlat9 + _ClipAmount;
    u_xlat9 = dot(vec2(u_xlat9), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat9 = u_xlat9 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat9;
    u_xlat9 = u_xlat0.x + -1.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = texture(_Rongjie_saoguang_liangbian, vs_TEXCOORD1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=0.100000001);
#else
    u_xlatb0 = u_xlat0.x>=0.100000001;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat9 = u_xlat0.x * u_xlat9 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9.x = !!(u_xlat9<0.0);
#else
    u_xlatb9.x = u_xlat9<0.0;
#endif
    if(u_xlatb9.x){discard;}
    u_xlatb9.xy = equal(vec4(vec4(_Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat9 = (u_xlatb9.x) ? vs_TEXCOORD1.z : 1.0;
    u_xlat9 = (u_xlatb9.y) ? vs_TEXCOORD1.w : u_xlat9;
    u_xlat18.x = (-u_xlat9) + 1.0;
    u_xlat9 = (u_xlatb9.z) ? u_xlat18.x : u_xlat9;
    u_xlat9 = u_xlat9 + _Clip2Amount;
    u_xlat9 = dot(vec2(u_xlat9), vec2(vec2(_Rongjie2_Fanwei, _Rongjie2_Fanwei)));
    u_xlat9 = u_xlat9 + (-_Rongjie2_Fanwei);
    u_xlat18.xy = _Time.yy * _Rongjie2_TiSP.zw;
    u_xlat18.xy = vs_TEXCOORD1.zw * _Rongjie2_TiSP.xy + u_xlat18.xy;
    u_xlat16_18 = texture(_Rongjie2_saoguang_liangbian, u_xlat18.xy).y;
    u_xlat9 = u_xlat16_18 + u_xlat9;
    u_xlat18.x = u_xlat9 + -1.0;
    u_xlat9 = dot(vec2(u_xlat9), vec2(vec2(_Rongjie2_Color_Fanwei, _Rongjie2_Color_Fanwei)));
    u_xlat9 = u_xlat9 + (-_Rongjie2_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat19.x = (-u_xlat9) + 1.0;
    u_xlat9 = texture(_Rongjie2_saoguang_liangbian, vs_TEXCOORD1.zw).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9.x = !!(u_xlat9>=0.100000001);
#else
    u_xlatb9.x = u_xlat9>=0.100000001;
#endif
    u_xlat9 = u_xlatb9.x ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat9 * u_xlat18.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x<0.0);
#else
    u_xlatb18 = u_xlat18.x<0.0;
#endif
    if(u_xlatb18){discard;}
    u_xlat18.x = _Dissolve2Color.w * _Dissolve2Color.x;
    u_xlat18.x = u_xlat18.x * _Dissolve2Color_Power;
    u_xlat18.x = u_xlat19.x * u_xlat18.x;
    u_xlat1.y = float(0.0);
    u_xlat19.y = float(0.0);
    u_xlat16_27 = texture(_Rongjie2_saoguang_liangbian, u_xlat19.xy).z;
    u_xlat16_10 = texture(_Rongjie_saoguang_liangbian, u_xlat1.xy).z;
    u_xlat18.x = u_xlat16_27 * u_xlat18.x;
    u_xlat9 = u_xlat9 * u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat18.x = _DissolveColor.w * _DissolveColor.x;
    u_xlat18.x = u_xlat18.x * _DissolveColor_Power;
    u_xlat18.x = u_xlat1.x * u_xlat18.x;
    u_xlat18.x = u_xlat16_10 * u_xlat18.x;
    u_xlat0.x = u_xlat0.x * u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat1.xyz = u_xlat18.xxx * vs_TEXCOORD4.xyz;
    u_xlat18.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_NormalMap, u_xlat18.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD6.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD5.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat2.zzz + u_xlat4.xyz;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat3.w = (-u_xlat3.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ViewDirectional));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ViewDirectional);
#endif
    u_xlat4.xyz = (bool(u_xlatb28)) ? u_xlat3.xyw : u_xlat2.xyz;
    u_xlat5.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat5.xy = u_xlat5.xy * vec2(3.1400001, 3.1400001);
    u_xlat6.x = sin(u_xlat5.x);
    u_xlat5.x = cos(u_xlat5.x);
    u_xlat7.x = sin(u_xlat5.y);
    u_xlat8.x = cos(u_xlat5.y);
    u_xlat28 = u_xlat5.x + u_xlat8.x;
    u_xlat6.y = u_xlat7.x;
    u_xlat6.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat6.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Step;
    u_xlat28 = roundEven(u_xlat28);
    u_xlat4.yz = texture(_MaskTex, u_xlat18.xy).xz;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat18.xy).xyz;
    u_xlat6.xyz = u_xlat4.zzz * _Sanshe_color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Sanshe_Power, _Sanshe_Power, _Sanshe_Power));
    u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz / vec3(vec3(_Sanshe_Step, _Sanshe_Step, _Sanshe_Step));
    u_xlat7.xyz = vs_COLOR0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = u_xlat7.yyy * vs_TEXCOORD6.xyz;
    u_xlat7.xyw = u_xlat7.xxx * vs_TEXCOORD5.xyz + u_xlat8.xyz;
    u_xlat1.xyz = u_xlat7.zzz * u_xlat1.xyz + u_xlat7.xyw;
    u_xlat18.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat18.x = dot(_LightOffset.xyz, _LightOffset.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat7.xyz = u_xlat18.xxx * _LightOffset.xyz;
    u_xlat18.x = dot(u_xlat1.xyz, u_xlat7.xyz);
    u_xlat27 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat18.x = (-u_xlat27) + u_xlat18.x;
    u_xlat18.x = _ColorNormWeight * u_xlat18.x + u_xlat27;
    u_xlat18.x = u_xlat18.x * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat1.xy = _Time.yy * _Noise_TiSp.zw;
    u_xlat1.xy = vs_TEXCOORD2.xy * _Noise_TiSp.xy + u_xlat1.xy;
    u_xlat16_27 = texture(_MaskTex, u_xlat1.xy).y;
    u_xlat18.x = (-u_xlat16_27) * _Noise_Intensity + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat18.x + (-_RampOffset);
    u_xlat1.x = (-_RampOffset) + 1.0;
    u_xlat27 = u_xlat27 / u_xlat1.x;
    u_xlat27 = u_xlat27 * 0.5 + 0.5;
    u_xlat1.x = u_xlat18.x / _RampOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_RampOffset>=u_xlat18.x);
#else
    u_xlatb18 = _RampOffset>=u_xlat18.x;
#endif
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat4.x = (u_xlatb18) ? u_xlat1.x : u_xlat27;
    u_xlat16_1.xyz = texture(_RampTex, u_xlat4.xy).xyz;
    u_xlat18.xy = vs_TEXCOORD0.zw * _InSideOnline_ST.xy + _InSideOnline_ST.zw;
    u_xlat16_2.xyz = texture(_InSideOnline, u_xlat18.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz + (-u_xlat16_5.xyz);
    u_xlat2.xyz = vec3(_InSideOnline_Width) * u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainColor.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_1.xyz + u_xlat6.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _DissolveColor.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + _Dissolve2Color.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat1.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Noise_Use3U;
uniform 	float _Dissovle_Use_2U;
uniform 	float _Dissovle2_Use_3U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD2.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Noise_Use3U);
    vs_TEXCOORD2.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    vs_COLOR0.xyz = in_COLOR0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.yzx * in_NORMAL0.zxy;
    u_xlat1.xyz = in_NORMAL0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD6.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _ColorNormWeight;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _RampOffset;
uniform 	vec4 _LightOffset;
uniform 	vec4 _Noise_TiSp;
uniform 	float _Noise_Intensity;
uniform 	float _ViewDirectional;
uniform 	float _Sanshe_Step;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	float _ReverseDis2Dir;
uniform 	vec4 _Rongjie_TiSP;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Dissolve2_Dir;
uniform 	vec4 _Rongjie2_TiSP;
uniform 	vec4 _Dissolve2Color;
uniform 	float _Dissolve2Color_Power;
uniform 	float _Clip2Amount;
uniform 	float _Rongjie2_Fanwei;
uniform 	float _Rongjie2_Color_Fanwei;
uniform 	vec4 _InSideOnline_ST;
uniform 	float _InSideOnline_Width;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _InSideOnline;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp sampler2D _Rongjie2_saoguang_liangbian;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
float u_xlat9;
bvec3 u_xlatb9;
lowp float u_xlat10_10;
vec2 u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
vec2 u_xlat19;
float u_xlat27;
lowp float u_xlat10_27;
float u_xlat28;
bool u_xlatb28;
float unity_roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 unity_roundEven(vec2 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); return a; }
vec3 unity_roundEven(vec3 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); return a; }
vec4 unity_roundEven(vec4 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); a.w = unity_roundEven(a.w); return a; }

void main()
{
    u_xlat0.xy = _Time.yy * _Rongjie_TiSP.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_TiSP.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlatb9.xyz = equal(vec4(_Dissolve_Dir, _Dissolve_Dir, _ReverseDis2Dir, _ReverseDis2Dir), vec4(0.0, 1.0, 1.0, 1.0)).xyz;
    u_xlat9 = (u_xlatb9.x) ? vs_TEXCOORD1.x : 1.0;
    u_xlat9 = (u_xlatb9.y) ? vs_TEXCOORD1.y : u_xlat9;
    u_xlat9 = u_xlat9 + _ClipAmount;
    u_xlat9 = dot(vec2(u_xlat9), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat9 = u_xlat9 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat9;
    u_xlat9 = u_xlat0.x + -1.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = texture2D(_Rongjie_saoguang_liangbian, vs_TEXCOORD1.xy).x;
    u_xlatb0 = u_xlat0.x>=0.100000001;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat9 = u_xlat0.x * u_xlat9 + 0.5;
    u_xlatb9.x = u_xlat9<0.0;
    if(u_xlatb9.x){discard;}
    u_xlatb9.xy = equal(vec4(vec4(_Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat9 = (u_xlatb9.x) ? vs_TEXCOORD1.z : 1.0;
    u_xlat9 = (u_xlatb9.y) ? vs_TEXCOORD1.w : u_xlat9;
    u_xlat18.x = (-u_xlat9) + 1.0;
    u_xlat9 = (u_xlatb9.z) ? u_xlat18.x : u_xlat9;
    u_xlat9 = u_xlat9 + _Clip2Amount;
    u_xlat9 = dot(vec2(u_xlat9), vec2(vec2(_Rongjie2_Fanwei, _Rongjie2_Fanwei)));
    u_xlat9 = u_xlat9 + (-_Rongjie2_Fanwei);
    u_xlat18.xy = _Time.yy * _Rongjie2_TiSP.zw;
    u_xlat18.xy = vs_TEXCOORD1.zw * _Rongjie2_TiSP.xy + u_xlat18.xy;
    u_xlat10_18 = texture2D(_Rongjie2_saoguang_liangbian, u_xlat18.xy).y;
    u_xlat9 = u_xlat10_18 + u_xlat9;
    u_xlat18.x = u_xlat9 + -1.0;
    u_xlat9 = dot(vec2(u_xlat9), vec2(vec2(_Rongjie2_Color_Fanwei, _Rongjie2_Color_Fanwei)));
    u_xlat9 = u_xlat9 + (-_Rongjie2_Color_Fanwei);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat19.x = (-u_xlat9) + 1.0;
    u_xlat9 = texture2D(_Rongjie2_saoguang_liangbian, vs_TEXCOORD1.zw).x;
    u_xlatb9.x = u_xlat9>=0.100000001;
    u_xlat9 = u_xlatb9.x ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat9 * u_xlat18.x + 0.5;
    u_xlatb18 = u_xlat18.x<0.0;
    if(u_xlatb18){discard;}
    u_xlat18.x = _Dissolve2Color.w * _Dissolve2Color.x;
    u_xlat18.x = u_xlat18.x * _Dissolve2Color_Power;
    u_xlat18.x = u_xlat19.x * u_xlat18.x;
    u_xlat1.y = float(0.0);
    u_xlat19.y = float(0.0);
    u_xlat10_27 = texture2D(_Rongjie2_saoguang_liangbian, u_xlat19.xy).z;
    u_xlat10_10 = texture2D(_Rongjie_saoguang_liangbian, u_xlat1.xy).z;
    u_xlat18.x = u_xlat10_27 * u_xlat18.x;
    u_xlat9 = u_xlat9 * u_xlat18.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat18.x = _DissolveColor.w * _DissolveColor.x;
    u_xlat18.x = u_xlat18.x * _DissolveColor_Power;
    u_xlat18.x = u_xlat1.x * u_xlat18.x;
    u_xlat18.x = u_xlat10_10 * u_xlat18.x;
    u_xlat0.x = u_xlat0.x * u_xlat18.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat18.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat1.xyz = u_xlat18.xxx * vs_TEXCOORD4.xyz;
    u_xlat18.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_NormalMap, u_xlat18.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD6.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD5.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat2.zzz + u_xlat4.xyz;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat3.w = (-u_xlat3.z);
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ViewDirectional);
    u_xlat4.xyz = (bool(u_xlatb28)) ? u_xlat3.xyw : u_xlat2.xyz;
    u_xlat5.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat5.xy = u_xlat5.xy * vec2(3.1400001, 3.1400001);
    u_xlat6.x = sin(u_xlat5.x);
    u_xlat5.x = cos(u_xlat5.x);
    u_xlat7.x = sin(u_xlat5.y);
    u_xlat8.x = cos(u_xlat5.y);
    u_xlat28 = u_xlat5.x + u_xlat8.x;
    u_xlat6.y = u_xlat7.x;
    u_xlat6.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat6.xyz, u_xlat4.xyz);
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Step;
    u_xlat28 = unity_roundEven(u_xlat28);
    u_xlat4.yz = texture2D(_MaskTex, u_xlat18.xy).xz;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat18.xy).xyz;
    u_xlat6.xyz = u_xlat4.zzz * _Sanshe_color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Sanshe_Power, _Sanshe_Power, _Sanshe_Power));
    u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz / vec3(vec3(_Sanshe_Step, _Sanshe_Step, _Sanshe_Step));
    u_xlat7.xyz = vs_COLOR0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = u_xlat7.yyy * vs_TEXCOORD6.xyz;
    u_xlat7.xyw = u_xlat7.xxx * vs_TEXCOORD5.xyz + u_xlat8.xyz;
    u_xlat1.xyz = u_xlat7.zzz * u_xlat1.xyz + u_xlat7.xyw;
    u_xlat18.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat18.x = dot(_LightOffset.xyz, _LightOffset.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat7.xyz = u_xlat18.xxx * _LightOffset.xyz;
    u_xlat18.x = dot(u_xlat1.xyz, u_xlat7.xyz);
    u_xlat27 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat18.x = (-u_xlat27) + u_xlat18.x;
    u_xlat18.x = _ColorNormWeight * u_xlat18.x + u_xlat27;
    u_xlat18.x = u_xlat18.x * 0.5 + 0.5;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlat1.xy = _Time.yy * _Noise_TiSp.zw;
    u_xlat1.xy = vs_TEXCOORD2.xy * _Noise_TiSp.xy + u_xlat1.xy;
    u_xlat10_27 = texture2D(_MaskTex, u_xlat1.xy).y;
    u_xlat18.x = (-u_xlat10_27) * _Noise_Intensity + u_xlat18.x;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlat27 = u_xlat18.x + (-_RampOffset);
    u_xlat1.x = (-_RampOffset) + 1.0;
    u_xlat27 = u_xlat27 / u_xlat1.x;
    u_xlat27 = u_xlat27 * 0.5 + 0.5;
    u_xlat1.x = u_xlat18.x / _RampOffset;
    u_xlatb18 = _RampOffset>=u_xlat18.x;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat4.x = (u_xlatb18) ? u_xlat1.x : u_xlat27;
    u_xlat10_1.xyz = texture2D(_RampTex, u_xlat4.xy).xyz;
    u_xlat18.xy = vs_TEXCOORD0.zw * _InSideOnline_ST.xy + _InSideOnline_ST.zw;
    u_xlat10_2.xyz = texture2D(_InSideOnline, u_xlat18.xy).xyz;
    u_xlat2.xyz = u_xlat10_5.xyz * u_xlat10_2.xyz + (-u_xlat10_5.xyz);
    u_xlat2.xyz = vec3(_InSideOnline_Width) * u_xlat2.xyz + u_xlat10_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainColor.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + u_xlat6.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _DissolveColor.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + _Dissolve2Color.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat1.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Noise_Use3U;
uniform 	float _Dissovle_Use_2U;
uniform 	float _Dissovle2_Use_3U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_COLOR0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD2.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Noise_Use3U);
    vs_TEXCOORD2.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    vs_COLOR0.xyz = in_COLOR0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.yzx * in_NORMAL0.zxy;
    u_xlat1.xyz = in_NORMAL0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD6.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD7.zw = u_xlat0.zw;
    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _ColorNormWeight;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _RampOffset;
uniform 	vec4 _LightOffset;
uniform 	vec4 _Noise_TiSp;
uniform 	float _Noise_Intensity;
uniform 	float _ViewDirectional;
uniform 	float _Sanshe_Step;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	float _ReverseDis2Dir;
uniform 	vec4 _Rongjie_TiSP;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Dissolve2_Dir;
uniform 	vec4 _Rongjie2_TiSP;
uniform 	vec4 _Dissolve2Color;
uniform 	float _Dissolve2Color_Power;
uniform 	float _Clip2Amount;
uniform 	float _Rongjie2_Fanwei;
uniform 	float _Rongjie2_Color_Fanwei;
uniform 	vec4 _InSideOnline_ST;
uniform 	float _InSideOnline_Width;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _InSideOnline;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp sampler2D _Rongjie2_saoguang_liangbian;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
float u_xlat9;
bvec3 u_xlatb9;
lowp float u_xlat10_10;
vec2 u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
vec2 u_xlat19;
float u_xlat27;
lowp float u_xlat10_27;
float u_xlat28;
bool u_xlatb28;
float unity_roundEven(float x) { float y = floor(x + 0.5); return (y - x == 0.5) ? floor(0.5*y) * 2.0 : y; }
vec2 unity_roundEven(vec2 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); return a; }
vec3 unity_roundEven(vec3 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); return a; }
vec4 unity_roundEven(vec4 a) { a.x = unity_roundEven(a.x); a.y = unity_roundEven(a.y); a.z = unity_roundEven(a.z); a.w = unity_roundEven(a.w); return a; }

void main()
{
    u_xlat0.xy = _Time.yy * _Rongjie_TiSP.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_TiSP.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlatb9.xyz = equal(vec4(_Dissolve_Dir, _Dissolve_Dir, _ReverseDis2Dir, _ReverseDis2Dir), vec4(0.0, 1.0, 1.0, 1.0)).xyz;
    u_xlat9 = (u_xlatb9.x) ? vs_TEXCOORD1.x : 1.0;
    u_xlat9 = (u_xlatb9.y) ? vs_TEXCOORD1.y : u_xlat9;
    u_xlat9 = u_xlat9 + _ClipAmount;
    u_xlat9 = dot(vec2(u_xlat9), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat9 = u_xlat9 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat9;
    u_xlat9 = u_xlat0.x + -1.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = texture2D(_Rongjie_saoguang_liangbian, vs_TEXCOORD1.xy).x;
    u_xlatb0 = u_xlat0.x>=0.100000001;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat9 = u_xlat0.x * u_xlat9 + 0.5;
    u_xlatb9.x = u_xlat9<0.0;
    if(u_xlatb9.x){discard;}
    u_xlatb9.xy = equal(vec4(vec4(_Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat9 = (u_xlatb9.x) ? vs_TEXCOORD1.z : 1.0;
    u_xlat9 = (u_xlatb9.y) ? vs_TEXCOORD1.w : u_xlat9;
    u_xlat18.x = (-u_xlat9) + 1.0;
    u_xlat9 = (u_xlatb9.z) ? u_xlat18.x : u_xlat9;
    u_xlat9 = u_xlat9 + _Clip2Amount;
    u_xlat9 = dot(vec2(u_xlat9), vec2(vec2(_Rongjie2_Fanwei, _Rongjie2_Fanwei)));
    u_xlat9 = u_xlat9 + (-_Rongjie2_Fanwei);
    u_xlat18.xy = _Time.yy * _Rongjie2_TiSP.zw;
    u_xlat18.xy = vs_TEXCOORD1.zw * _Rongjie2_TiSP.xy + u_xlat18.xy;
    u_xlat10_18 = texture2D(_Rongjie2_saoguang_liangbian, u_xlat18.xy).y;
    u_xlat9 = u_xlat10_18 + u_xlat9;
    u_xlat18.x = u_xlat9 + -1.0;
    u_xlat9 = dot(vec2(u_xlat9), vec2(vec2(_Rongjie2_Color_Fanwei, _Rongjie2_Color_Fanwei)));
    u_xlat9 = u_xlat9 + (-_Rongjie2_Color_Fanwei);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat19.x = (-u_xlat9) + 1.0;
    u_xlat9 = texture2D(_Rongjie2_saoguang_liangbian, vs_TEXCOORD1.zw).x;
    u_xlatb9.x = u_xlat9>=0.100000001;
    u_xlat9 = u_xlatb9.x ? 1.0 : float(0.0);
    u_xlat18.x = u_xlat9 * u_xlat18.x + 0.5;
    u_xlatb18 = u_xlat18.x<0.0;
    if(u_xlatb18){discard;}
    u_xlat18.x = _Dissolve2Color.w * _Dissolve2Color.x;
    u_xlat18.x = u_xlat18.x * _Dissolve2Color_Power;
    u_xlat18.x = u_xlat19.x * u_xlat18.x;
    u_xlat1.y = float(0.0);
    u_xlat19.y = float(0.0);
    u_xlat10_27 = texture2D(_Rongjie2_saoguang_liangbian, u_xlat19.xy).z;
    u_xlat10_10 = texture2D(_Rongjie_saoguang_liangbian, u_xlat1.xy).z;
    u_xlat18.x = u_xlat10_27 * u_xlat18.x;
    u_xlat9 = u_xlat9 * u_xlat18.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat18.x = _DissolveColor.w * _DissolveColor.x;
    u_xlat18.x = u_xlat18.x * _DissolveColor_Power;
    u_xlat18.x = u_xlat1.x * u_xlat18.x;
    u_xlat18.x = u_xlat10_10 * u_xlat18.x;
    u_xlat0.x = u_xlat0.x * u_xlat18.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat18.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat1.xyz = u_xlat18.xxx * vs_TEXCOORD4.xyz;
    u_xlat18.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_NormalMap, u_xlat18.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD6.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD5.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat4.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat2.zzz + u_xlat4.xyz;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat3.w = (-u_xlat3.z);
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ViewDirectional);
    u_xlat4.xyz = (bool(u_xlatb28)) ? u_xlat3.xyw : u_xlat2.xyz;
    u_xlat5.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat5.xy = u_xlat5.xy * vec2(3.1400001, 3.1400001);
    u_xlat6.x = sin(u_xlat5.x);
    u_xlat5.x = cos(u_xlat5.x);
    u_xlat7.x = sin(u_xlat5.y);
    u_xlat8.x = cos(u_xlat5.y);
    u_xlat28 = u_xlat5.x + u_xlat8.x;
    u_xlat6.y = u_xlat7.x;
    u_xlat6.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat6.xyz, u_xlat4.xyz);
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Step;
    u_xlat28 = unity_roundEven(u_xlat28);
    u_xlat4.yz = texture2D(_MaskTex, u_xlat18.xy).xz;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat18.xy).xyz;
    u_xlat6.xyz = u_xlat4.zzz * _Sanshe_color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Sanshe_Power, _Sanshe_Power, _Sanshe_Power));
    u_xlat6.xyz = vec3(u_xlat28) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz / vec3(vec3(_Sanshe_Step, _Sanshe_Step, _Sanshe_Step));
    u_xlat7.xyz = vs_COLOR0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = u_xlat7.yyy * vs_TEXCOORD6.xyz;
    u_xlat7.xyw = u_xlat7.xxx * vs_TEXCOORD5.xyz + u_xlat8.xyz;
    u_xlat1.xyz = u_xlat7.zzz * u_xlat1.xyz + u_xlat7.xyw;
    u_xlat18.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat1.xyz = u_xlat18.xxx * u_xlat1.xyz;
    u_xlat18.x = dot(_LightOffset.xyz, _LightOffset.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat7.xyz = u_xlat18.xxx * _LightOffset.xyz;
    u_xlat18.x = dot(u_xlat1.xyz, u_xlat7.xyz);
    u_xlat27 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat18.x = (-u_xlat27) + u_xlat18.x;
    u_xlat18.x = _ColorNormWeight * u_xlat18.x + u_xlat27;
    u_xlat18.x = u_xlat18.x * 0.5 + 0.5;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlat1.xy = _Time.yy * _Noise_TiSp.zw;
    u_xlat1.xy = vs_TEXCOORD2.xy * _Noise_TiSp.xy + u_xlat1.xy;
    u_xlat10_27 = texture2D(_MaskTex, u_xlat1.xy).y;
    u_xlat18.x = (-u_xlat10_27) * _Noise_Intensity + u_xlat18.x;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlat27 = u_xlat18.x + (-_RampOffset);
    u_xlat1.x = (-_RampOffset) + 1.0;
    u_xlat27 = u_xlat27 / u_xlat1.x;
    u_xlat27 = u_xlat27 * 0.5 + 0.5;
    u_xlat1.x = u_xlat18.x / _RampOffset;
    u_xlatb18 = _RampOffset>=u_xlat18.x;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat4.x = (u_xlatb18) ? u_xlat1.x : u_xlat27;
    u_xlat10_1.xyz = texture2D(_RampTex, u_xlat4.xy).xyz;
    u_xlat18.xy = vs_TEXCOORD0.zw * _InSideOnline_ST.xy + _InSideOnline_ST.zw;
    u_xlat10_2.xyz = texture2D(_InSideOnline, u_xlat18.xy).xyz;
    u_xlat2.xyz = u_xlat10_5.xyz * u_xlat10_2.xyz + (-u_xlat10_5.xyz);
    u_xlat2.xyz = vec3(_InSideOnline_Width) * u_xlat2.xyz + u_xlat10_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _MainColor.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat10_1.xyz + u_xlat6.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _DissolveColor.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + _Dissolve2Color.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat1.xyz + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
Keywords { "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" }
""
}
}
}
 Pass {
 Name "Outline"
  Tags { "RenderType" = "Opaque" }
 Cull Front
  GpuProgramID 106183
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	float _Outline_Width;
uniform 	vec4 _Outline_Sampler_ST;
uniform 	float _Dissovle_Use_2U;
uniform 	float _Dissovle2_Use_3U;
UNITY_LOCATION(0) uniform mediump sampler2D _Outline_Sampler;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat2.xy = in_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat9 = textureLod(_Outline_Sampler, u_xlat2.xy, 0.0).w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD2.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Outline_Sampler_ST;
uniform 	vec4 _Outline_Color;
uniform 	float _Dissolve_Dir;
uniform 	float _ReverseDis2Dir;
uniform 	vec4 _Rongjie_TiSP;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Dissolve2_Dir;
uniform 	vec4 _Rongjie2_TiSP;
uniform 	float _Clip2Amount;
uniform 	float _Rongjie2_Fanwei;
UNITY_LOCATION(0) uniform mediump sampler2D _Outline_Sampler;
UNITY_LOCATION(1) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(2) uniform mediump sampler2D _Rongjie2_saoguang_liangbian;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump float u_xlat16_1;
bvec3 u_xlatb1;
void main()
{
    u_xlat0.xy = _Time.yy * _Rongjie_TiSP.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_TiSP.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlatb1.xyz = equal(vec4(_Dissolve_Dir, _Dissolve_Dir, _ReverseDis2Dir, _ReverseDis2Dir), vec4(0.0, 1.0, 1.0, 1.0)).xyz;
    u_xlat1.x = (u_xlatb1.x) ? vs_TEXCOORD1.x : 1.0;
    u_xlat1.x = (u_xlatb1.y) ? vs_TEXCOORD1.y : u_xlat1.x;
    u_xlat1.x = u_xlat1.x + _ClipAmount;
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat1.x = u_xlat1.x + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0.x + u_xlat1.x;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat1.x = texture(_Rongjie_saoguang_liangbian, vs_TEXCOORD1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x>=0.100000001);
#else
    u_xlatb1.x = u_xlat1.x>=0.100000001;
#endif
    u_xlat1.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1.x * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlatb0.xy = equal(vec4(vec4(_Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat0.x = (u_xlatb0.x) ? vs_TEXCOORD1.z : 1.0;
    u_xlat0.x = (u_xlatb0.y) ? vs_TEXCOORD1.w : u_xlat0.x;
    u_xlat1.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (u_xlatb1.z) ? u_xlat1.x : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _Clip2Amount;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie2_Fanwei, _Rongjie2_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie2_Fanwei);
    u_xlat1.xy = _Time.yy * _Rongjie2_TiSP.zw;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Rongjie2_TiSP.xy + u_xlat1.xy;
    u_xlat16_1 = texture(_Rongjie2_saoguang_liangbian, u_xlat1.xy).y;
    u_xlat0.x = u_xlat16_1 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat1.x = texture(_Rongjie2_saoguang_liangbian, vs_TEXCOORD1.zw).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x>=0.100000001);
#else
    u_xlatb1.x = u_xlat1.x>=0.100000001;
#endif
    u_xlat1.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1.x * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0.xy = vs_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat16_0 = texture(_Outline_Sampler, u_xlat0.xy);
    SV_Target0 = u_xlat16_0 * _Outline_Color;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	float _Outline_Width;
uniform 	vec4 _Outline_Sampler_ST;
uniform 	float _Dissovle_Use_2U;
uniform 	float _Dissovle2_Use_3U;
UNITY_LOCATION(0) uniform mediump sampler2D _Outline_Sampler;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat2.xy = in_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat9 = textureLod(_Outline_Sampler, u_xlat2.xy, 0.0).w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD2.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Outline_Sampler_ST;
uniform 	vec4 _Outline_Color;
uniform 	float _Dissolve_Dir;
uniform 	float _ReverseDis2Dir;
uniform 	vec4 _Rongjie_TiSP;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Dissolve2_Dir;
uniform 	vec4 _Rongjie2_TiSP;
uniform 	float _Clip2Amount;
uniform 	float _Rongjie2_Fanwei;
UNITY_LOCATION(0) uniform mediump sampler2D _Outline_Sampler;
UNITY_LOCATION(1) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(2) uniform mediump sampler2D _Rongjie2_saoguang_liangbian;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump float u_xlat16_1;
bvec3 u_xlatb1;
void main()
{
    u_xlat0.xy = _Time.yy * _Rongjie_TiSP.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_TiSP.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlatb1.xyz = equal(vec4(_Dissolve_Dir, _Dissolve_Dir, _ReverseDis2Dir, _ReverseDis2Dir), vec4(0.0, 1.0, 1.0, 1.0)).xyz;
    u_xlat1.x = (u_xlatb1.x) ? vs_TEXCOORD1.x : 1.0;
    u_xlat1.x = (u_xlatb1.y) ? vs_TEXCOORD1.y : u_xlat1.x;
    u_xlat1.x = u_xlat1.x + _ClipAmount;
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat1.x = u_xlat1.x + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0.x + u_xlat1.x;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat1.x = texture(_Rongjie_saoguang_liangbian, vs_TEXCOORD1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x>=0.100000001);
#else
    u_xlatb1.x = u_xlat1.x>=0.100000001;
#endif
    u_xlat1.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1.x * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlatb0.xy = equal(vec4(vec4(_Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat0.x = (u_xlatb0.x) ? vs_TEXCOORD1.z : 1.0;
    u_xlat0.x = (u_xlatb0.y) ? vs_TEXCOORD1.w : u_xlat0.x;
    u_xlat1.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (u_xlatb1.z) ? u_xlat1.x : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _Clip2Amount;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie2_Fanwei, _Rongjie2_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie2_Fanwei);
    u_xlat1.xy = _Time.yy * _Rongjie2_TiSP.zw;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Rongjie2_TiSP.xy + u_xlat1.xy;
    u_xlat16_1 = texture(_Rongjie2_saoguang_liangbian, u_xlat1.xy).y;
    u_xlat0.x = u_xlat16_1 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat1.x = texture(_Rongjie2_saoguang_liangbian, vs_TEXCOORD1.zw).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x>=0.100000001);
#else
    u_xlatb1.x = u_xlat1.x>=0.100000001;
#endif
    u_xlat1.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1.x * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0.xy = vs_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat16_0 = texture(_Outline_Sampler, u_xlat0.xy);
    SV_Target0 = u_xlat16_0 * _Outline_Color;
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
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	float _Outline_Width;
uniform 	vec4 _Outline_Sampler_ST;
uniform 	float _Dissovle_Use_2U;
uniform 	float _Dissovle2_Use_3U;
uniform lowp sampler2D _Outline_Sampler;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat2.xy = in_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat9 = texture2DLod(_Outline_Sampler, u_xlat2.xy, 0.0).w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U);
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD2.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Outline_Sampler_ST;
uniform 	vec4 _Outline_Color;
uniform 	float _Dissolve_Dir;
uniform 	float _ReverseDis2Dir;
uniform 	vec4 _Rongjie_TiSP;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Dissolve2_Dir;
uniform 	vec4 _Rongjie2_TiSP;
uniform 	float _Clip2Amount;
uniform 	float _Rongjie2_Fanwei;
uniform lowp sampler2D _Outline_Sampler;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp sampler2D _Rongjie2_saoguang_liangbian;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
bvec2 u_xlatb0;
vec2 u_xlat1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
void main()
{
    u_xlat0.xy = _Time.yy * _Rongjie_TiSP.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_TiSP.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlatb1.xyz = equal(vec4(_Dissolve_Dir, _Dissolve_Dir, _ReverseDis2Dir, _ReverseDis2Dir), vec4(0.0, 1.0, 1.0, 1.0)).xyz;
    u_xlat1.x = (u_xlatb1.x) ? vs_TEXCOORD1.x : 1.0;
    u_xlat1.x = (u_xlatb1.y) ? vs_TEXCOORD1.y : u_xlat1.x;
    u_xlat1.x = u_xlat1.x + _ClipAmount;
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat1.x = u_xlat1.x + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0.x + u_xlat1.x;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat1.x = texture2D(_Rongjie_saoguang_liangbian, vs_TEXCOORD1.xy).x;
    u_xlatb1.x = u_xlat1.x>=0.100000001;
    u_xlat1.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1.x * u_xlat0.x + 0.5;
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    u_xlatb0.xy = equal(vec4(vec4(_Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat0.x = (u_xlatb0.x) ? vs_TEXCOORD1.z : 1.0;
    u_xlat0.x = (u_xlatb0.y) ? vs_TEXCOORD1.w : u_xlat0.x;
    u_xlat1.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (u_xlatb1.z) ? u_xlat1.x : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _Clip2Amount;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie2_Fanwei, _Rongjie2_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie2_Fanwei);
    u_xlat1.xy = _Time.yy * _Rongjie2_TiSP.zw;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Rongjie2_TiSP.xy + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Rongjie2_saoguang_liangbian, u_xlat1.xy).y;
    u_xlat0.x = u_xlat10_1 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat1.x = texture2D(_Rongjie2_saoguang_liangbian, vs_TEXCOORD1.zw).x;
    u_xlatb1.x = u_xlat1.x>=0.100000001;
    u_xlat1.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1.x * u_xlat0.x + 0.5;
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    u_xlat0.xy = vs_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat10_0 = texture2D(_Outline_Sampler, u_xlat0.xy);
    SV_Target0 = u_xlat10_0 * _Outline_Color;
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
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	float _Outline_Width;
uniform 	vec4 _Outline_Sampler_ST;
uniform 	float _Dissovle_Use_2U;
uniform 	float _Dissovle2_Use_3U;
uniform lowp sampler2D _Outline_Sampler;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat2.xy = in_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat9 = texture2DLod(_Outline_Sampler, u_xlat2.xy, 0.0).w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle2_Use_3U);
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD2.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Outline_Sampler_ST;
uniform 	vec4 _Outline_Color;
uniform 	float _Dissolve_Dir;
uniform 	float _ReverseDis2Dir;
uniform 	vec4 _Rongjie_TiSP;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Dissolve2_Dir;
uniform 	vec4 _Rongjie2_TiSP;
uniform 	float _Clip2Amount;
uniform 	float _Rongjie2_Fanwei;
uniform lowp sampler2D _Outline_Sampler;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp sampler2D _Rongjie2_saoguang_liangbian;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
bvec2 u_xlatb0;
vec2 u_xlat1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
void main()
{
    u_xlat0.xy = _Time.yy * _Rongjie_TiSP.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_TiSP.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlatb1.xyz = equal(vec4(_Dissolve_Dir, _Dissolve_Dir, _ReverseDis2Dir, _ReverseDis2Dir), vec4(0.0, 1.0, 1.0, 1.0)).xyz;
    u_xlat1.x = (u_xlatb1.x) ? vs_TEXCOORD1.x : 1.0;
    u_xlat1.x = (u_xlatb1.y) ? vs_TEXCOORD1.y : u_xlat1.x;
    u_xlat1.x = u_xlat1.x + _ClipAmount;
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat1.x = u_xlat1.x + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0.x + u_xlat1.x;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat1.x = texture2D(_Rongjie_saoguang_liangbian, vs_TEXCOORD1.xy).x;
    u_xlatb1.x = u_xlat1.x>=0.100000001;
    u_xlat1.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1.x * u_xlat0.x + 0.5;
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    u_xlatb0.xy = equal(vec4(vec4(_Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir, _Dissolve2_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat0.x = (u_xlatb0.x) ? vs_TEXCOORD1.z : 1.0;
    u_xlat0.x = (u_xlatb0.y) ? vs_TEXCOORD1.w : u_xlat0.x;
    u_xlat1.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (u_xlatb1.z) ? u_xlat1.x : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _Clip2Amount;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie2_Fanwei, _Rongjie2_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie2_Fanwei);
    u_xlat1.xy = _Time.yy * _Rongjie2_TiSP.zw;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Rongjie2_TiSP.xy + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Rongjie2_saoguang_liangbian, u_xlat1.xy).y;
    u_xlat0.x = u_xlat10_1 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat1.x = texture2D(_Rongjie2_saoguang_liangbian, vs_TEXCOORD1.zw).x;
    u_xlatb1.x = u_xlat1.x>=0.100000001;
    u_xlat1.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1.x * u_xlat0.x + 0.5;
    u_xlatb0.x = u_xlat0.x<0.0;
    if(u_xlatb0.x){discard;}
    u_xlat0.xy = vs_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat10_0 = texture2D(_Outline_Sampler, u_xlat0.xy);
    SV_Target0 = u_xlat10_0 * _Outline_Color;
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
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 136666
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
}
}
}
}