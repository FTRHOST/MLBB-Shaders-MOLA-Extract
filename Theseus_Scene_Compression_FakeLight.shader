//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Scene/Compression_FakeLight" {
Properties {

_cull ("剔除模式", Float) = 2.0

_renderingMode ("渲染模式", Float) = 0.0

_zwrite ("__zw", Float) = 1.0

_srcblend ("源混合", Float) = 1.0

_dstblend ("目标混合", Float) = 0.0

_srcblendalpha ("源透明", Float) = 1.0

_dstblendalpha ("目标混合", Float) = 0.0

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_isCompressed ("_IsCompressed", Float) = 1.0

_MainTex ("MainTex", 2D) = "white" { }

_MainColor ("颜色", Color) = (1,1,1,1)

_HDR_Intensity ("HDR强度限制", Range(0, 3)) = 1.0

_AlphaClip ("AlphaClip", Range(0, 1)) = 0.0

_LMisCompressed ("_IsCompressed", Float) = 0.0

_LightMap ("LightMap", 2D) = "white" { }

_LightMapColor ("颜色", Color) = (1,1,1,1)

_LG_ON ("开启流光", Float) = 0.0

_LGMask_UV ("流光遮罩UV", Float) = 0.0

_LG_UV ("流光纹理UV", Float) = 0.0

_LGMask ("流光遮罩(RGB色)", 2D) = "white" { }

_LGTex ("流光纹理", 2D) = "white" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Vector ("流光X:强度 YZ:流速", Vector) = (1,0,0,0)

_isReflectionCompressed ("_IsReflectionCompressed", Float) = 1.0

_CUBE_ON ("_CUBE_ON", Float) = 0.0

_normalMap ("法线贴图", 2D) = "bump" { }

_CuEm_Mask ("遮罩[R:反射遮罩 G:自发光 B:]", 2D) = "white" { }

_CubeMap ("Cubemap", Cube) = "" { }

_CuEm_Vector ("CuEm_Vector", Vector) = (0,0,0,0)

_Cube_Vector ("Cube_Vector", Vector) = (1,0,1,0)

_Matcap ("matcap", 2D) = "white" { }

_CubeColor ("反射颜色", Color) = (1,1,1,1)

_Reflection_HDR_Intensity ("反射HDR强度限制", Float) = 1.0

_FogColor ("雾效颜色", Color) = (1,1,1,0)

_FogVector ("FogVector", Vector) = (10,1,0,0)

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_fakeLightColor ("假点光颜色", Color) = (1,1,1,1)

_mainTexMaskRate ("受MainTex影响度", Range(0, 1)) = 0.5

_StencilRef ("StencilRef", Float) = 0.0

_StencilComp ("StencilComp", Float) = 8.0

}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 2643
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.zxy / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xyz = (-u_xlat16_2.xyz) + _FogColor.zxy;
    u_xlat15 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_5.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.zxy / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xyz = (-u_xlat16_2.xyz) + _FogColor.zxy;
    u_xlat15 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_5.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(5) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
float u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_13;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_29 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_29 = u_xlat16_29 + u_xlat16_29;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_29)) + (-u_xlat16_5.xyz);
    u_xlat16_29 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_5.xyz = vec3(u_xlat16_29) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb24 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_29 = (u_xlatb24) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_29 = u_xlat16_29 + 1.0;
    u_xlat16_29 = sqrt(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_29);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_2.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_10.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_13.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_13.xyz = u_xlat16_10.zxy * u_xlat16_13.xxx;
    u_xlat16_13.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _Cube_Vector.xxx;
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb24 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb24)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_24 = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_24 * _CuEm_Vector.x;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.zxy / u_xlat16_7.xyz;
    u_xlat16_29 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_29 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_24 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_29 = u_xlat16_24 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_29);
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.zxy + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) * u_xlat24 + 1.0;
    u_xlat24 = sqrt(u_xlat24);
    u_xlat24 = u_xlat24 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat24) + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb24 = _ShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb24)) ? u_xlat0.xyz : vs_TEXCOORD3.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat10 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat10 = (-u_xlat2.x) + u_xlat10;
    u_xlat0.z = _ShadowBias.y * u_xlat10 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_29 = (-_ShadowBias.w) + 1.0;
    u_xlat8.x = (-u_xlat16_29) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat8.x + u_xlat16_29;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat8.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) * u_xlat0.xyz + _FogColor.zxy;
    u_xlat24 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat1.x = u_xlat24 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_8.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(5) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
float u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_13;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_29 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_29 = u_xlat16_29 + u_xlat16_29;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_29)) + (-u_xlat16_5.xyz);
    u_xlat16_29 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_5.xyz = vec3(u_xlat16_29) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb24 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_29 = (u_xlatb24) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_29 = u_xlat16_29 + 1.0;
    u_xlat16_29 = sqrt(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_29);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_2.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_10.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_13.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_13.xyz = u_xlat16_10.zxy * u_xlat16_13.xxx;
    u_xlat16_13.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _Cube_Vector.xxx;
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb24 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb24)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_24 = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_24 * _CuEm_Vector.x;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.zxy / u_xlat16_7.xyz;
    u_xlat16_29 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_29 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_24 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_29 = u_xlat16_24 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_29);
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.zxy + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) * u_xlat24 + 1.0;
    u_xlat24 = sqrt(u_xlat24);
    u_xlat24 = u_xlat24 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat24) + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb24 = _ShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb24)) ? u_xlat0.xyz : vs_TEXCOORD3.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat10 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat10 = (-u_xlat2.x) + u_xlat10;
    u_xlat0.z = _ShadowBias.y * u_xlat10 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_29 = (-_ShadowBias.w) + 1.0;
    u_xlat8.x = (-u_xlat16_29) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat8.x + u_xlat16_29;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat8.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) * u_xlat0.xyz + _FogColor.zxy;
    u_xlat24 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat1.x = u_xlat24 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_8.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(6) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
float u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_14;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat27 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_32 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_32)) + (-u_xlat16_5.xyz);
    u_xlat16_32 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb27 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_32 = (u_xlatb27) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_32 = u_xlat16_32 + 1.0;
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat16_32 = u_xlat16_32 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_32);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_2.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_11.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_14.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_14.xyz = u_xlat16_11.zxy * u_xlat16_14.xxx;
    u_xlat16_14.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz;
    u_xlat16_14.xyz = log2(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * _Cube_Vector.xxx;
    u_xlat16_14.xyz = exp2(u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb27 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb27)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_27 = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_27 * _CuEm_Vector.x;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.zxy / u_xlat16_7.xyz;
    u_xlat16_32 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_32 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_27 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_32 = u_xlat16_27 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_32);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.zxy + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.5<_LMisCompressed);
#else
    u_xlatb27 = 0.5<_LMisCompressed;
#endif
    u_xlat16_2.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_2.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_2.zxy * u_xlat16_7.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_8.xyz = u_xlat16_2.zxy / u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = (bool(u_xlatb27)) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightMapColor.zxy;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat27 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat27 = (-u_xlat27) * u_xlat27 + 1.0;
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb27)) ? u_xlat0.xyz : vs_TEXCOORD3.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat11 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11 = (-u_xlat2.x) + u_xlat11;
    u_xlat0.z = _ShadowBias.y * u_xlat11 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_32 = (-_ShadowBias.w) + 1.0;
    u_xlat9.x = (-u_xlat16_32) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat16_32;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat9.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) * u_xlat0.xyz + _FogColor.zxy;
    u_xlat27 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat27 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat27);
    u_xlat1.x = u_xlat27 * 0.0625 + u_xlat1.y;
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_9.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_9.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(6) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
float u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_14;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat27 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_32 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_32)) + (-u_xlat16_5.xyz);
    u_xlat16_32 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb27 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_32 = (u_xlatb27) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_32 = u_xlat16_32 + 1.0;
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat16_32 = u_xlat16_32 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_32);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_2.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_11.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_14.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_14.xyz = u_xlat16_11.zxy * u_xlat16_14.xxx;
    u_xlat16_14.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz;
    u_xlat16_14.xyz = log2(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * _Cube_Vector.xxx;
    u_xlat16_14.xyz = exp2(u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb27 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb27)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_27 = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_27 * _CuEm_Vector.x;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.zxy / u_xlat16_7.xyz;
    u_xlat16_32 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_32 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_27 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_32 = u_xlat16_27 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_32);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.zxy + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.5<_LMisCompressed);
#else
    u_xlatb27 = 0.5<_LMisCompressed;
#endif
    u_xlat16_2.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_2.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_2.zxy * u_xlat16_7.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_8.xyz = u_xlat16_2.zxy / u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = (bool(u_xlatb27)) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightMapColor.zxy;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat27 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat27 = (-u_xlat27) * u_xlat27 + 1.0;
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb27)) ? u_xlat0.xyz : vs_TEXCOORD3.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat11 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11 = (-u_xlat2.x) + u_xlat11;
    u_xlat0.z = _ShadowBias.y * u_xlat11 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_32 = (-_ShadowBias.w) + 1.0;
    u_xlat9.x = (-u_xlat16_32) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat16_32;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat9.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) * u_xlat0.xyz + _FogColor.zxy;
    u_xlat27 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat27 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat27);
    u_xlat1.x = u_xlat27 * 0.0625 + u_xlat1.y;
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_9.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_9.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_21;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb19 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb19)) ? u_xlat1.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat7 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat7 = (-u_xlat1.x) + u_xlat7;
    u_xlat0.z = _ShadowBias.y * u_xlat7 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat6.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat6.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_3.xyz;
    u_xlat18 = max(_FakeLightPos.w, 0.00100000005);
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = sqrt(u_xlat19);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat2.x / u_xlat18;
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _FakeAttenVector.x;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat1.xyz = vec3(u_xlat18) * _FakeLightColor.zxy;
    u_xlat1.xyz = u_xlat1.xyz * _fakeLightColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_isCompressed);
#else
    u_xlatb18 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_2.zxy / u_xlat16_4.xyz;
    u_xlat16_21 = u_xlat16_2.w * _MainColor.w;
    SV_Target0.w = u_xlat16_21 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb18)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = _FakeLightColor.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_3.xyz) + _FogColor.zxy;
    u_xlat18 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat18 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat18);
    u_xlat1.x = u_xlat18 * 0.0625 + u_xlat1.y;
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_6.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat7;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_21;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb19 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb19)) ? u_xlat1.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat7 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat7 = (-u_xlat1.x) + u_xlat7;
    u_xlat0.z = _ShadowBias.y * u_xlat7 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat6.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat6.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_3.xyz;
    u_xlat18 = max(_FakeLightPos.w, 0.00100000005);
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = sqrt(u_xlat19);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat2.x / u_xlat18;
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _FakeAttenVector.x;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat1.xyz = vec3(u_xlat18) * _FakeLightColor.zxy;
    u_xlat1.xyz = u_xlat1.xyz * _fakeLightColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_isCompressed);
#else
    u_xlatb18 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_2.zxy / u_xlat16_4.xyz;
    u_xlat16_21 = u_xlat16_2.w * _MainColor.w;
    SV_Target0.w = u_xlat16_21 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb18)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = _FakeLightColor.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_3.xyz) + _FogColor.zxy;
    u_xlat18 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat18 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat18);
    u_xlat1.x = u_xlat18 * 0.0625 + u_xlat1.y;
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_6.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(6) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
float u_xlat12;
float u_xlat33;
mediump float u_xlat16_33;
bool u_xlatb33;
float u_xlat34;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat1.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat33 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat33 = max(u_xlat33, 1.17549435e-38);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat1.y = u_xlat4.x;
    u_xlat1.x = u_xlat3.z;
    u_xlat16_2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_5.xyz = texture(_normalMap, u_xlat16_2.xy).xyz;
    u_xlat16_2 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.x = dot(u_xlat16_6.xyz, u_xlat1.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat1.y = dot(u_xlat16_6.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat1.z = dot(u_xlat16_6.xyz, u_xlat4.xyz);
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = max(u_xlat33, 1.17549435e-38);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat0.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb33 = _ShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb33)) ? u_xlat0.xyz : vs_TEXCOORD3.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat3 = u_xlat0.yyyy * u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat0 = u_xlat4 * u_xlat0.zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat3;
    u_xlat0 = u_xlat0 + u_xlat3;
    u_xlat34 = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat34 = u_xlat0.z + (-u_xlat34);
    u_xlat3.x = max((-u_xlat0.w), u_xlat34);
    u_xlat3.x = (-u_xlat34) + u_xlat3.x;
    u_xlat0.z = _ShadowBias.y * u_xlat3.x + u_xlat34;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat11.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat11.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.zxy / u_xlat16_7.xyz;
    u_xlat16_39 = u_xlat16_2.w * _MainColor.w;
    SV_Target0.w = u_xlat16_39 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb3.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb3.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_33 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_39 = u_xlat16_33 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_39);
    u_xlat3.xzw = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39 = dot(u_xlat3.xzw, u_xlat3.xzw);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_8.xyz = u_xlat3.xzw * vec3(u_xlat16_39);
    u_xlat16_39 = dot((-u_xlat16_8.xyz), u_xlat1.xyz);
    u_xlat16_39 = u_xlat16_39 + u_xlat16_39;
    u_xlat16_8.xyz = u_xlat1.xyz * (-vec3(u_xlat16_39)) + (-u_xlat16_8.xyz);
    u_xlat16_39 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb33 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_39 = (u_xlatb33) ? (-u_xlat16_8.z) : u_xlat16_8.z;
    u_xlat16_39 = u_xlat16_39 + 1.0;
    u_xlat16_39 = sqrt(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * 2.82842708;
    u_xlat16_9.xy = u_xlat16_8.xy / vec2(u_xlat16_39);
    u_xlat16_9.xy = u_xlat16_9.xy * _Cube_Vector.zz;
    u_xlat16_9.xy = u_xlat16_9.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_3.xzw = texture(_Matcap, u_xlat16_9.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_3.wxz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_3.wxz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_3.wxz * u_xlat16_9.xyz;
    u_xlat16_10.xyz = (-u_xlat16_3.wxz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_10.xyz = u_xlat16_3.wxz / u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_9.xyz = (u_xlatb3.y) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_3.xyz = texture(_CubeMap, u_xlat16_8.xyz).xyz;
    u_xlat16_39 = u_xlat16_8.y * _Cube_Vector.y + 1.0;
    u_xlat16_39 = u_xlat16_39 + (-_Cube_Vector.y);
    u_xlat16_39 = u_xlat16_39 * 0.5 + 0.5;
    u_xlat16_40 = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_8.xyz = u_xlat16_3.zxy * vec3(u_xlat16_40);
    u_xlat16_8.xyz = u_xlat16_9.xyz * _CuEm_Vector.zzz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = log2(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _Cube_Vector.xxx;
    u_xlat16_8.xyz = exp2(u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb33 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_9.xy = (bool(u_xlatb33)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_33 = texture(_CuEm_Mask, u_xlat16_9.xy).x;
    u_xlat16_40 = u_xlat16_33 * _CuEm_Vector.x;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_40);
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * _CubeColor.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _MainColor.zxy + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = _FakeLightColor.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0.5<_LMisCompressed);
#else
    u_xlatb33 = 0.5<_LMisCompressed;
#endif
    u_xlat16_3.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_9.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_3.zxy * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_3.zxy * u_xlat16_9.xyz;
    u_xlat16_10.xyz = (-u_xlat16_3.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_10.xyz = u_xlat16_3.zxy / u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_9.xyz = (bool(u_xlatb33)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightMapColor.zxy;
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_10.xyz = u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat12 = max(_FakeLightPos.w, 0.00100000005);
    u_xlat33 = u_xlat33 / u_xlat12;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * _FakeAttenVector.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = u_xlat1.x * u_xlat33;
    u_xlat1.xyz = vec3(u_xlat33) * _FakeLightColor.zxy;
    u_xlat1.xyz = u_xlat1.xyz * _fakeLightColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_6.xyz) + _FogColor.zxy;
    u_xlat33 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat33 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat33);
    u_xlat1.x = u_xlat33 * 0.0625 + u_xlat1.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_11.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(6) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
float u_xlat12;
float u_xlat33;
mediump float u_xlat16_33;
bool u_xlatb33;
float u_xlat34;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat1.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat33 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat33 = max(u_xlat33, 1.17549435e-38);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat1.y = u_xlat4.x;
    u_xlat1.x = u_xlat3.z;
    u_xlat16_2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_5.xyz = texture(_normalMap, u_xlat16_2.xy).xyz;
    u_xlat16_2 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.x = dot(u_xlat16_6.xyz, u_xlat1.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat1.y = dot(u_xlat16_6.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat1.z = dot(u_xlat16_6.xyz, u_xlat4.xyz);
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = max(u_xlat33, 1.17549435e-38);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat0.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb33 = _ShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb33)) ? u_xlat0.xyz : vs_TEXCOORD3.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat3 = u_xlat0.yyyy * u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat0 = u_xlat4 * u_xlat0.zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat3;
    u_xlat0 = u_xlat0 + u_xlat3;
    u_xlat34 = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat34 = u_xlat0.z + (-u_xlat34);
    u_xlat3.x = max((-u_xlat0.w), u_xlat34);
    u_xlat3.x = (-u_xlat34) + u_xlat3.x;
    u_xlat0.z = _ShadowBias.y * u_xlat3.x + u_xlat34;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat11.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat11.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.zxy / u_xlat16_7.xyz;
    u_xlat16_39 = u_xlat16_2.w * _MainColor.w;
    SV_Target0.w = u_xlat16_39 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb3.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb3.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_33 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_39 = u_xlat16_33 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_39);
    u_xlat3.xzw = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39 = dot(u_xlat3.xzw, u_xlat3.xzw);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_8.xyz = u_xlat3.xzw * vec3(u_xlat16_39);
    u_xlat16_39 = dot((-u_xlat16_8.xyz), u_xlat1.xyz);
    u_xlat16_39 = u_xlat16_39 + u_xlat16_39;
    u_xlat16_8.xyz = u_xlat1.xyz * (-vec3(u_xlat16_39)) + (-u_xlat16_8.xyz);
    u_xlat16_39 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb33 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_39 = (u_xlatb33) ? (-u_xlat16_8.z) : u_xlat16_8.z;
    u_xlat16_39 = u_xlat16_39 + 1.0;
    u_xlat16_39 = sqrt(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * 2.82842708;
    u_xlat16_9.xy = u_xlat16_8.xy / vec2(u_xlat16_39);
    u_xlat16_9.xy = u_xlat16_9.xy * _Cube_Vector.zz;
    u_xlat16_9.xy = u_xlat16_9.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_3.xzw = texture(_Matcap, u_xlat16_9.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_3.wxz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_3.wxz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_3.wxz * u_xlat16_9.xyz;
    u_xlat16_10.xyz = (-u_xlat16_3.wxz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_10.xyz = u_xlat16_3.wxz / u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_9.xyz = (u_xlatb3.y) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_3.xyz = texture(_CubeMap, u_xlat16_8.xyz).xyz;
    u_xlat16_39 = u_xlat16_8.y * _Cube_Vector.y + 1.0;
    u_xlat16_39 = u_xlat16_39 + (-_Cube_Vector.y);
    u_xlat16_39 = u_xlat16_39 * 0.5 + 0.5;
    u_xlat16_40 = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_8.xyz = u_xlat16_3.zxy * vec3(u_xlat16_40);
    u_xlat16_8.xyz = u_xlat16_9.xyz * _CuEm_Vector.zzz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = log2(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _Cube_Vector.xxx;
    u_xlat16_8.xyz = exp2(u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb33 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_9.xy = (bool(u_xlatb33)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_33 = texture(_CuEm_Mask, u_xlat16_9.xy).x;
    u_xlat16_40 = u_xlat16_33 * _CuEm_Vector.x;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_40);
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * _CubeColor.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _MainColor.zxy + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = _FakeLightColor.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0.5<_LMisCompressed);
#else
    u_xlatb33 = 0.5<_LMisCompressed;
#endif
    u_xlat16_3.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_9.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_3.zxy * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_3.zxy * u_xlat16_9.xyz;
    u_xlat16_10.xyz = (-u_xlat16_3.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_10.xyz = u_xlat16_3.zxy / u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_9.xyz = (bool(u_xlatb33)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightMapColor.zxy;
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_10.xyz = u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat12 = max(_FakeLightPos.w, 0.00100000005);
    u_xlat33 = u_xlat33 / u_xlat12;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * _FakeAttenVector.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = u_xlat1.x * u_xlat33;
    u_xlat1.xyz = vec3(u_xlat33) * _FakeLightColor.zxy;
    u_xlat1.xyz = u_xlat1.xyz * _fakeLightColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_6.xyz) + _FogColor.zxy;
    u_xlat33 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat33 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat33);
    u_xlat1.x = u_xlat33 * 0.0625 + u_xlat1.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_11.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
float u_xlat12;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_AlphaClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat16_1.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_isCompressed);
#else
    u_xlatb2 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    u_xlat16_22 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_22 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = _FakeLightColor.www * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.x = max(_FakeLightPos.w, 0.00100000005);
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat12 = sqrt(u_xlat5.x);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat5.xxx;
    u_xlat9.x = dot(u_xlat9.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat12 / u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _FakeAttenVector.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat9.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat2.xxx * _FakeLightColor.zxy;
    u_xlat2.xyz = u_xlat2.xyz * _fakeLightColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb23 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb23)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat0 = u_xlat4 * u_xlat2.xxxx + u_xlat0;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat0 = u_xlat4 * u_xlat2.zzzz + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat9.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat9.x = (-u_xlat2.x) + u_xlat9.x;
    u_xlat0.z = _ShadowBias.y * u_xlat9.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat0.xyw + u_xlat5.xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat0.xyw + u_xlat5.xyz;
    vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat0.xyw + u_xlat5.xyz;
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_22 = (-_ShadowBias.w) + 1.0;
    u_xlat9.x = (-u_xlat16_22) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat9.x + u_xlat16_22;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat9.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat9.xyz + u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = (-u_xlat16_1.xyz) + _FogColor.zxy;
    u_xlat23 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat23 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat23);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat23 * 0.0625 + u_xlat0.y;
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_9.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat5.xyz + u_xlat16_9.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
float u_xlat12;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_AlphaClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat16_1.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_isCompressed);
#else
    u_xlatb2 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    u_xlat16_22 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_22 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = _FakeLightColor.www * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.x = max(_FakeLightPos.w, 0.00100000005);
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat12 = sqrt(u_xlat5.x);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat5.xxx;
    u_xlat9.x = dot(u_xlat9.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat12 / u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _FakeAttenVector.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat9.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat2.xxx * _FakeLightColor.zxy;
    u_xlat2.xyz = u_xlat2.xyz * _fakeLightColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb23 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb23)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat0 = u_xlat4 * u_xlat2.xxxx + u_xlat0;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat0 = u_xlat4 * u_xlat2.zzzz + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat9.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat9.x = (-u_xlat2.x) + u_xlat9.x;
    u_xlat0.z = _ShadowBias.y * u_xlat9.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat0.xyw + u_xlat5.xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat0.xyw + u_xlat5.xyz;
    vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat0.xyw + u_xlat5.xyz;
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_22 = (-_ShadowBias.w) + 1.0;
    u_xlat9.x = (-u_xlat16_22) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat9.x + u_xlat16_22;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat9.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat9.xyz + u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = (-u_xlat16_1.xyz) + _FogColor.zxy;
    u_xlat23 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat23 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat23);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat23 * 0.0625 + u_xlat0.y;
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_9.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat5.xyz + u_xlat16_9.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat6;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb16 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat1.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat6 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat6 = (-u_xlat1.x) + u_xlat6;
    u_xlat0.z = _ShadowBias.y * u_xlat6 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat5.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat5.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_isCompressed);
#else
    u_xlatb15 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.zxy / u_xlat16_4.xyz;
    u_xlat16_18 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_18 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb15)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat0.xyz = (-u_xlat16_3.xyz) * u_xlat0.xyz + _FogColor.zxy;
    u_xlat15 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat6;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb16 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat1.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat6 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat6 = (-u_xlat1.x) + u_xlat6;
    u_xlat0.z = _ShadowBias.y * u_xlat6 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat5.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat5.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_isCompressed);
#else
    u_xlatb15 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.zxy / u_xlat16_4.xyz;
    u_xlat16_18 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_18 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb15)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat0.xyz = (-u_xlat16_3.xyz) * u_xlat0.xyz + _FogColor.zxy;
    u_xlat15 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(3) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(4) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(5) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
mediump vec3 u_xlat16_13;
float u_xlat24;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_29 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_29 = u_xlat16_29 + u_xlat16_29;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_29)) + (-u_xlat16_5.xyz);
    u_xlat16_29 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_5.xyz = vec3(u_xlat16_29) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb0.x = _Cube_Vector.w==1.0;
#endif
    u_xlat16_29 = (u_xlatb0.x) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_29 = u_xlat16_29 + 1.0;
    u_xlat16_29 = sqrt(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_29);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_0.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_0.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb0.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_8.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_13.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_13.xyz = u_xlat16_8.zxy * u_xlat16_13.xxx;
    u_xlat16_13.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _Cube_Vector.xxx;
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb8 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb8)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_8.x = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_8.x * _CuEm_Vector.x;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.zxy / u_xlat16_7.xyz;
    u_xlat16_29 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_29 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb0.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_0.x = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_29 = u_xlat16_0.x * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_29);
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.zxy + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) + _FogColor.zxy;
    u_xlat24 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat1.x = u_xlat24 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_8.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(3) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(4) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(5) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
mediump vec3 u_xlat16_13;
float u_xlat24;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_29 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_29 = u_xlat16_29 + u_xlat16_29;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_29)) + (-u_xlat16_5.xyz);
    u_xlat16_29 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_5.xyz = vec3(u_xlat16_29) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb0.x = _Cube_Vector.w==1.0;
#endif
    u_xlat16_29 = (u_xlatb0.x) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_29 = u_xlat16_29 + 1.0;
    u_xlat16_29 = sqrt(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_29);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_0.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_0.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb0.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_8.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_13.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_13.xyz = u_xlat16_8.zxy * u_xlat16_13.xxx;
    u_xlat16_13.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _Cube_Vector.xxx;
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb8 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb8)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_8.x = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_8.x * _CuEm_Vector.x;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.zxy / u_xlat16_7.xyz;
    u_xlat16_29 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_29 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb0.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_0.x = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_29 = u_xlat16_0.x * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_29);
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.zxy + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) + _FogColor.zxy;
    u_xlat24 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat1.x = u_xlat24 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_8.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(4) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(6) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump vec3 u_xlat16_14;
float u_xlat27;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat27 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_32 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_32)) + (-u_xlat16_5.xyz);
    u_xlat16_32 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb0.x = _Cube_Vector.w==1.0;
#endif
    u_xlat16_32 = (u_xlatb0.x) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_32 = u_xlat16_32 + 1.0;
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat16_32 = u_xlat16_32 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_32);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_0.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_0.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb0.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_9.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_14.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_14.xyz = u_xlat16_9.zxy * u_xlat16_14.xxx;
    u_xlat16_14.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz;
    u_xlat16_14.xyz = log2(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * _Cube_Vector.xxx;
    u_xlat16_14.xyz = exp2(u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb9 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb9)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_9.x = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_9.x * _CuEm_Vector.x;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.zxy / u_xlat16_7.xyz;
    u_xlat16_32 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_32 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb0.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_0.x = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_32 = u_xlat16_0.x * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_32);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.zxy + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb0.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_9.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_9.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_9.zxy * u_xlat16_7.xyz;
    u_xlat16_8.xyz = (-u_xlat16_9.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_8.xyz = u_xlat16_9.zxy / u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = (u_xlatb0.x) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightMapColor.zxy;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) + _FogColor.zxy;
    u_xlat27 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat27 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat27);
    u_xlat1.x = u_xlat27 * 0.0625 + u_xlat1.y;
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_9.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_9.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(4) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(6) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump vec3 u_xlat16_14;
float u_xlat27;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat27 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_32 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_32)) + (-u_xlat16_5.xyz);
    u_xlat16_32 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb0.x = _Cube_Vector.w==1.0;
#endif
    u_xlat16_32 = (u_xlatb0.x) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_32 = u_xlat16_32 + 1.0;
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat16_32 = u_xlat16_32 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_32);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_0.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_0.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb0.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_9.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_14.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_14.xyz = u_xlat16_9.zxy * u_xlat16_14.xxx;
    u_xlat16_14.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz;
    u_xlat16_14.xyz = log2(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * _Cube_Vector.xxx;
    u_xlat16_14.xyz = exp2(u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb9 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb9)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_9.x = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_9.x * _CuEm_Vector.x;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.zxy / u_xlat16_7.xyz;
    u_xlat16_32 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_32 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb0.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_0.x = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_32 = u_xlat16_0.x * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_32);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.zxy + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb0.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_9.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_9.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_9.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_9.zxy * u_xlat16_7.xyz;
    u_xlat16_8.xyz = (-u_xlat16_9.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_8.xyz = u_xlat16_9.zxy / u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = (u_xlatb0.x) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightMapColor.zxy;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) + _FogColor.zxy;
    u_xlat27 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat27 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat27);
    u_xlat1.x = u_xlat27 * 0.0625 + u_xlat1.y;
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_9.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_9.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat6;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = max(_FakeLightPos.w, 0.00100000005);
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat6 = sqrt(u_xlat1.x);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
    u_xlat5.x = dot(u_xlat5.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat6 / u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FakeAttenVector.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _FakeLightColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _fakeLightColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_isCompressed);
#else
    u_xlatb15 = 0.5<_isCompressed;
#endif
    u_xlat16_2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.zxy / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb15)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = _FakeLightColor.www * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_2.xyz) + _FogColor.zxy;
    u_xlat15 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat6;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = max(_FakeLightPos.w, 0.00100000005);
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat6 = sqrt(u_xlat1.x);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx;
    u_xlat5.x = dot(u_xlat5.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat6 / u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FakeAttenVector.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _FakeLightColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _fakeLightColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_isCompressed);
#else
    u_xlatb15 = 0.5<_isCompressed;
#endif
    u_xlat16_2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.zxy / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb15)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = _FakeLightColor.www * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_2.xyz) + _FogColor.zxy;
    u_xlat15 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(4) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(6) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_15;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
float u_xlat32;
mediump float u_xlat16_35;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat30 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat30 = max(u_xlat30, 1.17549435e-38);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 1.17549435e-38);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_35 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_35 = u_xlat16_35 + u_xlat16_35;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_35)) + (-u_xlat16_5.xyz);
    u_xlat16_35 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_5.xyz = vec3(u_xlat16_35) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb30 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_35 = (u_xlatb30) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_35 = u_xlat16_35 + 1.0;
    u_xlat16_35 = sqrt(u_xlat16_35);
    u_xlat16_35 = u_xlat16_35 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_35);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_2.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_12.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_15.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_15.xyz = u_xlat16_12.zxy * u_xlat16_15.xxx;
    u_xlat16_15.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_15.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_6.xyz;
    u_xlat16_15.xyz = log2(u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_15.xyz * _Cube_Vector.xxx;
    u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb30 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb30)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_30 = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_30 * _CuEm_Vector.x;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.zxy / u_xlat16_7.xyz;
    u_xlat16_35 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_35 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_30 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_35 = u_xlat16_30 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_35);
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.zxy + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = _FakeLightColor.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5<_LMisCompressed);
#else
    u_xlatb30 = 0.5<_LMisCompressed;
#endif
    u_xlat16_2.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_8.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_2.zxy * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_2.zxy * u_xlat16_8.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_9.xyz = u_xlat16_2.zxy / u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_8.xyz = (bool(u_xlatb30)) ? u_xlat16_9.xyz : u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _LightMapColor.zxy;
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_9.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat32 = inversesqrt(u_xlat30);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat32) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10 = max(_FakeLightPos.w, 0.00100000005);
    u_xlat10 = u_xlat30 / u_xlat10;
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat10 = log2(u_xlat10);
    u_xlat10 = u_xlat10 * _FakeAttenVector.x;
    u_xlat10 = exp2(u_xlat10);
    u_xlat0.x = u_xlat0.x * u_xlat10;
    u_xlat0.xyz = u_xlat0.xxx * _FakeLightColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _fakeLightColor.zxy;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_5.xyz) + _FogColor.zxy;
    u_xlat30 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat30 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat30);
    u_xlat1.x = u_xlat30 * 0.0625 + u_xlat1.y;
    u_xlat16_10.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_10.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_10.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(4) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(6) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_15;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
float u_xlat32;
mediump float u_xlat16_35;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat30 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat30 = max(u_xlat30, 1.17549435e-38);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 1.17549435e-38);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_35 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_35 = u_xlat16_35 + u_xlat16_35;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_35)) + (-u_xlat16_5.xyz);
    u_xlat16_35 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_5.xyz = vec3(u_xlat16_35) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb30 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_35 = (u_xlatb30) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_35 = u_xlat16_35 + 1.0;
    u_xlat16_35 = sqrt(u_xlat16_35);
    u_xlat16_35 = u_xlat16_35 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_35);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_2.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_12.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_15.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_15.xyz = u_xlat16_12.zxy * u_xlat16_15.xxx;
    u_xlat16_15.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_15.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_6.xyz;
    u_xlat16_15.xyz = log2(u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_15.xyz * _Cube_Vector.xxx;
    u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb30 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb30)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_30 = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_30 * _CuEm_Vector.x;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.zxy / u_xlat16_7.xyz;
    u_xlat16_35 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_35 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_30 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_35 = u_xlat16_30 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_35);
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.zxy + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = _FakeLightColor.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5<_LMisCompressed);
#else
    u_xlatb30 = 0.5<_LMisCompressed;
#endif
    u_xlat16_2.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_8.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_2.zxy * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_2.zxy * u_xlat16_8.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_9.xyz = u_xlat16_2.zxy / u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_8.xyz = (bool(u_xlatb30)) ? u_xlat16_9.xyz : u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _LightMapColor.zxy;
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_9.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat32 = inversesqrt(u_xlat30);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat32) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10 = max(_FakeLightPos.w, 0.00100000005);
    u_xlat10 = u_xlat30 / u_xlat10;
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat10 = log2(u_xlat10);
    u_xlat10 = u_xlat10 * _FakeAttenVector.x;
    u_xlat10 = exp2(u_xlat10);
    u_xlat0.x = u_xlat0.x * u_xlat10;
    u_xlat0.xyz = u_xlat0.xxx * _FakeLightColor.zxy;
    u_xlat0.xyz = u_xlat0.xyz * _fakeLightColor.zxy;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_5.xyz) + _FogColor.zxy;
    u_xlat30 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat30 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat30);
    u_xlat1.x = u_xlat30 * 0.0625 + u_xlat1.y;
    u_xlat16_10.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_10.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_10.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
float u_xlat11;
mediump float u_xlat16_19;
float u_xlat20;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_AlphaClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat16_1.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_isCompressed);
#else
    u_xlatb2 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_19 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = _FakeLightColor.www * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.x = max(_FakeLightPos.w, 0.00100000005);
    u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat11 = sqrt(u_xlat5.x);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat5.xxx;
    u_xlat8.x = dot(u_xlat8.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat11 / u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _FakeAttenVector.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat8.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat2.xxx * _FakeLightColor.zxy;
    u_xlat2.xyz = u_xlat2.xyz * _fakeLightColor.zxy;
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = (-u_xlat16_1.xyz) + _FogColor.zxy;
    u_xlat20 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat20 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat20);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat20 * 0.0625 + u_xlat0.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_8.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat5.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
float u_xlat11;
mediump float u_xlat16_19;
float u_xlat20;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_AlphaClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat16_1.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_isCompressed);
#else
    u_xlatb2 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_19 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = _FakeLightColor.www * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.x = max(_FakeLightPos.w, 0.00100000005);
    u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat11 = sqrt(u_xlat5.x);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat5.xxx;
    u_xlat8.x = dot(u_xlat8.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat11 / u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _FakeAttenVector.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat8.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat2.xxx * _FakeLightColor.zxy;
    u_xlat2.xyz = u_xlat2.xyz * _fakeLightColor.zxy;
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = (-u_xlat16_1.xyz) + _FogColor.zxy;
    u_xlat20 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat20 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat20);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat20 * 0.0625 + u_xlat0.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_8.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat5.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.xyz / u_xlat16_3.xyz;
    u_xlat16_14 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_14 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xyz = (-u_xlat16_2.xyz) + _FogColor.xyz;
    u_xlat12 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.xyz / u_xlat16_3.xyz;
    u_xlat16_14 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_14 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xyz = (-u_xlat16_2.xyz) + _FogColor.xyz;
    u_xlat12 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(5) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
float u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_13;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_29 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_29 = u_xlat16_29 + u_xlat16_29;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_29)) + (-u_xlat16_5.xyz);
    u_xlat16_29 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_5.xyz = vec3(u_xlat16_29) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb24 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_29 = (u_xlatb24) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_29 = u_xlat16_29 + 1.0;
    u_xlat16_29 = sqrt(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_29);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_2.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_10.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_13.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xxx;
    u_xlat16_13.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _Cube_Vector.xxx;
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb24 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb24)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_24 = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_24 * _CuEm_Vector.x;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.xyz / u_xlat16_7.xyz;
    u_xlat16_29 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_29 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_24 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_29 = u_xlat16_24 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_29);
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.xyz + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) * u_xlat24 + 1.0;
    u_xlat24 = sqrt(u_xlat24);
    u_xlat24 = u_xlat24 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat24) + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb24 = _ShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb24)) ? u_xlat0.xyz : vs_TEXCOORD3.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat10 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat10 = (-u_xlat2.x) + u_xlat10;
    u_xlat0.z = _ShadowBias.y * u_xlat10 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_29 = (-_ShadowBias.w) + 1.0;
    u_xlat8.x = (-u_xlat16_29) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat8.x + u_xlat16_29;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat8.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) * u_xlat0.xyz + _FogColor.xyz;
    u_xlat24 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(5) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
float u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_13;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_29 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_29 = u_xlat16_29 + u_xlat16_29;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_29)) + (-u_xlat16_5.xyz);
    u_xlat16_29 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_5.xyz = vec3(u_xlat16_29) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb24 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_29 = (u_xlatb24) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_29 = u_xlat16_29 + 1.0;
    u_xlat16_29 = sqrt(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_29);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_2.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_10.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_13.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xxx;
    u_xlat16_13.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _Cube_Vector.xxx;
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb24 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb24)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_24 = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_24 * _CuEm_Vector.x;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.xyz / u_xlat16_7.xyz;
    u_xlat16_29 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_29 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_24 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_29 = u_xlat16_24 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_29);
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.xyz + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) * u_xlat24 + 1.0;
    u_xlat24 = sqrt(u_xlat24);
    u_xlat24 = u_xlat24 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat24) + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb24 = _ShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb24)) ? u_xlat0.xyz : vs_TEXCOORD3.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat10 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat10 = (-u_xlat2.x) + u_xlat10;
    u_xlat0.z = _ShadowBias.y * u_xlat10 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_29 = (-_ShadowBias.w) + 1.0;
    u_xlat8.x = (-u_xlat16_29) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat8.x + u_xlat16_29;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat8.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) * u_xlat0.xyz + _FogColor.xyz;
    u_xlat24 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(6) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
float u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_14;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat27 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_32 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_32)) + (-u_xlat16_5.xyz);
    u_xlat16_32 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb27 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_32 = (u_xlatb27) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_32 = u_xlat16_32 + 1.0;
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat16_32 = u_xlat16_32 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_32);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_2.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_11.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_14.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xxx;
    u_xlat16_14.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz;
    u_xlat16_14.xyz = log2(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * _Cube_Vector.xxx;
    u_xlat16_14.xyz = exp2(u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb27 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb27)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_27 = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_27 * _CuEm_Vector.x;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.xyz / u_xlat16_7.xyz;
    u_xlat16_32 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_32 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_27 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_32 = u_xlat16_27 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_32);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.5<_LMisCompressed);
#else
    u_xlatb27 = 0.5<_LMisCompressed;
#endif
    u_xlat16_2.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_8.xyz = u_xlat16_2.xyz / u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = (bool(u_xlatb27)) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightMapColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat27 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat27 = (-u_xlat27) * u_xlat27 + 1.0;
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb27)) ? u_xlat0.xyz : vs_TEXCOORD3.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat11 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11 = (-u_xlat2.x) + u_xlat11;
    u_xlat0.z = _ShadowBias.y * u_xlat11 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_32 = (-_ShadowBias.w) + 1.0;
    u_xlat9.x = (-u_xlat16_32) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat16_32;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat9.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) * u_xlat0.xyz + _FogColor.xyz;
    u_xlat27 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(6) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
float u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_14;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat27 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_32 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_32)) + (-u_xlat16_5.xyz);
    u_xlat16_32 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb27 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_32 = (u_xlatb27) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_32 = u_xlat16_32 + 1.0;
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat16_32 = u_xlat16_32 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_32);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_2.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_11.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_14.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_14.xyz = u_xlat16_11.xyz * u_xlat16_14.xxx;
    u_xlat16_14.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz;
    u_xlat16_14.xyz = log2(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * _Cube_Vector.xxx;
    u_xlat16_14.xyz = exp2(u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb27 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb27)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_27 = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_27 * _CuEm_Vector.x;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.xyz / u_xlat16_7.xyz;
    u_xlat16_32 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_32 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_27 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_32 = u_xlat16_27 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_32);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.5<_LMisCompressed);
#else
    u_xlatb27 = 0.5<_LMisCompressed;
#endif
    u_xlat16_2.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_8.xyz = u_xlat16_2.xyz / u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = (bool(u_xlatb27)) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightMapColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat27 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat27 = (-u_xlat27) * u_xlat27 + 1.0;
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb27 = _ShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb27)) ? u_xlat0.xyz : vs_TEXCOORD3.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat1 = u_xlat2 * u_xlat0.xxxx + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat11 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11 = (-u_xlat2.x) + u_xlat11;
    u_xlat0.z = _ShadowBias.y * u_xlat11 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_32 = (-_ShadowBias.w) + 1.0;
    u_xlat9.x = (-u_xlat16_32) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat16_32;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat9.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) * u_xlat0.xyz + _FogColor.xyz;
    u_xlat27 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_21;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb19 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb19)) ? u_xlat1.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat7 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat7 = (-u_xlat1.x) + u_xlat7;
    u_xlat0.z = _ShadowBias.y * u_xlat7 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat6.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat6.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_3.xyz;
    u_xlat18 = max(_FakeLightPos.w, 0.00100000005);
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = sqrt(u_xlat19);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat2.x / u_xlat18;
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _FakeAttenVector.x;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat1.xyz = vec3(u_xlat18) * _FakeLightColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _fakeLightColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_isCompressed);
#else
    u_xlatb18 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_21 = u_xlat16_2.w * _MainColor.w;
    SV_Target0.w = u_xlat16_21 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb18)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = _FakeLightColor.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_3.xyz) + _FogColor.xyz;
    u_xlat18 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_21;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb19 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb19)) ? u_xlat1.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat7 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat7 = (-u_xlat1.x) + u_xlat7;
    u_xlat0.z = _ShadowBias.y * u_xlat7 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat6.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat6.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_3.xyz;
    u_xlat18 = max(_FakeLightPos.w, 0.00100000005);
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.x = sqrt(u_xlat19);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat2.x / u_xlat18;
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _FakeAttenVector.x;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat1.xyz = vec3(u_xlat18) * _FakeLightColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _fakeLightColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_isCompressed);
#else
    u_xlatb18 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_21 = u_xlat16_2.w * _MainColor.w;
    SV_Target0.w = u_xlat16_21 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb18)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = _FakeLightColor.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_3.xyz) + _FogColor.xyz;
    u_xlat18 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(6) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
float u_xlat12;
float u_xlat33;
mediump float u_xlat16_33;
bool u_xlatb33;
float u_xlat34;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat1.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat33 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat33 = max(u_xlat33, 1.17549435e-38);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat1.y = u_xlat4.x;
    u_xlat1.x = u_xlat3.z;
    u_xlat16_2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_5.xyz = texture(_normalMap, u_xlat16_2.xy).xyz;
    u_xlat16_2 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.x = dot(u_xlat16_6.xyz, u_xlat1.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat1.y = dot(u_xlat16_6.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat1.z = dot(u_xlat16_6.xyz, u_xlat4.xyz);
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = max(u_xlat33, 1.17549435e-38);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat0.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb33 = _ShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb33)) ? u_xlat0.xyz : vs_TEXCOORD3.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat3 = u_xlat0.yyyy * u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat0 = u_xlat4 * u_xlat0.zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat3;
    u_xlat0 = u_xlat0 + u_xlat3;
    u_xlat34 = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat34 = u_xlat0.z + (-u_xlat34);
    u_xlat3.x = max((-u_xlat0.w), u_xlat34);
    u_xlat3.x = (-u_xlat34) + u_xlat3.x;
    u_xlat0.z = _ShadowBias.y * u_xlat3.x + u_xlat34;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat11.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat11.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.xyz / u_xlat16_7.xyz;
    u_xlat16_39 = u_xlat16_2.w * _MainColor.w;
    SV_Target0.w = u_xlat16_39 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb3.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb3.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_33 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_39 = u_xlat16_33 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_39);
    u_xlat3.xzw = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39 = dot(u_xlat3.xzw, u_xlat3.xzw);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_8.xyz = u_xlat3.xzw * vec3(u_xlat16_39);
    u_xlat16_39 = dot((-u_xlat16_8.xyz), u_xlat1.xyz);
    u_xlat16_39 = u_xlat16_39 + u_xlat16_39;
    u_xlat16_8.xyz = u_xlat1.xyz * (-vec3(u_xlat16_39)) + (-u_xlat16_8.xyz);
    u_xlat16_39 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb33 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_39 = (u_xlatb33) ? (-u_xlat16_8.z) : u_xlat16_8.z;
    u_xlat16_39 = u_xlat16_39 + 1.0;
    u_xlat16_39 = sqrt(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * 2.82842708;
    u_xlat16_9.xy = u_xlat16_8.xy / vec2(u_xlat16_39);
    u_xlat16_9.xy = u_xlat16_9.xy * _Cube_Vector.zz;
    u_xlat16_9.xy = u_xlat16_9.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_3.xzw = texture(_Matcap, u_xlat16_9.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_3.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_3.xzw * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_3.xzw * u_xlat16_9.xyz;
    u_xlat16_10.xyz = (-u_xlat16_3.xzw) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_10.xyz = u_xlat16_3.xzw / u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_9.xyz = (u_xlatb3.y) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_3.xyz = texture(_CubeMap, u_xlat16_8.xyz).xyz;
    u_xlat16_39 = u_xlat16_8.y * _Cube_Vector.y + 1.0;
    u_xlat16_39 = u_xlat16_39 + (-_Cube_Vector.y);
    u_xlat16_39 = u_xlat16_39 * 0.5 + 0.5;
    u_xlat16_40 = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_8.xyz = u_xlat16_3.xyz * vec3(u_xlat16_40);
    u_xlat16_8.xyz = u_xlat16_9.xyz * _CuEm_Vector.zzz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = log2(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _Cube_Vector.xxx;
    u_xlat16_8.xyz = exp2(u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb33 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_9.xy = (bool(u_xlatb33)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_33 = texture(_CuEm_Mask, u_xlat16_9.xy).x;
    u_xlat16_40 = u_xlat16_33 * _CuEm_Vector.x;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_40);
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * _CubeColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _MainColor.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = _FakeLightColor.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0.5<_LMisCompressed);
#else
    u_xlatb33 = 0.5<_LMisCompressed;
#endif
    u_xlat16_3.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_9.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_3.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_3.xyz * u_xlat16_9.xyz;
    u_xlat16_10.xyz = (-u_xlat16_3.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_10.xyz = u_xlat16_3.xyz / u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_9.xyz = (bool(u_xlatb33)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightMapColor.xyz;
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_10.xyz = u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat12 = max(_FakeLightPos.w, 0.00100000005);
    u_xlat33 = u_xlat33 / u_xlat12;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * _FakeAttenVector.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = u_xlat1.x * u_xlat33;
    u_xlat1.xyz = vec3(u_xlat33) * _FakeLightColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _fakeLightColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_6.xyz) + _FogColor.xyz;
    u_xlat33 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(6) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
float u_xlat12;
float u_xlat33;
mediump float u_xlat16_33;
bool u_xlatb33;
float u_xlat34;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat1.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat33 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat33 = max(u_xlat33, 1.17549435e-38);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat1.y = u_xlat4.x;
    u_xlat1.x = u_xlat3.z;
    u_xlat16_2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_5.xyz = texture(_normalMap, u_xlat16_2.xy).xyz;
    u_xlat16_2 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.x = dot(u_xlat16_6.xyz, u_xlat1.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat1.y = dot(u_xlat16_6.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat1.z = dot(u_xlat16_6.xyz, u_xlat4.xyz);
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = max(u_xlat33, 1.17549435e-38);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat1.xyz) * u_xlat0.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb33 = _ShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb33)) ? u_xlat0.xyz : vs_TEXCOORD3.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat3 = u_xlat0.yyyy * u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat3 = u_xlat4 * u_xlat0.xxxx + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat0 = u_xlat4 * u_xlat0.zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat3;
    u_xlat0 = u_xlat0 + u_xlat3;
    u_xlat34 = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat34 = u_xlat0.z + (-u_xlat34);
    u_xlat3.x = max((-u_xlat0.w), u_xlat34);
    u_xlat3.x = (-u_xlat34) + u_xlat3.x;
    u_xlat0.z = _ShadowBias.y * u_xlat3.x + u_xlat34;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat11.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat11.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.xyz / u_xlat16_7.xyz;
    u_xlat16_39 = u_xlat16_2.w * _MainColor.w;
    SV_Target0.w = u_xlat16_39 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb3.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb3.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_33 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_39 = u_xlat16_33 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_39);
    u_xlat3.xzw = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39 = dot(u_xlat3.xzw, u_xlat3.xzw);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_8.xyz = u_xlat3.xzw * vec3(u_xlat16_39);
    u_xlat16_39 = dot((-u_xlat16_8.xyz), u_xlat1.xyz);
    u_xlat16_39 = u_xlat16_39 + u_xlat16_39;
    u_xlat16_8.xyz = u_xlat1.xyz * (-vec3(u_xlat16_39)) + (-u_xlat16_8.xyz);
    u_xlat16_39 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb33 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_39 = (u_xlatb33) ? (-u_xlat16_8.z) : u_xlat16_8.z;
    u_xlat16_39 = u_xlat16_39 + 1.0;
    u_xlat16_39 = sqrt(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * 2.82842708;
    u_xlat16_9.xy = u_xlat16_8.xy / vec2(u_xlat16_39);
    u_xlat16_9.xy = u_xlat16_9.xy * _Cube_Vector.zz;
    u_xlat16_9.xy = u_xlat16_9.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_3.xzw = texture(_Matcap, u_xlat16_9.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_3.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_3.xzw * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_3.xzw * u_xlat16_9.xyz;
    u_xlat16_10.xyz = (-u_xlat16_3.xzw) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_10.xyz = u_xlat16_3.xzw / u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_9.xyz = (u_xlatb3.y) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_3.xyz = texture(_CubeMap, u_xlat16_8.xyz).xyz;
    u_xlat16_39 = u_xlat16_8.y * _Cube_Vector.y + 1.0;
    u_xlat16_39 = u_xlat16_39 + (-_Cube_Vector.y);
    u_xlat16_39 = u_xlat16_39 * 0.5 + 0.5;
    u_xlat16_40 = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_8.xyz = u_xlat16_3.xyz * vec3(u_xlat16_40);
    u_xlat16_8.xyz = u_xlat16_9.xyz * _CuEm_Vector.zzz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = log2(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * _Cube_Vector.xxx;
    u_xlat16_8.xyz = exp2(u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb33 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_9.xy = (bool(u_xlatb33)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_33 = texture(_CuEm_Mask, u_xlat16_9.xy).x;
    u_xlat16_40 = u_xlat16_33 * _CuEm_Vector.x;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_40);
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * _CubeColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _MainColor.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = _FakeLightColor.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0.5<_LMisCompressed);
#else
    u_xlatb33 = 0.5<_LMisCompressed;
#endif
    u_xlat16_3.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_9.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_3.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_3.xyz * u_xlat16_9.xyz;
    u_xlat16_10.xyz = (-u_xlat16_3.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_10.xyz = u_xlat16_3.xyz / u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_9.xyz = (bool(u_xlatb33)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightMapColor.xyz;
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_10.xyz = u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat33 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat12 = max(_FakeLightPos.w, 0.00100000005);
    u_xlat33 = u_xlat33 / u_xlat12;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * _FakeAttenVector.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = u_xlat1.x * u_xlat33;
    u_xlat1.xyz = vec3(u_xlat33) * _FakeLightColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _fakeLightColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_6.xyz) + _FogColor.xyz;
    u_xlat33 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
float u_xlat12;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_AlphaClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_isCompressed);
#else
    u_xlatb2 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    u_xlat16_22 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_22 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = _FakeLightColor.www * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.x = max(_FakeLightPos.w, 0.00100000005);
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat12 = sqrt(u_xlat5.x);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat5.xxx;
    u_xlat9.x = dot(u_xlat9.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat12 / u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _FakeAttenVector.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat9.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat2.xxx * _FakeLightColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _fakeLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb23 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb23)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat0 = u_xlat4 * u_xlat2.xxxx + u_xlat0;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat0 = u_xlat4 * u_xlat2.zzzz + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat9.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat9.x = (-u_xlat2.x) + u_xlat9.x;
    u_xlat0.z = _ShadowBias.y * u_xlat9.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat0.xyw + u_xlat5.xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat0.xyw + u_xlat5.xyz;
    vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat0.xyw + u_xlat5.xyz;
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_22 = (-_ShadowBias.w) + 1.0;
    u_xlat9.x = (-u_xlat16_22) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat9.x + u_xlat16_22;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat9.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat9.xyz + u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = (-u_xlat16_1.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
float u_xlat12;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_AlphaClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_isCompressed);
#else
    u_xlatb2 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    u_xlat16_22 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_22 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = _FakeLightColor.www * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.x = max(_FakeLightPos.w, 0.00100000005);
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat12 = sqrt(u_xlat5.x);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat5.xxx;
    u_xlat9.x = dot(u_xlat9.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat12 / u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _FakeAttenVector.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat9.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat2.xxx * _FakeLightColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _fakeLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb23 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb23)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat0 = u_xlat4 * u_xlat2.xxxx + u_xlat0;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat0 = u_xlat4 * u_xlat2.zzzz + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat9.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat9.x = (-u_xlat2.x) + u_xlat9.x;
    u_xlat0.z = _ShadowBias.y * u_xlat9.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat0.xyw + u_xlat5.xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat0.xyw + u_xlat5.xyz;
    vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat0.xyw + u_xlat5.xyz;
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_22 = (-_ShadowBias.w) + 1.0;
    u_xlat9.x = (-u_xlat16_22) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat9.x + u_xlat16_22;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat9.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat9.xyz + u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = (-u_xlat16_1.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb16 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat1.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat6 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat6 = (-u_xlat1.x) + u_xlat6;
    u_xlat0.z = _ShadowBias.y * u_xlat6 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat5.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat5.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_isCompressed);
#else
    u_xlatb15 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.xyz / u_xlat16_4.xyz;
    u_xlat16_18 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_18 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb15)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat0.xyz = (-u_xlat16_3.xyz) * u_xlat0.xyz + _FogColor.xyz;
    u_xlat15 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb16 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat1.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat6 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat6 = (-u_xlat1.x) + u_xlat6;
    u_xlat0.z = _ShadowBias.y * u_xlat6 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_3.x = (-_ShadowBias.w) + 1.0;
    u_xlat5.x = (-u_xlat16_3.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_3.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat5.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_isCompressed);
#else
    u_xlatb15 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.xyz / u_xlat16_4.xyz;
    u_xlat16_18 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_18 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb15)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat0.xyz = (-u_xlat16_3.xyz) * u_xlat0.xyz + _FogColor.xyz;
    u_xlat15 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(3) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(4) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
mediump vec3 u_xlat16_13;
float u_xlat24;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_29 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_29 = u_xlat16_29 + u_xlat16_29;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_29)) + (-u_xlat16_5.xyz);
    u_xlat16_29 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_5.xyz = vec3(u_xlat16_29) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb0.x = _Cube_Vector.w==1.0;
#endif
    u_xlat16_29 = (u_xlatb0.x) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_29 = u_xlat16_29 + 1.0;
    u_xlat16_29 = sqrt(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_29);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_0.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_0.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb0.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_8.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_13.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_13.xyz = u_xlat16_8.xyz * u_xlat16_13.xxx;
    u_xlat16_13.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _Cube_Vector.xxx;
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb8 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb8)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_8.x = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_8.x * _CuEm_Vector.x;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.xyz / u_xlat16_7.xyz;
    u_xlat16_29 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_29 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb0.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_0.x = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_29 = u_xlat16_0.x * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_29);
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.xyz + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) + _FogColor.xyz;
    u_xlat24 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(3) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(4) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
mediump vec3 u_xlat16_13;
float u_xlat24;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_29 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_29 = u_xlat16_29 + u_xlat16_29;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_29)) + (-u_xlat16_5.xyz);
    u_xlat16_29 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_5.xyz = vec3(u_xlat16_29) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb0.x = _Cube_Vector.w==1.0;
#endif
    u_xlat16_29 = (u_xlatb0.x) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_29 = u_xlat16_29 + 1.0;
    u_xlat16_29 = sqrt(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_29);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_0.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_0.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb0.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_8.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_13.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_13.xyz = u_xlat16_8.xyz * u_xlat16_13.xxx;
    u_xlat16_13.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xyz = log2(u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _Cube_Vector.xxx;
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb8 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb8)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_8.x = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_8.x * _CuEm_Vector.x;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_13.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.xyz / u_xlat16_7.xyz;
    u_xlat16_29 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_29 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb0.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_0.x = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_29 = u_xlat16_0.x * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_29);
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.xyz + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) + _FogColor.xyz;
    u_xlat24 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(4) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump vec3 u_xlat16_14;
float u_xlat27;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat27 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_32 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_32)) + (-u_xlat16_5.xyz);
    u_xlat16_32 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb0.x = _Cube_Vector.w==1.0;
#endif
    u_xlat16_32 = (u_xlatb0.x) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_32 = u_xlat16_32 + 1.0;
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat16_32 = u_xlat16_32 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_32);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_0.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_0.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb0.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_9.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_14.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_14.xxx;
    u_xlat16_14.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz;
    u_xlat16_14.xyz = log2(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * _Cube_Vector.xxx;
    u_xlat16_14.xyz = exp2(u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb9 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb9)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_9.x = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_9.x * _CuEm_Vector.x;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.xyz / u_xlat16_7.xyz;
    u_xlat16_32 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_32 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb0.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_0.x = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_32 = u_xlat16_0.x * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_32);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb0.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_9.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz;
    u_xlat16_8.xyz = (-u_xlat16_9.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_8.xyz = u_xlat16_9.xyz / u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = (u_xlatb0.x) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightMapColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) + _FogColor.xyz;
    u_xlat27 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(4) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump vec3 u_xlat16_14;
float u_xlat27;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat27 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_32 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_32)) + (-u_xlat16_5.xyz);
    u_xlat16_32 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb0.x = _Cube_Vector.w==1.0;
#endif
    u_xlat16_32 = (u_xlatb0.x) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_32 = u_xlat16_32 + 1.0;
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat16_32 = u_xlat16_32 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_32);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_0.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_0.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb0.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb0.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_9.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_14.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_14.xxx;
    u_xlat16_14.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz;
    u_xlat16_14.xyz = log2(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * _Cube_Vector.xxx;
    u_xlat16_14.xyz = exp2(u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb9 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb9)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_9.x = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_9.x * _CuEm_Vector.x;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.xyz / u_xlat16_7.xyz;
    u_xlat16_32 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_32 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb0.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_0.x = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_32 = u_xlat16_0.x * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_32);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb0.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_9.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz;
    u_xlat16_8.xyz = (-u_xlat16_9.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_8.xyz = u_xlat16_9.xyz / u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = (u_xlatb0.x) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightMapColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = (-u_xlat16_5.xyz) + _FogColor.xyz;
    u_xlat27 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = max(_FakeLightPos.w, 0.00100000005);
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat1 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat6 = sqrt(u_xlat1);
    u_xlat1 = inversesqrt(u_xlat1);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat1);
    u_xlat5.x = dot(u_xlat5.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat6 / u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FakeAttenVector.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _FakeLightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _fakeLightColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_isCompressed);
#else
    u_xlatb15 = 0.5<_isCompressed;
#endif
    u_xlat16_2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.xyz / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb15)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = _FakeLightColor.www * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_2.xyz) + _FogColor.xyz;
    u_xlat15 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = max(_FakeLightPos.w, 0.00100000005);
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat1 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat6 = sqrt(u_xlat1);
    u_xlat1 = inversesqrt(u_xlat1);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat1);
    u_xlat5.x = dot(u_xlat5.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat6 / u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FakeAttenVector.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _FakeLightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _fakeLightColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_isCompressed);
#else
    u_xlatb15 = 0.5<_isCompressed;
#endif
    u_xlat16_2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.xyz / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb15)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = _FakeLightColor.www * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_2.xyz) + _FogColor.xyz;
    u_xlat15 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(4) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_15;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
float u_xlat32;
mediump float u_xlat16_35;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat30 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat30 = max(u_xlat30, 1.17549435e-38);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 1.17549435e-38);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_35 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_35 = u_xlat16_35 + u_xlat16_35;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_35)) + (-u_xlat16_5.xyz);
    u_xlat16_35 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_5.xyz = vec3(u_xlat16_35) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb30 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_35 = (u_xlatb30) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_35 = u_xlat16_35 + 1.0;
    u_xlat16_35 = sqrt(u_xlat16_35);
    u_xlat16_35 = u_xlat16_35 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_35);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_2.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_12.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_15.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xxx;
    u_xlat16_15.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_15.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_6.xyz;
    u_xlat16_15.xyz = log2(u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_15.xyz * _Cube_Vector.xxx;
    u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb30 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb30)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_30 = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_30 * _CuEm_Vector.x;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.xyz / u_xlat16_7.xyz;
    u_xlat16_35 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_35 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_30 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_35 = u_xlat16_30 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_35);
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.xyz + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = _FakeLightColor.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5<_LMisCompressed);
#else
    u_xlatb30 = 0.5<_LMisCompressed;
#endif
    u_xlat16_2.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_9.xyz = u_xlat16_2.xyz / u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_8.xyz = (bool(u_xlatb30)) ? u_xlat16_9.xyz : u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _LightMapColor.xyz;
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_9.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat32 = inversesqrt(u_xlat30);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat32) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10 = max(_FakeLightPos.w, 0.00100000005);
    u_xlat10 = u_xlat30 / u_xlat10;
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat10 = log2(u_xlat10);
    u_xlat10 = u_xlat10 * _FakeAttenVector.x;
    u_xlat10 = exp2(u_xlat10);
    u_xlat0.x = u_xlat0.x * u_xlat10;
    u_xlat0.xyz = u_xlat0.xxx * _FakeLightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _fakeLightColor.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_5.xyz) + _FogColor.xyz;
    u_xlat30 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _isReflectionCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump float _Reflection_HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec4 _Cube_Vector;
uniform 	mediump vec4 _Matcap_ST;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(4) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_15;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
float u_xlat32;
mediump float u_xlat16_35;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat30 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat30 = max(u_xlat30, 1.17549435e-38);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4.xyz = texture(_normalMap, u_xlat16_1.xy).xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_5.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_5.xyz, u_xlat3.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 1.17549435e-38);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat16_35 = dot((-u_xlat16_5.xyz), u_xlat0.xyz);
    u_xlat16_35 = u_xlat16_35 + u_xlat16_35;
    u_xlat16_5.xyz = u_xlat0.xyz * (-vec3(u_xlat16_35)) + (-u_xlat16_5.xyz);
    u_xlat16_35 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_5.xyz = vec3(u_xlat16_35) * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb30 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_35 = (u_xlatb30) ? (-u_xlat16_5.z) : u_xlat16_5.z;
    u_xlat16_35 = u_xlat16_35 + 1.0;
    u_xlat16_35 = sqrt(u_xlat16_35);
    u_xlat16_35 = u_xlat16_35 * 2.82842708;
    u_xlat16_6.xy = u_xlat16_5.xy / vec2(u_xlat16_35);
    u_xlat16_6.xy = u_xlat16_6.xy * _Cube_Vector.zz;
    u_xlat16_6.xy = u_xlat16_6.xy * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_2.xyz = texture(_Matcap, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_2.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_12.xyz = texture(_CubeMap, u_xlat16_5.xyz).xyz;
    u_xlat16_5.x = u_xlat16_5.y * _Cube_Vector.y + 1.0;
    u_xlat16_5.x = u_xlat16_5.x + (-_Cube_Vector.y);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_15.x = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_15.xyz = u_xlat16_12.xyz * u_xlat16_15.xxx;
    u_xlat16_15.xyz = u_xlat16_6.xyz * _CuEm_Vector.zzz + u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_15.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_6.xyz;
    u_xlat16_15.xyz = log2(u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_15.xyz * _Cube_Vector.xxx;
    u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb30 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_6.xy = (bool(u_xlatb30)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_30 = texture(_CuEm_Mask, u_xlat16_6.xy).x;
    u_xlat16_6.x = u_xlat16_30 * _CuEm_Vector.x;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_6.xxx;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_15.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_1.xyz / u_xlat16_7.xyz;
    u_xlat16_35 = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_35 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_30 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_35 = u_xlat16_30 * _CuEm_Vector.y;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_35);
    u_xlat16_5.xyz = u_xlat16_7.xyz * _MainColor.xyz + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = _FakeLightColor.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5<_LMisCompressed);
#else
    u_xlatb30 = 0.5<_LMisCompressed;
#endif
    u_xlat16_2.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_9.xyz = u_xlat16_2.xyz / u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_8.xyz = (bool(u_xlatb30)) ? u_xlat16_9.xyz : u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _LightMapColor.xyz;
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xyz = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_9.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_7.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat32 = inversesqrt(u_xlat30);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat32) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10 = max(_FakeLightPos.w, 0.00100000005);
    u_xlat10 = u_xlat30 / u_xlat10;
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat10 = max(u_xlat10, 0.0);
    u_xlat10 = log2(u_xlat10);
    u_xlat10 = u_xlat10 * _FakeAttenVector.x;
    u_xlat10 = exp2(u_xlat10);
    u_xlat0.x = u_xlat0.x * u_xlat10;
    u_xlat0.xyz = u_xlat0.xxx * _FakeLightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _fakeLightColor.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = (-u_xlat16_5.xyz) + _FogColor.xyz;
    u_xlat30 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
vec3 u_xlat8;
float u_xlat11;
mediump float u_xlat16_19;
float u_xlat20;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_AlphaClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_isCompressed);
#else
    u_xlatb2 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_19 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = _FakeLightColor.www * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.x = max(_FakeLightPos.w, 0.00100000005);
    u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat5 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat11 = sqrt(u_xlat5);
    u_xlat5 = inversesqrt(u_xlat5);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat5);
    u_xlat8.x = dot(u_xlat8.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat11 / u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _FakeAttenVector.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat8.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat2.xxx * _FakeLightColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _fakeLightColor.xyz;
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = (-u_xlat16_1.xyz) + _FogColor.xyz;
    u_xlat20 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb9 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat9 * in_TANGENT0.w;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _FakeLightColor;
uniform 	mediump vec4 _FakeAttenVector;
uniform 	mediump vec4 _FakeLightPos;
uniform 	mediump vec4 _fakeLightColor;
uniform 	mediump vec4 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
vec3 u_xlat8;
float u_xlat11;
mediump float u_xlat16_19;
float u_xlat20;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w + (-_AlphaClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb2 = u_xlat16_1.x<0.0;
#endif
    if(u_xlatb2){discard;}
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_isCompressed);
#else
    u_xlatb2 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_19 * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = min(u_xlat16_1.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = _FakeLightColor.www * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.x = max(_FakeLightPos.w, 0.00100000005);
    u_xlat8.xyz = (-vs_TEXCOORD3.xyz) + _FakeLightPos.xyz;
    u_xlat5 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat11 = sqrt(u_xlat5);
    u_xlat5 = inversesqrt(u_xlat5);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat5);
    u_xlat8.x = dot(u_xlat8.xyz, vs_TEXCOORD1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat11 / u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _FakeAttenVector.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat8.x * u_xlat2.x;
    u_xlat2.xyz = u_xlat2.xxx * _FakeLightColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _fakeLightColor.xyz;
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = (-u_xlat16_1.xyz) + _FogColor.xyz;
    u_xlat20 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_FAKE_LIGHT" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FAKE_LIGHT" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 83351
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" }
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
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
Keywords { "MODE_UNITY" }
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
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
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
Keywords { "MODE_CUSTOM" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
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
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_Scene_Compression_FakeLightGUI"
}