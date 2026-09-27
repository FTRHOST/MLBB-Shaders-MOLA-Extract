//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/FX_ParallaxGround" {
Properties {

[Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

_Diffuse ("Diffuse", 2D) = "white" { }

_NormalMap ("法线贴图", 2D) = "bump" { }

_Depth_Rough_AO ("R:深度图 G:粗糙度 B:AO", 2D) = "black" { }

_DepthOffset ("深度偏移", Range(0, 0.5)) = 0.10000000149011612

_Rough_Intensity ("粗糙度强度", Float) = 1.0

_AO_Intensity ("AO强度", Float) = 0.0

_LG_Mask ("流光遮罩", 2D) = "white" { }

_LG_Tex ("流光贴图", 2D) = "white" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Speed ("XY:流光流速", Vector) = (0,0,0,0)

[Space(10)] _DissolveTex ("溶解纹理", 2D) = "white" { }

_DissolveStep ("溶解阈值", Range(-1, 2)) = 0.0

_SoftSize ("溶解软硬", Range(0.01, 1)) = 0.0

[Header(OtherSettings__________________________________________________________________________________)] [Space(10)] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _MLZWrite ("ZWrite", Float) = 0.0

[Enum(On, 0,Off, 4)] _MLZTest ("总是最前", Float) = 4.0

_StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

}
SubShader {
 Tags { "QUEUE" = "Transparent" }
 Pass {
 Name "FORWARD"
  Tags { "QUEUE" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 63001
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD5.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Depth_Rough_AO_ST;
uniform 	mediump float _DepthOffset;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _AO_Intensity;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec2 _LG_Speed;
uniform 	mediump vec4 _LG_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Depth_Rough_AO;
UNITY_LOCATION(1) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump float u_xlat16_8;
mediump float u_xlat16_10;
mediump float u_xlat16_14;
mediump float u_xlat16_18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Depth_Rough_AO_ST.xy + _Depth_Rough_AO_ST.zw;
    u_xlat16_0.x = texture(_Depth_Rough_AO, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat16_2.x = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
    u_xlat16_2.y = dot(vs_TEXCOORD5.xyz, u_xlat7.xyz);
    u_xlat16_2.z = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
    u_xlat16_20 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat16_2.xy = u_xlat0.xx * u_xlat16_2.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_DepthOffset);
    u_xlat16_2.xy = u_xlat16_2.xy / u_xlat16_2.zz;
    u_xlat7.xy = u_xlat16_2.xy + vs_TEXCOORD0.xy;
    u_xlat16_3.xyz = texture(_NormalMap, u_xlat7.xy).xyz;
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.x = vs_TEXCOORD4.x;
    u_xlat16_4.y = vs_TEXCOORD5.x;
    u_xlat16_4.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_4.x = vs_TEXCOORD4.y;
    u_xlat16_4.y = vs_TEXCOORD5.y;
    u_xlat16_4.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_4.x = vs_TEXCOORD4.z;
    u_xlat16_4.y = vs_TEXCOORD5.z;
    u_xlat16_4.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat16_2.xyz = u_xlat6.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat16_20 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat16_2.x = dot(u_xlat16_2.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.100000001);
    u_xlat16_8 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xz = texture(_Depth_Rough_AO, u_xlat7.xy).yz;
    u_xlat16_14 = (-u_xlat16_0.x) * _Rough_Intensity + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_14;
    u_xlat16_10 = u_xlat16_8 * u_xlat16_4.x;
    u_xlat16_8 = u_xlat16_10 * u_xlat16_14 + (-u_xlat16_8);
    u_xlat16_2.y = u_xlat16_8 + 1.0;
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat16_2.z = u_xlat16_14 * u_xlat16_14 + 0.5;
    u_xlat16_2.xy = u_xlat16_2.zy * u_xlat16_2.xy;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.y;
    u_xlat16_2.x = u_xlat16_4.x / u_xlat16_2.x;
    u_xlat0.x = u_xlat16_2.x * 0.25 + -9.99999975e-06;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 20.0);
    u_xlat16_3.xyz = texture(_Diffuse, u_xlat7.xy).xyz;
    u_xlat0.xzw = u_xlat0.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xzw;
    u_xlat1.xw = _Time.yy * _LG_Speed.xy + u_xlat7.xy;
    u_xlat16_18 = texture(_LG_Mask, u_xlat7.xy).x;
    u_xlat1.xy = u_xlat1.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy).x;
    u_xlat16_2.x = u_xlat16_18 * u_xlat16_1;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _LG_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20) + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_2.x = (-_SoftSize) + _DissolveStep;
    u_xlat16_8 = u_xlat16_0.x + (-u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + _DissolveStep;
    u_xlat16_2.x = float(1.0) / u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_8;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_0.x = texture(_Diffuse, u_xlat0.xy).w;
    SV_Target0.w = u_xlat16_2.x * u_xlat16_0.x;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD5.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Depth_Rough_AO_ST;
uniform 	mediump float _DepthOffset;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _AO_Intensity;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec2 _LG_Speed;
uniform 	mediump vec4 _LG_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Depth_Rough_AO;
UNITY_LOCATION(1) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump float u_xlat16_8;
mediump float u_xlat16_10;
mediump float u_xlat16_14;
mediump float u_xlat16_18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Depth_Rough_AO_ST.xy + _Depth_Rough_AO_ST.zw;
    u_xlat16_0.x = texture(_Depth_Rough_AO, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat16_2.x = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
    u_xlat16_2.y = dot(vs_TEXCOORD5.xyz, u_xlat7.xyz);
    u_xlat16_2.z = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
    u_xlat16_20 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat16_2.xy = u_xlat0.xx * u_xlat16_2.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_DepthOffset);
    u_xlat16_2.xy = u_xlat16_2.xy / u_xlat16_2.zz;
    u_xlat7.xy = u_xlat16_2.xy + vs_TEXCOORD0.xy;
    u_xlat16_3.xyz = texture(_NormalMap, u_xlat7.xy).xyz;
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.x = vs_TEXCOORD4.x;
    u_xlat16_4.y = vs_TEXCOORD5.x;
    u_xlat16_4.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_4.x = vs_TEXCOORD4.y;
    u_xlat16_4.y = vs_TEXCOORD5.y;
    u_xlat16_4.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_4.x = vs_TEXCOORD4.z;
    u_xlat16_4.y = vs_TEXCOORD5.z;
    u_xlat16_4.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat16_2.xyz = u_xlat6.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat16_20 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat16_2.x = dot(u_xlat16_2.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.100000001);
    u_xlat16_8 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xz = texture(_Depth_Rough_AO, u_xlat7.xy).yz;
    u_xlat16_14 = (-u_xlat16_0.x) * _Rough_Intensity + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_14;
    u_xlat16_10 = u_xlat16_8 * u_xlat16_4.x;
    u_xlat16_8 = u_xlat16_10 * u_xlat16_14 + (-u_xlat16_8);
    u_xlat16_2.y = u_xlat16_8 + 1.0;
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat16_2.z = u_xlat16_14 * u_xlat16_14 + 0.5;
    u_xlat16_2.xy = u_xlat16_2.zy * u_xlat16_2.xy;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.y;
    u_xlat16_2.x = u_xlat16_4.x / u_xlat16_2.x;
    u_xlat0.x = u_xlat16_2.x * 0.25 + -9.99999975e-06;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 20.0);
    u_xlat16_3.xyz = texture(_Diffuse, u_xlat7.xy).xyz;
    u_xlat0.xzw = u_xlat0.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xzw;
    u_xlat1.xw = _Time.yy * _LG_Speed.xy + u_xlat7.xy;
    u_xlat16_18 = texture(_LG_Mask, u_xlat7.xy).x;
    u_xlat1.xy = u_xlat1.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy).x;
    u_xlat16_2.x = u_xlat16_18 * u_xlat16_1;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _LG_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20) + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_2.x = (-_SoftSize) + _DissolveStep;
    u_xlat16_8 = u_xlat16_0.x + (-u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + _DissolveStep;
    u_xlat16_2.x = float(1.0) / u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_8;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_0.x = texture(_Diffuse, u_xlat0.xy).w;
    SV_Target0.w = u_xlat16_2.x * u_xlat16_0.x;
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
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD5.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Depth_Rough_AO_ST;
uniform 	mediump float _DepthOffset;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _AO_Intensity;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec2 _LG_Speed;
uniform 	mediump vec4 _LG_Color;
uniform lowp sampler2D _Depth_Rough_AO;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump float u_xlat16_8;
mediump float u_xlat16_10;
mediump float u_xlat16_14;
lowp float u_xlat10_18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Depth_Rough_AO_ST.xy + _Depth_Rough_AO_ST.zw;
    u_xlat10_0.x = texture2D(_Depth_Rough_AO, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x * 2.0 + -1.0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat16_2.x = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
    u_xlat16_2.y = dot(vs_TEXCOORD5.xyz, u_xlat7.xyz);
    u_xlat16_2.z = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
    u_xlat16_20 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat16_2.xy = u_xlat0.xx * u_xlat16_2.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_DepthOffset);
    u_xlat16_2.xy = u_xlat16_2.xy / u_xlat16_2.zz;
    u_xlat7.xy = u_xlat16_2.xy + vs_TEXCOORD0.xy;
    u_xlat10_3.xyz = texture2D(_NormalMap, u_xlat7.xy).xyz;
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.x = vs_TEXCOORD4.x;
    u_xlat16_4.y = vs_TEXCOORD5.x;
    u_xlat16_4.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_4.x = vs_TEXCOORD4.y;
    u_xlat16_4.y = vs_TEXCOORD5.y;
    u_xlat16_4.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_4.x = vs_TEXCOORD4.z;
    u_xlat16_4.y = vs_TEXCOORD5.z;
    u_xlat16_4.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat16_2.xyz = u_xlat6.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat16_20 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat16_2.x = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.100000001);
    u_xlat16_8 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xz = texture2D(_Depth_Rough_AO, u_xlat7.xy).yz;
    u_xlat16_14 = (-u_xlat10_0.x) * _Rough_Intensity + 1.0;
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AO_Intensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_14;
    u_xlat16_10 = u_xlat16_8 * u_xlat16_4.x;
    u_xlat16_8 = u_xlat16_10 * u_xlat16_14 + (-u_xlat16_8);
    u_xlat16_2.y = u_xlat16_8 + 1.0;
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat16_2.z = u_xlat16_14 * u_xlat16_14 + 0.5;
    u_xlat16_2.xy = u_xlat16_2.zy * u_xlat16_2.xy;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.y;
    u_xlat16_2.x = u_xlat16_4.x / u_xlat16_2.x;
    u_xlat0.x = u_xlat16_2.x * 0.25 + -9.99999975e-06;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 20.0);
    u_xlat10_3.xyz = texture2D(_Diffuse, u_xlat7.xy).xyz;
    u_xlat0.xzw = u_xlat0.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xzw;
    u_xlat1.xw = _Time.yy * _LG_Speed.xy + u_xlat7.xy;
    u_xlat10_18 = texture2D(_LG_Mask, u_xlat7.xy).x;
    u_xlat1.xy = u_xlat1.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy).x;
    u_xlat16_2.x = u_xlat10_18 * u_xlat10_1;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _LG_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20) + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_2.x = (-_SoftSize) + _DissolveStep;
    u_xlat16_8 = u_xlat10_0.x + (-u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + _DissolveStep;
    u_xlat16_2.x = float(1.0) / u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_8;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_8 = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_8;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_0.x = texture2D(_Diffuse, u_xlat0.xy).w;
    SV_Target0.w = u_xlat16_2.x * u_xlat10_0.x;
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
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD5.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Depth_Rough_AO_ST;
uniform 	mediump float _DepthOffset;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _AO_Intensity;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec2 _LG_Speed;
uniform 	mediump vec4 _LG_Color;
uniform lowp sampler2D _Depth_Rough_AO;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump float u_xlat16_8;
mediump float u_xlat16_10;
mediump float u_xlat16_14;
lowp float u_xlat10_18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Depth_Rough_AO_ST.xy + _Depth_Rough_AO_ST.zw;
    u_xlat10_0.x = texture2D(_Depth_Rough_AO, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x * 2.0 + -1.0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat16_2.x = dot(vs_TEXCOORD4.xyz, u_xlat7.xyz);
    u_xlat16_2.y = dot(vs_TEXCOORD5.xyz, u_xlat7.xyz);
    u_xlat16_2.z = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
    u_xlat16_20 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat16_2.xy = u_xlat0.xx * u_xlat16_2.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_DepthOffset);
    u_xlat16_2.xy = u_xlat16_2.xy / u_xlat16_2.zz;
    u_xlat7.xy = u_xlat16_2.xy + vs_TEXCOORD0.xy;
    u_xlat10_3.xyz = texture2D(_NormalMap, u_xlat7.xy).xyz;
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.x = vs_TEXCOORD4.x;
    u_xlat16_4.y = vs_TEXCOORD5.x;
    u_xlat16_4.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_4.x = vs_TEXCOORD4.y;
    u_xlat16_4.y = vs_TEXCOORD5.y;
    u_xlat16_4.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_4.x = vs_TEXCOORD4.z;
    u_xlat16_4.y = vs_TEXCOORD5.z;
    u_xlat16_4.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat16_2.xyz = u_xlat6.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat16_20 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat16_2.x = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.100000001);
    u_xlat16_8 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xz = texture2D(_Depth_Rough_AO, u_xlat7.xy).yz;
    u_xlat16_14 = (-u_xlat10_0.x) * _Rough_Intensity + 1.0;
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AO_Intensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_14;
    u_xlat16_10 = u_xlat16_8 * u_xlat16_4.x;
    u_xlat16_8 = u_xlat16_10 * u_xlat16_14 + (-u_xlat16_8);
    u_xlat16_2.y = u_xlat16_8 + 1.0;
    u_xlat16_4.x = u_xlat16_14 * u_xlat16_4.x;
    u_xlat16_2.z = u_xlat16_14 * u_xlat16_14 + 0.5;
    u_xlat16_2.xy = u_xlat16_2.zy * u_xlat16_2.xy;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.y;
    u_xlat16_2.x = u_xlat16_4.x / u_xlat16_2.x;
    u_xlat0.x = u_xlat16_2.x * 0.25 + -9.99999975e-06;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 20.0);
    u_xlat10_3.xyz = texture2D(_Diffuse, u_xlat7.xy).xyz;
    u_xlat0.xzw = u_xlat0.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xzw;
    u_xlat1.xw = _Time.yy * _LG_Speed.xy + u_xlat7.xy;
    u_xlat10_18 = texture2D(_LG_Mask, u_xlat7.xy).x;
    u_xlat1.xy = u_xlat1.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy).x;
    u_xlat16_2.x = u_xlat10_18 * u_xlat10_1;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _LG_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20) + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_2.x = (-_SoftSize) + _DissolveStep;
    u_xlat16_8 = u_xlat10_0.x + (-u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + _DissolveStep;
    u_xlat16_2.x = float(1.0) / u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_8;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_8 = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_8;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_0.x = texture2D(_Diffuse, u_xlat0.xy).w;
    SV_Target0.w = u_xlat16_2.x * u_xlat10_0.x;
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