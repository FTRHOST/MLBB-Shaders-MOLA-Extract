//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Unlit/Eye_Cornea_Dissolve" {
Properties {

_ShadowTex ("眼皮阴影贴图", 2D) = "black" { }

_ShadowOffset ("阴影上下偏移", Range(-1, 1)) = 0.0

_ShadowColor ("阴影颜色", Color) = (0,0,0,1)

_Alpha ("不透明度", Range(0, 1)) = 1.0

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_MatCap ("高光MatCap", 2D) = "black" { }

_MatCapOffsetX ("MatCap偏移X", Range(-1, 1)) = 0.0

_MatCapOffsetY ("MatCap偏移Y", Range(-1, 1)) = 0.0

_MatCapOffsetX2 ("MatCap二次偏移X", Range(-1, 1)) = 0.0

_MatCapOffsetY2 ("MatCap二次偏移Y", Range(-1, 1)) = 0.0

_MatCap_Gloss_Intensity ("高光MatCap强度", Range(0, 5)) = 1.0

_MatCap_Ref ("反射MatCap", 2D) = "black" { }

_MatCap_Ref_Intensity ("反射MatCap强度", Range(0, 1)) = 0.5

_INVERT_DISSOLVE_DIR ("反转溶解方向", Float) = 0.0

_MainDissolveEdgeColor ("主要溶解边缘颜色", Color) = (1,1,1,1)

_MainDissolveEdgeShrink ("主要溶解边缘压缩", Float) = 6.0

_MainDissolveEdgeRange ("主要溶解边缘范围", Range(0.2, 10)) = 1.0

_Cutoff ("溶解进度", Range(-2, 1)) = 0.0

_DissolveOffset ("溶解位置偏移", Range(-0.1, 0.1)) = 0.0

_FeatureMaskTex ("R:sanshe1遮罩 G:sanshe2遮罩", 2D) = "white" { }

_SANSHE_ON ("散射开关关键字", Float) = 0.0

_Sanshe_color ("散射1颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe_Fw ("散射1范围", Range(0.001, 10)) = 1.0

_Sanshe_Power ("散射1强度", Float) = 0.0

_Sanshe_X ("散射1X轴偏移", Range(-1, 1)) = 0.0

_Sanshe_Y ("散射1Y轴偏移", Range(-1, 1)) = 0.0

_Sanshe2_color ("散射2颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe2_Fw ("散射2范围", Range(0.001, 10)) = 1.0

_Sanshe2_Power ("散射2强度", Float) = 0.0

_Sanshe2_X ("散射2X轴偏移", Range(-1, 1)) = 0.0

_Sanshe2_Y ("散射2Y轴偏移", Range(-1, 1)) = 0.0

[Toggle] _Crystal_UseCustomColor ("Use Custom Color", Float) = 0.0

_Crystal_CustomColorMask ("Custom Color Mask", 2D) = "black" { }

_Crystal_CustomColor_R_Color ("R Color", Color) = (1,1,1,1)

_Crystal_CustomColor_G_Color ("G Color", Color) = (1,1,1,1)

_Crystal_CustomColor_B_Color ("B Color", Color) = (1,1,1,1)

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Opaque" }
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Opaque" }
 ZWrite Off
  GpuProgramID 29134
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_2.y = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_2.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD1.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump float _ShadowOffset;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _Alpha;
uniform 	mediump float _MatCap_Gloss_Intensity;
uniform 	mediump float _MatCap_Ref_Intensity;
uniform 	mediump float _MatCapOffsetX;
uniform 	mediump float _MatCapOffsetY;
uniform 	mediump float _MatCapOffsetX2;
uniform 	mediump float _MatCapOffsetY2;
uniform 	mediump vec4 _MainDissolveEdgeColor;
uniform 	mediump float _MainDissolveEdgeRange;
uniform 	mediump float _MainDissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _DissolveOffset;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(3) uniform mediump sampler2D _MatCap_Ref;
UNITY_LOCATION(4) uniform mediump sampler2D _Crystal_CustomColorMask;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat0.y = vs_TEXCOORD0.y + _ShadowOffset;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_0.x = texture(_ShadowTex, u_xlat0.xy).x;
    u_xlat16_1 = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1 = u_xlat16_0.x * u_xlat16_1 + 0.0125228781;
    u_xlat16_8.x = u_xlat16_0.x * u_xlat16_1;
    u_xlat16_15.xy = vs_TEXCOORD1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_7.xyz = texture(_MatCap_Ref, u_xlat16_15.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(vec3(_MatCap_Ref_Intensity, _MatCap_Ref_Intensity, _MatCap_Ref_Intensity));
    u_xlat16_23 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3.xy = vs_COLOR0.ww * (-vec2(_MatCapOffsetX2, _MatCapOffsetY2)) + vec2(_MatCapOffsetX2, _MatCapOffsetY2);
    u_xlat16_4.x = u_xlat16_3.x + _MatCapOffsetX;
    u_xlat16_4.y = u_xlat16_3.y + _MatCapOffsetY;
    u_xlat16_15.xy = u_xlat16_15.xy + u_xlat16_4.xy;
    u_xlat16_7.xyz = texture(_MatCap, u_xlat16_15.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity));
    u_xlat16_15.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1 = (-u_xlat16_0.x) * u_xlat16_1 + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_1) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_2.xyz) * vec3(u_xlat16_1) + _ShadowColor.xyz;
    u_xlat16_2.xyz = u_xlat16_8.xxx * u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity)) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_15.x + u_xlat16_23;
    u_xlat16_15.x = (-u_xlat16_1) + _ShadowColor.w;
    u_xlat16_1 = u_xlat16_8.x * u_xlat16_15.x + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_1 * _Alpha;
    u_xlat16_1 = vs_TEXCOORD0.w + _Cutoff;
    u_xlat16_1 = u_xlat16_1 * 2.0 + _DissolveOffset;
    u_xlat16_1 = u_xlat16_1 * _MainDissolveEdgeShrink;
    u_xlat16_8.x = dot(vec2(u_xlat16_1), vec2(_MainDissolveEdgeRange));
    u_xlat16_8.x = u_xlat16_8.x + (-_MainDissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.xyz = u_xlat16_8.xxx * _MainDissolveEdgeColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_1) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_1 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_1 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_3.xyz + u_xlat16_2.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_8.xyz = u_xlat16_0.zzz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    }
    u_xlat0.xyz = u_xlat16_8.zxy * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat21 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat21 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat21);
    u_xlat7.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_2.y = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_2.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD1.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump float _ShadowOffset;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _Alpha;
uniform 	mediump float _MatCap_Gloss_Intensity;
uniform 	mediump float _MatCap_Ref_Intensity;
uniform 	mediump float _MatCapOffsetX;
uniform 	mediump float _MatCapOffsetY;
uniform 	mediump float _MatCapOffsetX2;
uniform 	mediump float _MatCapOffsetY2;
uniform 	mediump vec4 _MainDissolveEdgeColor;
uniform 	mediump float _MainDissolveEdgeRange;
uniform 	mediump float _MainDissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _DissolveOffset;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(3) uniform mediump sampler2D _MatCap_Ref;
UNITY_LOCATION(4) uniform mediump sampler2D _Crystal_CustomColorMask;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat0.y = vs_TEXCOORD0.y + _ShadowOffset;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_0.x = texture(_ShadowTex, u_xlat0.xy).x;
    u_xlat16_1 = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1 = u_xlat16_0.x * u_xlat16_1 + 0.0125228781;
    u_xlat16_8.x = u_xlat16_0.x * u_xlat16_1;
    u_xlat16_15.xy = vs_TEXCOORD1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_7.xyz = texture(_MatCap_Ref, u_xlat16_15.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(vec3(_MatCap_Ref_Intensity, _MatCap_Ref_Intensity, _MatCap_Ref_Intensity));
    u_xlat16_23 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3.xy = vs_COLOR0.ww * (-vec2(_MatCapOffsetX2, _MatCapOffsetY2)) + vec2(_MatCapOffsetX2, _MatCapOffsetY2);
    u_xlat16_4.x = u_xlat16_3.x + _MatCapOffsetX;
    u_xlat16_4.y = u_xlat16_3.y + _MatCapOffsetY;
    u_xlat16_15.xy = u_xlat16_15.xy + u_xlat16_4.xy;
    u_xlat16_7.xyz = texture(_MatCap, u_xlat16_15.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity));
    u_xlat16_15.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1 = (-u_xlat16_0.x) * u_xlat16_1 + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_1) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_2.xyz) * vec3(u_xlat16_1) + _ShadowColor.xyz;
    u_xlat16_2.xyz = u_xlat16_8.xxx * u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity)) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_15.x + u_xlat16_23;
    u_xlat16_15.x = (-u_xlat16_1) + _ShadowColor.w;
    u_xlat16_1 = u_xlat16_8.x * u_xlat16_15.x + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_1 * _Alpha;
    u_xlat16_1 = vs_TEXCOORD0.w + _Cutoff;
    u_xlat16_1 = u_xlat16_1 * 2.0 + _DissolveOffset;
    u_xlat16_1 = u_xlat16_1 * _MainDissolveEdgeShrink;
    u_xlat16_8.x = dot(vec2(u_xlat16_1), vec2(_MainDissolveEdgeRange));
    u_xlat16_8.x = u_xlat16_8.x + (-_MainDissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.xyz = u_xlat16_8.xxx * _MainDissolveEdgeColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_1) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_1 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_1 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_3.xyz + u_xlat16_2.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_8.xyz = u_xlat16_0.zzz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    }
    u_xlat0.xyz = u_xlat16_8.zxy * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat21 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat21 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat21);
    u_xlat7.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_INVERT_DISSOLVE_DIR" }
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_2.y = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_2.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD1.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump float _ShadowOffset;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _Alpha;
uniform 	mediump float _MatCap_Gloss_Intensity;
uniform 	mediump float _MatCap_Ref_Intensity;
uniform 	mediump float _MatCapOffsetX;
uniform 	mediump float _MatCapOffsetY;
uniform 	mediump float _MatCapOffsetX2;
uniform 	mediump float _MatCapOffsetY2;
uniform 	mediump vec4 _MainDissolveEdgeColor;
uniform 	mediump float _MainDissolveEdgeRange;
uniform 	mediump float _MainDissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _DissolveOffset;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(3) uniform mediump sampler2D _MatCap_Ref;
UNITY_LOCATION(4) uniform mediump sampler2D _Crystal_CustomColorMask;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat0.y = vs_TEXCOORD0.y + _ShadowOffset;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_0.x = texture(_ShadowTex, u_xlat0.xy).x;
    u_xlat16_1 = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1 = u_xlat16_0.x * u_xlat16_1 + 0.0125228781;
    u_xlat16_8.x = u_xlat16_0.x * u_xlat16_1;
    u_xlat16_15.xy = vs_TEXCOORD1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_7.xyz = texture(_MatCap_Ref, u_xlat16_15.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(vec3(_MatCap_Ref_Intensity, _MatCap_Ref_Intensity, _MatCap_Ref_Intensity));
    u_xlat16_23 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3.xy = vs_COLOR0.ww * (-vec2(_MatCapOffsetX2, _MatCapOffsetY2)) + vec2(_MatCapOffsetX2, _MatCapOffsetY2);
    u_xlat16_4.x = u_xlat16_3.x + _MatCapOffsetX;
    u_xlat16_4.y = u_xlat16_3.y + _MatCapOffsetY;
    u_xlat16_15.xy = u_xlat16_15.xy + u_xlat16_4.xy;
    u_xlat16_7.xyz = texture(_MatCap, u_xlat16_15.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity));
    u_xlat16_15.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1 = (-u_xlat16_0.x) * u_xlat16_1 + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_1) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_2.xyz) * vec3(u_xlat16_1) + _ShadowColor.xyz;
    u_xlat16_2.xyz = u_xlat16_8.xxx * u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity)) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_15.x + u_xlat16_23;
    u_xlat16_15.x = (-u_xlat16_1) + _ShadowColor.w;
    u_xlat16_1 = u_xlat16_8.x * u_xlat16_15.x + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_1 * _Alpha;
    u_xlat16_1 = (-vs_TEXCOORD0.w) + (-_Cutoff);
    u_xlat16_1 = u_xlat16_1 * 2.0 + _DissolveOffset;
    u_xlat16_1 = u_xlat16_1 * _MainDissolveEdgeShrink;
    u_xlat16_8.x = dot(vec2(u_xlat16_1), vec2(_MainDissolveEdgeRange));
    u_xlat16_8.x = u_xlat16_8.x + (-_MainDissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.xyz = u_xlat16_8.xxx * _MainDissolveEdgeColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_1) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_1 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_1 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_3.xyz + u_xlat16_2.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_8.xyz = u_xlat16_0.zzz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    }
    u_xlat0.xyz = u_xlat16_8.zxy * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat21 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat21 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat21);
    u_xlat7.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_INVERT_DISSOLVE_DIR" }
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_2.y = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_2.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD1.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_COLOR0 = in_COLOR0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump float _ShadowOffset;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _Alpha;
uniform 	mediump float _MatCap_Gloss_Intensity;
uniform 	mediump float _MatCap_Ref_Intensity;
uniform 	mediump float _MatCapOffsetX;
uniform 	mediump float _MatCapOffsetY;
uniform 	mediump float _MatCapOffsetX2;
uniform 	mediump float _MatCapOffsetY2;
uniform 	mediump vec4 _MainDissolveEdgeColor;
uniform 	mediump float _MainDissolveEdgeRange;
uniform 	mediump float _MainDissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _DissolveOffset;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(3) uniform mediump sampler2D _MatCap_Ref;
UNITY_LOCATION(4) uniform mediump sampler2D _Crystal_CustomColorMask;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat0.y = vs_TEXCOORD0.y + _ShadowOffset;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_0.x = texture(_ShadowTex, u_xlat0.xy).x;
    u_xlat16_1 = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1 = u_xlat16_0.x * u_xlat16_1 + 0.0125228781;
    u_xlat16_8.x = u_xlat16_0.x * u_xlat16_1;
    u_xlat16_15.xy = vs_TEXCOORD1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_7.xyz = texture(_MatCap_Ref, u_xlat16_15.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(vec3(_MatCap_Ref_Intensity, _MatCap_Ref_Intensity, _MatCap_Ref_Intensity));
    u_xlat16_23 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3.xy = vs_COLOR0.ww * (-vec2(_MatCapOffsetX2, _MatCapOffsetY2)) + vec2(_MatCapOffsetX2, _MatCapOffsetY2);
    u_xlat16_4.x = u_xlat16_3.x + _MatCapOffsetX;
    u_xlat16_4.y = u_xlat16_3.y + _MatCapOffsetY;
    u_xlat16_15.xy = u_xlat16_15.xy + u_xlat16_4.xy;
    u_xlat16_7.xyz = texture(_MatCap, u_xlat16_15.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity));
    u_xlat16_15.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1 = (-u_xlat16_0.x) * u_xlat16_1 + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_1) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_2.xyz) * vec3(u_xlat16_1) + _ShadowColor.xyz;
    u_xlat16_2.xyz = u_xlat16_8.xxx * u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity)) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_15.x + u_xlat16_23;
    u_xlat16_15.x = (-u_xlat16_1) + _ShadowColor.w;
    u_xlat16_1 = u_xlat16_8.x * u_xlat16_15.x + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_1 * _Alpha;
    u_xlat16_1 = (-vs_TEXCOORD0.w) + (-_Cutoff);
    u_xlat16_1 = u_xlat16_1 * 2.0 + _DissolveOffset;
    u_xlat16_1 = u_xlat16_1 * _MainDissolveEdgeShrink;
    u_xlat16_8.x = dot(vec2(u_xlat16_1), vec2(_MainDissolveEdgeRange));
    u_xlat16_8.x = u_xlat16_8.x + (-_MainDissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.xyz = u_xlat16_8.xxx * _MainDissolveEdgeColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_1) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_1 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_1 = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_8.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_3.xyz + u_xlat16_2.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_8.xyz = u_xlat16_0.zzz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    }
    u_xlat0.xyz = u_xlat16_8.zxy * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat21 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat21 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat21);
    u_xlat7.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_2.y = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_2.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD1.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump float _ShadowOffset;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _Alpha;
uniform 	mediump float _MatCap_Gloss_Intensity;
uniform 	mediump float _MatCap_Ref_Intensity;
uniform 	mediump float _MatCapOffsetX;
uniform 	mediump float _MatCapOffsetY;
uniform 	mediump float _MatCapOffsetX2;
uniform 	mediump float _MatCapOffsetY2;
uniform 	mediump vec4 _MainDissolveEdgeColor;
uniform 	mediump float _MainDissolveEdgeRange;
uniform 	mediump float _MainDissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _DissolveOffset;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap_Ref;
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec2 u_xlat16_11;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat0.y = vs_TEXCOORD0.y + _ShadowOffset;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_0.x = texture(_ShadowTex, u_xlat0.xy).x;
    u_xlat16_1 = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1 = u_xlat16_0.x * u_xlat16_1 + 0.0125228781;
    u_xlat16_6.x = u_xlat16_0.x * u_xlat16_1;
    u_xlat16_11.xy = vs_TEXCOORD1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_5.xyz = texture(_MatCap_Ref, u_xlat16_11.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(vec3(_MatCap_Ref_Intensity, _MatCap_Ref_Intensity, _MatCap_Ref_Intensity));
    u_xlat16_17 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3.xy = vs_COLOR0.ww * (-vec2(_MatCapOffsetX2, _MatCapOffsetY2)) + vec2(_MatCapOffsetX2, _MatCapOffsetY2);
    u_xlat16_4.x = u_xlat16_3.x + _MatCapOffsetX;
    u_xlat16_4.y = u_xlat16_3.y + _MatCapOffsetY;
    u_xlat16_11.xy = u_xlat16_11.xy + u_xlat16_4.xy;
    u_xlat16_5.xyz = texture(_MatCap, u_xlat16_11.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity));
    u_xlat16_11.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1 = (-u_xlat16_0.x) * u_xlat16_1 + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_1) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_2.xyz) * vec3(u_xlat16_1) + _ShadowColor.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xxx * u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity)) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_11.x + u_xlat16_17;
    u_xlat16_11.x = (-u_xlat16_1) + _ShadowColor.w;
    u_xlat16_1 = u_xlat16_6.x * u_xlat16_11.x + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_1 * _Alpha;
    u_xlat16_1 = vs_TEXCOORD0.w + _Cutoff;
    u_xlat16_1 = u_xlat16_1 * 2.0 + _DissolveOffset;
    u_xlat16_1 = u_xlat16_1 * _MainDissolveEdgeShrink;
    u_xlat16_6.x = dot(vec2(u_xlat16_1), vec2(_MainDissolveEdgeRange));
    u_xlat16_6.x = u_xlat16_6.x + (-_MainDissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _MainDissolveEdgeColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_1) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_1 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_1 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_6.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_6.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_3.xyz + u_xlat16_2.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_6.xyz;
    }
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_2.y = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_2.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD1.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump float _ShadowOffset;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _Alpha;
uniform 	mediump float _MatCap_Gloss_Intensity;
uniform 	mediump float _MatCap_Ref_Intensity;
uniform 	mediump float _MatCapOffsetX;
uniform 	mediump float _MatCapOffsetY;
uniform 	mediump float _MatCapOffsetX2;
uniform 	mediump float _MatCapOffsetY2;
uniform 	mediump vec4 _MainDissolveEdgeColor;
uniform 	mediump float _MainDissolveEdgeRange;
uniform 	mediump float _MainDissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _DissolveOffset;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap_Ref;
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec2 u_xlat16_11;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat0.y = vs_TEXCOORD0.y + _ShadowOffset;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_0.x = texture(_ShadowTex, u_xlat0.xy).x;
    u_xlat16_1 = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1 = u_xlat16_0.x * u_xlat16_1 + 0.0125228781;
    u_xlat16_6.x = u_xlat16_0.x * u_xlat16_1;
    u_xlat16_11.xy = vs_TEXCOORD1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_5.xyz = texture(_MatCap_Ref, u_xlat16_11.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(vec3(_MatCap_Ref_Intensity, _MatCap_Ref_Intensity, _MatCap_Ref_Intensity));
    u_xlat16_17 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3.xy = vs_COLOR0.ww * (-vec2(_MatCapOffsetX2, _MatCapOffsetY2)) + vec2(_MatCapOffsetX2, _MatCapOffsetY2);
    u_xlat16_4.x = u_xlat16_3.x + _MatCapOffsetX;
    u_xlat16_4.y = u_xlat16_3.y + _MatCapOffsetY;
    u_xlat16_11.xy = u_xlat16_11.xy + u_xlat16_4.xy;
    u_xlat16_5.xyz = texture(_MatCap, u_xlat16_11.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity));
    u_xlat16_11.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1 = (-u_xlat16_0.x) * u_xlat16_1 + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_1) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_2.xyz) * vec3(u_xlat16_1) + _ShadowColor.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xxx * u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity)) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_11.x + u_xlat16_17;
    u_xlat16_11.x = (-u_xlat16_1) + _ShadowColor.w;
    u_xlat16_1 = u_xlat16_6.x * u_xlat16_11.x + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_1 * _Alpha;
    u_xlat16_1 = vs_TEXCOORD0.w + _Cutoff;
    u_xlat16_1 = u_xlat16_1 * 2.0 + _DissolveOffset;
    u_xlat16_1 = u_xlat16_1 * _MainDissolveEdgeShrink;
    u_xlat16_6.x = dot(vec2(u_xlat16_1), vec2(_MainDissolveEdgeRange));
    u_xlat16_6.x = u_xlat16_6.x + (-_MainDissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _MainDissolveEdgeColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_1) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_1 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_1 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_6.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_6.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_3.xyz + u_xlat16_2.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_6.xyz;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_INVERT_DISSOLVE_DIR" }
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_2.y = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_2.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD1.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump float _ShadowOffset;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _Alpha;
uniform 	mediump float _MatCap_Gloss_Intensity;
uniform 	mediump float _MatCap_Ref_Intensity;
uniform 	mediump float _MatCapOffsetX;
uniform 	mediump float _MatCapOffsetY;
uniform 	mediump float _MatCapOffsetX2;
uniform 	mediump float _MatCapOffsetY2;
uniform 	mediump vec4 _MainDissolveEdgeColor;
uniform 	mediump float _MainDissolveEdgeRange;
uniform 	mediump float _MainDissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _DissolveOffset;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap_Ref;
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec2 u_xlat16_11;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat0.y = vs_TEXCOORD0.y + _ShadowOffset;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_0.x = texture(_ShadowTex, u_xlat0.xy).x;
    u_xlat16_1 = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1 = u_xlat16_0.x * u_xlat16_1 + 0.0125228781;
    u_xlat16_6.x = u_xlat16_0.x * u_xlat16_1;
    u_xlat16_11.xy = vs_TEXCOORD1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_5.xyz = texture(_MatCap_Ref, u_xlat16_11.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(vec3(_MatCap_Ref_Intensity, _MatCap_Ref_Intensity, _MatCap_Ref_Intensity));
    u_xlat16_17 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3.xy = vs_COLOR0.ww * (-vec2(_MatCapOffsetX2, _MatCapOffsetY2)) + vec2(_MatCapOffsetX2, _MatCapOffsetY2);
    u_xlat16_4.x = u_xlat16_3.x + _MatCapOffsetX;
    u_xlat16_4.y = u_xlat16_3.y + _MatCapOffsetY;
    u_xlat16_11.xy = u_xlat16_11.xy + u_xlat16_4.xy;
    u_xlat16_5.xyz = texture(_MatCap, u_xlat16_11.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity));
    u_xlat16_11.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1 = (-u_xlat16_0.x) * u_xlat16_1 + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_1) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_2.xyz) * vec3(u_xlat16_1) + _ShadowColor.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xxx * u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity)) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_11.x + u_xlat16_17;
    u_xlat16_11.x = (-u_xlat16_1) + _ShadowColor.w;
    u_xlat16_1 = u_xlat16_6.x * u_xlat16_11.x + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_1 * _Alpha;
    u_xlat16_1 = (-vs_TEXCOORD0.w) + (-_Cutoff);
    u_xlat16_1 = u_xlat16_1 * 2.0 + _DissolveOffset;
    u_xlat16_1 = u_xlat16_1 * _MainDissolveEdgeShrink;
    u_xlat16_6.x = dot(vec2(u_xlat16_1), vec2(_MainDissolveEdgeRange));
    u_xlat16_6.x = u_xlat16_6.x + (-_MainDissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _MainDissolveEdgeColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_1) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_1 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_1 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_6.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_6.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_3.xyz + u_xlat16_2.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_6.xyz;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_INVERT_DISSOLVE_DIR" }
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_2.y = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_2.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD1.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump float _ShadowOffset;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _Alpha;
uniform 	mediump float _MatCap_Gloss_Intensity;
uniform 	mediump float _MatCap_Ref_Intensity;
uniform 	mediump float _MatCapOffsetX;
uniform 	mediump float _MatCapOffsetY;
uniform 	mediump float _MatCapOffsetX2;
uniform 	mediump float _MatCapOffsetY2;
uniform 	mediump vec4 _MainDissolveEdgeColor;
uniform 	mediump float _MainDissolveEdgeRange;
uniform 	mediump float _MainDissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _DissolveOffset;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap_Ref;
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec2 u_xlat16_11;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat0.y = vs_TEXCOORD0.y + _ShadowOffset;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_0.x = texture(_ShadowTex, u_xlat0.xy).x;
    u_xlat16_1 = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1 = u_xlat16_0.x * u_xlat16_1 + 0.0125228781;
    u_xlat16_6.x = u_xlat16_0.x * u_xlat16_1;
    u_xlat16_11.xy = vs_TEXCOORD1.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_5.xyz = texture(_MatCap_Ref, u_xlat16_11.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(vec3(_MatCap_Ref_Intensity, _MatCap_Ref_Intensity, _MatCap_Ref_Intensity));
    u_xlat16_17 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3.xy = vs_COLOR0.ww * (-vec2(_MatCapOffsetX2, _MatCapOffsetY2)) + vec2(_MatCapOffsetX2, _MatCapOffsetY2);
    u_xlat16_4.x = u_xlat16_3.x + _MatCapOffsetX;
    u_xlat16_4.y = u_xlat16_3.y + _MatCapOffsetY;
    u_xlat16_11.xy = u_xlat16_11.xy + u_xlat16_4.xy;
    u_xlat16_5.xyz = texture(_MatCap, u_xlat16_11.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity));
    u_xlat16_11.x = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1 = (-u_xlat16_0.x) * u_xlat16_1 + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_1) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_2.xyz) * vec3(u_xlat16_1) + _ShadowColor.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xxx * u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(vec3(_MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity, _MatCap_Gloss_Intensity)) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_11.x + u_xlat16_17;
    u_xlat16_11.x = (-u_xlat16_1) + _ShadowColor.w;
    u_xlat16_1 = u_xlat16_6.x * u_xlat16_11.x + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_1 * _Alpha;
    u_xlat16_1 = (-vs_TEXCOORD0.w) + (-_Cutoff);
    u_xlat16_1 = u_xlat16_1 * 2.0 + _DissolveOffset;
    u_xlat16_1 = u_xlat16_1 * _MainDissolveEdgeShrink;
    u_xlat16_6.x = dot(vec2(u_xlat16_1), vec2(_MainDissolveEdgeRange));
    u_xlat16_6.x = u_xlat16_6.x + (-_MainDissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _MainDissolveEdgeColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_1) + u_xlat16_2.xyz;
    u_xlat16_1 = u_xlat16_1 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_1 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_6.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_6.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_3.xyz + u_xlat16_2.xyz;
        u_xlat16_3.xyz = vec3(u_xlat16_1) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_6.xyz;
    }
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
SubProgram "gles hw_tier00 " {
Local Keywords { "_INVERT_DISSOLVE_DIR" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_INVERT_DISSOLVE_DIR" }
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
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_INVERT_DISSOLVE_DIR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_INVERT_DISSOLVE_DIR" }
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_INVERT_DISSOLVE_DIR" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_INVERT_DISSOLVE_DIR" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_INVERT_DISSOLVE_DIR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_INVERT_DISSOLVE_DIR" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Eye_Cornea_DissolveGUI"
}