//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PCSSAO/Scene/Compression" {
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

_isAdaptive ("开启阴影衰减自适应", Float) = 1.0

_shadowVector ("阴影衰减数据", Vector) = (0.5,0.5,0,0)

_StencilRef ("StencilRef", Float) = 0.0

_StencilComp ("StencilComp", Float) = 8.0

}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 64699
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
vec4 ImmCB_0[16];
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
uniform 	mediump float _isAdaptive;
uniform 	mediump vec4 _shadowVector;
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
UNITY_LOCATION(2) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(7) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bvec2 u_xlatb9;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump float u_xlat16_11;
ivec3 u_xlati11;
bool u_xlatb11;
mediump float u_xlat16_16;
vec3 u_xlat17;
mediump float u_xlat10_17;
ivec2 u_xlati17;
bool u_xlatb17;
ivec2 u_xlati18;
bvec2 u_xlatb18;
mediump vec2 u_xlat16_20;
vec2 u_xlat21;
int u_xlati21;
bool u_xlatb21;
float u_xlat27;
bool u_xlatb27;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat31;
int u_xlati31;
bool u_xlatb31;
mediump float u_xlat16_33;
float u_xlat37;
int u_xlati37;
bool u_xlatb37;
void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_0.xy);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.zxy / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz;
    u_xlat16_3.xyz = (u_xlatb2.x) ? u_xlat16_3.xyz : u_xlat16_4.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_20.x = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_20.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.5<_LMisCompressed);
#else
    u_xlatb31 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.zxy / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb31)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightMapColor.zxy;
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb1 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_20.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_1.x = texture(_CuEm_Mask, u_xlat16_20.xy).x;
    u_xlat16_11 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_2.xzw = texture(_normalMap, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_30 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_30) + vs_TEXCOORD2.yzx;
    u_xlat21.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat21.x = max(u_xlat21.x, 1.17549435e-38);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat2.xzw = u_xlat21.xxx * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat2.xzw * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat2.zwx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat2.w;
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_0.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat2.x;
    u_xlat9.y = u_xlat7.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_0.xyz, u_xlat9.xyz);
    u_xlat7.x = u_xlat2.z;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_0.xyz, u_xlat7.xyz);
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat21.x = max(u_xlat21.x, 1.17549435e-38);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat2.xzw = u_xlat21.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat7.xyz;
    u_xlat16_30 = dot((-u_xlat16_0.xyz), u_xlat2.xzw);
    u_xlat16_30 = u_xlat16_30 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat2.xzw * (-vec3(u_xlat16_30)) + (-u_xlat16_0.xyz);
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat16_7.xyz = texture(_CubeMap, u_xlat16_0.xyz).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb21 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_20.x = (u_xlatb21) ? (-u_xlat16_0.z) : u_xlat16_0.z;
    u_xlat16_20.x = u_xlat16_20.x + 1.0;
    u_xlat16_20.x = sqrt(u_xlat16_20.x);
    u_xlat16_20.x = u_xlat16_20.x * 2.82842708;
    u_xlat16_0.xz = u_xlat16_0.xy / u_xlat16_20.xx;
    u_xlat16_0.xz = u_xlat16_0.xz * _Cube_Vector.zz;
    u_xlat16_0.xz = u_xlat16_0.xz * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_8.xyz = texture(_Matcap, u_xlat16_0.xz).xyz;
    u_xlat16_0.xzw = (-u_xlat16_8.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_0.xzw = u_xlat16_8.zxy / u_xlat16_0.xzw;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_8.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.zxy;
    u_xlat16_0.xzw = (u_xlatb2.y) ? u_xlat16_0.xzw : u_xlat16_5.xyz;
    u_xlat16_33 = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * u_xlat16_7.zxy;
    u_xlat16_0.xzw = u_xlat16_0.xzw * _CuEm_Vector.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.xzw * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xzw = log2(u_xlat16_0.xzw);
    u_xlat16_0.xzw = u_xlat16_0.xzw * _Cube_Vector.xxx;
    u_xlat16_0.xzw = exp2(u_xlat16_0.xzw);
    u_xlat16_33 = u_xlat16_1.x * _CuEm_Vector.x;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_33);
    u_xlat16_10 = u_xlat16_0.y * _Cube_Vector.y + 1.0;
    u_xlat16_10 = u_xlat16_10 + (-_Cube_Vector.y);
    u_xlat16_10 = u_xlat16_10 * 0.5 + 0.5;
    u_xlat16_0.xyz = vec3(u_xlat16_10) * u_xlat16_0.xzw;
    u_xlat16_30 = u_xlat16_11 * _CuEm_Vector.y;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
    u_xlat16_5.xyz = u_xlat16_0.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * _MainColor.zxy + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive);
#endif
    u_xlat11.xy = vs_TEXCOORD3.xz + vec2(-312.5, -1.25);
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat21.x = min(_MainLightDirectionAndAngleOffset.y, 0.879999995);
    u_xlat21.x = (-u_xlat21.x) + 1.0;
    u_xlat31 = _MainLightDirectionAndAngleOffset.y * -1.62 + 2.5;
    u_xlat21.x = log2(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * u_xlat31;
    u_xlat21.x = exp2(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * 18.0;
    u_xlat21.x = (u_xlatb1) ? u_xlat21.x : _shadowVector.y;
    u_xlat21.x = max(u_xlat21.x, 0.0);
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat11.x = u_xlat21.x * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat21.x = u_xlat11.x * -2.0 + 3.0;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat21.x;
    u_xlat16_30 = (u_xlatb1) ? 1.0 : _shadowVector.z;
    u_xlat1 = log2(u_xlat11.x);
    u_xlat1 = u_xlat16_30 * u_xlat1;
    u_xlat1 = exp2(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb11 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat7.xyz = u_xlat21.xxx * u_xlat7.xyz;
    u_xlat21.x = dot(u_xlat2.xzw, u_xlat7.xyz);
    u_xlat21.x = (-u_xlat21.x) * u_xlat21.x + 1.0;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * _ShadowBias.z;
    u_xlat2.xyz = (-u_xlat2.xzw) * u_xlat21.xxx + vs_TEXCOORD3.xyz;
    u_xlat11.xyz = (bool(u_xlatb11)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
    u_xlat3 = u_xlat11.yyyy * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat11.xxxx + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat11.zzzz + u_xlat2;
    u_xlat2 = u_xlat5 + u_xlat2;
    u_xlat11.x = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat11.x) + u_xlat2.z;
    u_xlat21.x = max((-u_xlat2.w), u_xlat11.x);
    u_xlat21.x = (-u_xlat11.x) + u_xlat21.x;
    u_xlat2.z = _ShadowBias.y * u_xlat21.x + u_xlat11.x;
    u_xlat11.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb11 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb11){
        u_xlat16_30 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat2.w<1.0);
#else
        u_xlatb11 = u_xlat2.w<1.0;
#endif
        if(u_xlatb11){
            u_xlat11.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat11.x = max(u_xlat11.x, 2.0);
            u_xlat11.x = min(u_xlat11.x, 30.0);
            u_xlat11.x = u_xlat11.x * _ShadowMapTexture_TexelSize.x;
            u_xlat7.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat31 = dot(u_xlat7.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat31 = fract(u_xlat31);
            u_xlat31 = u_xlat31 * 52.9829178;
            u_xlat31 = fract(u_xlat31);
            u_xlat31 = u_xlat31 * 6.28318548;
            u_xlat7.x = sin(u_xlat31);
            u_xlat8.x = cos(u_xlat31);
            u_xlat3 = u_xlat7.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.399062157, -0.768907249) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati17.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati17.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati17.xy));
            u_xlati17.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati17.xy));
            if(u_xlati17.x != 0) {
                u_xlat17.z = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat31 = u_xlat2.w * 0.00200000009;
                u_xlat31 = max(u_xlat31, 0.000500000024);
                u_xlat31 = (-u_xlat31) + u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb31 = !!(u_xlat17.z<u_xlat31);
#else
                u_xlatb31 = u_xlat17.z<u_xlat31;
#endif
                u_xlat17.x = 1.0;
                u_xlat17.xz = bool(u_xlatb31) ? u_xlat17.xz : vec2(0.0, 0.0);
            } else {
                u_xlat17.x = float(0.0);
                u_xlat17.z = float(0.0);
            }
            if(u_xlati17.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.929388702, 0.293877602) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.457714319, -0.879124641) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.276768446, 0.756483793) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat4.xy = u_xlat8.xx * vec2(0.443233252, 0.53742981) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.975115538, -0.4737342) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.418930233, 0.190901875) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.997065067, 0.914375901) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat4.xy = u_xlat8.xx * vec2(0.199841261, 0.143831611) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.78641367, -0.1410079) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati11.xz = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati11.xz = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati11.xz));
            u_xlati11.xz = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati11.xz));
            if(u_xlati11.x != 0) {
                u_xlat11.x = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat11.x<u_xlat27);
#else
                u_xlatb27 = u_xlat11.x<u_xlat27;
#endif
                u_xlat9.y = u_xlat11.x + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati11.z != 0) {
                u_xlat11.x = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat31 = u_xlat2.w * 0.00200000009;
                u_xlat31 = max(u_xlat31, 0.000500000024);
                u_xlat31 = (-u_xlat31) + u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb31 = !!(u_xlat11.x<u_xlat31);
#else
                u_xlatb31 = u_xlat11.x<u_xlat31;
#endif
                u_xlat9.y = u_xlat11.x + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb31)) ? u_xlat9.xy : u_xlat17.xz;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb11 = !!(0.0<u_xlat17.x);
#else
            u_xlatb11 = 0.0<u_xlat17.x;
#endif
            u_xlat31 = u_xlat17.z / u_xlat17.x;
            u_xlat31 = u_xlatb11 ? u_xlat31 : float(0.0);
            u_xlat31 = (-u_xlat31) + u_xlat2.w;
            u_xlat31 = u_xlat31 * _PCSSLightSize;
            u_xlat21.x = max(u_xlat11.y, u_xlat31);
            u_xlat21.x = max(u_xlat21.x, 1.0);
            u_xlat21.x = min(u_xlat21.x, 20.0);
            u_xlat11.x = (u_xlatb11) ? u_xlat21.x : 1.0;
            u_xlat11.x = u_xlat11.x * _ShadowMapTexture_TexelSize.x;
            u_xlati21 = max(_PCSSSampleCount, 4);
            u_xlati21 = min(u_xlati21, 16);
            u_xlat16_6.x = float(0.0);
            u_xlat16_16 = float(0.0);
            u_xlati31 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb17 = !!(u_xlati31>=16);
#else
                u_xlatb17 = u_xlati31>=16;
#endif
                if(u_xlatb17){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb17 = !!(u_xlati31<u_xlati21);
#else
                u_xlatb17 = u_xlati31<u_xlati21;
#endif
                if(u_xlatb17){
                    u_xlat17.xy = u_xlat7.xx * ImmCB_0[u_xlati31].yx;
                    u_xlat9.x = ImmCB_0[u_xlati31].x * u_xlat8.x + (-u_xlat17.x);
                    u_xlat9.y = ImmCB_0[u_xlati31].y * u_xlat8.x + u_xlat17.y;
                    u_xlat17.xy = u_xlat9.xy * u_xlat11.xx + u_xlat2.xy;
                    u_xlatb18.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat17.xyxx).xy;
                    u_xlatb9.xy = lessThan(u_xlat17.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb37 = u_xlatb18.x && u_xlatb9.x;
                    u_xlatb37 = u_xlatb18.y && u_xlatb37;
                    u_xlatb37 = u_xlatb9.y && u_xlatb37;
                    if(!u_xlatb37){
                        u_xlati37 = u_xlati31 + 1;
                        u_xlati31 = u_xlati37;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat17.xy,u_xlat2.w);
                    u_xlat10_17 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_6.x = u_xlat16_6.x + u_xlat10_17;
                    u_xlat16_16 = u_xlat16_16 + 1.0;
                }
                u_xlati31 = u_xlati31 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb11 = !!(0.0<u_xlat16_16);
#else
            u_xlatb11 = 0.0<u_xlat16_16;
#endif
            u_xlat16_6.x = u_xlat16_6.x / u_xlat16_16;
            u_xlat21.xy = (-u_xlat2.xy) + vec2(1.0, 1.0);
            u_xlat21.xy = min(u_xlat21.xy, u_xlat2.xy);
            u_xlat21.x = min(u_xlat21.y, u_xlat21.x);
            u_xlat21.x = u_xlat21.x * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
            u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
            u_xlat31 = u_xlat16_6.x + -1.0;
            u_xlat11.x = u_xlatb11 ? u_xlat31 : float(0.0);
            u_xlat11.x = u_xlat21.x * u_xlat11.x + 1.0;
            u_xlat16_11 = u_xlat11.x;
        } else {
            u_xlat16_11 = 1.0;
        }
        u_xlat16_6.x = (-u_xlat16_30) + 1.0;
        u_xlat16_30 = u_xlat16_11 * u_xlat16_6.x + u_xlat16_30;
        u_xlat30 = u_xlat16_30;
    } else {
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec4 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat7.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat17.x = (-u_xlat16_6.x) + 1.0;
        u_xlat30 = u_xlat7.x * u_xlat17.x + u_xlat16_6.x;
    }
    u_xlat7.x = (-u_xlat30) + 1.0;
    u_xlat7.x = (-u_xlat7.x) * _shadowStrength + 1.0;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = max(u_xlat1, u_xlat7.x);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat17.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat17.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat7.xyz;
    u_xlat37 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat7.xyz = (-u_xlat16_0.xyz) * u_xlat7.xyz + _FogColor.zxy;
    u_xlat7.xyz = vec3(u_xlat37) * u_xlat7.xyz + u_xlat16_6.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = log2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat7.xz * vec2(15.0, 0.9375);
    u_xlat37 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat7.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat37 * 0.0625 + u_xlat0.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat17.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat17.xy, 0.0).xyz;
    u_xlat7.x = u_xlat7.x * 15.0 + (-u_xlat37);
    u_xlat17.xyz = (-u_xlat16_8.xyz) + u_xlat16_9.xyz;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat17.xyz + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(_shadowVector.x==1.0);
#else
    u_xlatb37 = _shadowVector.x==1.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb37)) ? vec3(u_xlat1) : u_xlat7.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
vec4 ImmCB_0[16];
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
uniform 	mediump float _isAdaptive;
uniform 	mediump vec4 _shadowVector;
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
UNITY_LOCATION(2) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(7) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bvec2 u_xlatb9;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump float u_xlat16_11;
ivec3 u_xlati11;
bool u_xlatb11;
mediump float u_xlat16_16;
vec3 u_xlat17;
mediump float u_xlat10_17;
ivec2 u_xlati17;
bool u_xlatb17;
ivec2 u_xlati18;
bvec2 u_xlatb18;
mediump vec2 u_xlat16_20;
vec2 u_xlat21;
int u_xlati21;
bool u_xlatb21;
float u_xlat27;
bool u_xlatb27;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat31;
int u_xlati31;
bool u_xlatb31;
mediump float u_xlat16_33;
float u_xlat37;
int u_xlati37;
bool u_xlatb37;
void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_0.xy);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.zxy / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz;
    u_xlat16_3.xyz = (u_xlatb2.x) ? u_xlat16_3.xyz : u_xlat16_4.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_20.x = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_20.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.5<_LMisCompressed);
#else
    u_xlatb31 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.zxy / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb31)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightMapColor.zxy;
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb1 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_20.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_1.x = texture(_CuEm_Mask, u_xlat16_20.xy).x;
    u_xlat16_11 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_2.xzw = texture(_normalMap, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_30 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_30) + vs_TEXCOORD2.yzx;
    u_xlat21.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat21.x = max(u_xlat21.x, 1.17549435e-38);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat2.xzw = u_xlat21.xxx * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat2.xzw * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat2.zwx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat2.w;
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_0.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat2.x;
    u_xlat9.y = u_xlat7.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_0.xyz, u_xlat9.xyz);
    u_xlat7.x = u_xlat2.z;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_0.xyz, u_xlat7.xyz);
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat21.x = max(u_xlat21.x, 1.17549435e-38);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat2.xzw = u_xlat21.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat7.xyz;
    u_xlat16_30 = dot((-u_xlat16_0.xyz), u_xlat2.xzw);
    u_xlat16_30 = u_xlat16_30 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat2.xzw * (-vec3(u_xlat16_30)) + (-u_xlat16_0.xyz);
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat16_7.xyz = texture(_CubeMap, u_xlat16_0.xyz).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb21 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_20.x = (u_xlatb21) ? (-u_xlat16_0.z) : u_xlat16_0.z;
    u_xlat16_20.x = u_xlat16_20.x + 1.0;
    u_xlat16_20.x = sqrt(u_xlat16_20.x);
    u_xlat16_20.x = u_xlat16_20.x * 2.82842708;
    u_xlat16_0.xz = u_xlat16_0.xy / u_xlat16_20.xx;
    u_xlat16_0.xz = u_xlat16_0.xz * _Cube_Vector.zz;
    u_xlat16_0.xz = u_xlat16_0.xz * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_8.xyz = texture(_Matcap, u_xlat16_0.xz).xyz;
    u_xlat16_0.xzw = (-u_xlat16_8.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_0.xzw = u_xlat16_8.zxy / u_xlat16_0.xzw;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_8.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.zxy;
    u_xlat16_0.xzw = (u_xlatb2.y) ? u_xlat16_0.xzw : u_xlat16_5.xyz;
    u_xlat16_33 = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * u_xlat16_7.zxy;
    u_xlat16_0.xzw = u_xlat16_0.xzw * _CuEm_Vector.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.xzw * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xzw = log2(u_xlat16_0.xzw);
    u_xlat16_0.xzw = u_xlat16_0.xzw * _Cube_Vector.xxx;
    u_xlat16_0.xzw = exp2(u_xlat16_0.xzw);
    u_xlat16_33 = u_xlat16_1.x * _CuEm_Vector.x;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_33);
    u_xlat16_10 = u_xlat16_0.y * _Cube_Vector.y + 1.0;
    u_xlat16_10 = u_xlat16_10 + (-_Cube_Vector.y);
    u_xlat16_10 = u_xlat16_10 * 0.5 + 0.5;
    u_xlat16_0.xyz = vec3(u_xlat16_10) * u_xlat16_0.xzw;
    u_xlat16_30 = u_xlat16_11 * _CuEm_Vector.y;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
    u_xlat16_5.xyz = u_xlat16_0.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * _MainColor.zxy + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive);
#endif
    u_xlat11.xy = vs_TEXCOORD3.xz + vec2(-312.5, -1.25);
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat21.x = min(_MainLightDirectionAndAngleOffset.y, 0.879999995);
    u_xlat21.x = (-u_xlat21.x) + 1.0;
    u_xlat31 = _MainLightDirectionAndAngleOffset.y * -1.62 + 2.5;
    u_xlat21.x = log2(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * u_xlat31;
    u_xlat21.x = exp2(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * 18.0;
    u_xlat21.x = (u_xlatb1) ? u_xlat21.x : _shadowVector.y;
    u_xlat21.x = max(u_xlat21.x, 0.0);
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat11.x = u_xlat21.x * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat21.x = u_xlat11.x * -2.0 + 3.0;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat21.x;
    u_xlat16_30 = (u_xlatb1) ? 1.0 : _shadowVector.z;
    u_xlat1 = log2(u_xlat11.x);
    u_xlat1 = u_xlat16_30 * u_xlat1;
    u_xlat1 = exp2(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb11 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat7.xyz = u_xlat21.xxx * u_xlat7.xyz;
    u_xlat21.x = dot(u_xlat2.xzw, u_xlat7.xyz);
    u_xlat21.x = (-u_xlat21.x) * u_xlat21.x + 1.0;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * _ShadowBias.z;
    u_xlat2.xyz = (-u_xlat2.xzw) * u_xlat21.xxx + vs_TEXCOORD3.xyz;
    u_xlat11.xyz = (bool(u_xlatb11)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
    u_xlat3 = u_xlat11.yyyy * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat11.xxxx + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat11.zzzz + u_xlat2;
    u_xlat2 = u_xlat5 + u_xlat2;
    u_xlat11.x = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat11.x) + u_xlat2.z;
    u_xlat21.x = max((-u_xlat2.w), u_xlat11.x);
    u_xlat21.x = (-u_xlat11.x) + u_xlat21.x;
    u_xlat2.z = _ShadowBias.y * u_xlat21.x + u_xlat11.x;
    u_xlat11.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb11 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb11){
        u_xlat16_30 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat2.w<1.0);
#else
        u_xlatb11 = u_xlat2.w<1.0;
#endif
        if(u_xlatb11){
            u_xlat11.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat11.x = max(u_xlat11.x, 2.0);
            u_xlat11.x = min(u_xlat11.x, 30.0);
            u_xlat11.x = u_xlat11.x * _ShadowMapTexture_TexelSize.x;
            u_xlat7.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat31 = dot(u_xlat7.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat31 = fract(u_xlat31);
            u_xlat31 = u_xlat31 * 52.9829178;
            u_xlat31 = fract(u_xlat31);
            u_xlat31 = u_xlat31 * 6.28318548;
            u_xlat7.x = sin(u_xlat31);
            u_xlat8.x = cos(u_xlat31);
            u_xlat3 = u_xlat7.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.399062157, -0.768907249) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati17.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati17.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati17.xy));
            u_xlati17.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati17.xy));
            if(u_xlati17.x != 0) {
                u_xlat17.z = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat31 = u_xlat2.w * 0.00200000009;
                u_xlat31 = max(u_xlat31, 0.000500000024);
                u_xlat31 = (-u_xlat31) + u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb31 = !!(u_xlat17.z<u_xlat31);
#else
                u_xlatb31 = u_xlat17.z<u_xlat31;
#endif
                u_xlat17.x = 1.0;
                u_xlat17.xz = bool(u_xlatb31) ? u_xlat17.xz : vec2(0.0, 0.0);
            } else {
                u_xlat17.x = float(0.0);
                u_xlat17.z = float(0.0);
            }
            if(u_xlati17.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.929388702, 0.293877602) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.457714319, -0.879124641) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.276768446, 0.756483793) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat4.xy = u_xlat8.xx * vec2(0.443233252, 0.53742981) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.975115538, -0.4737342) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.418930233, 0.190901875) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.997065067, 0.914375901) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat4.xy = u_xlat8.xx * vec2(0.199841261, 0.143831611) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.78641367, -0.1410079) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati11.xz = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati11.xz = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati11.xz));
            u_xlati11.xz = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati11.xz));
            if(u_xlati11.x != 0) {
                u_xlat11.x = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat11.x<u_xlat27);
#else
                u_xlatb27 = u_xlat11.x<u_xlat27;
#endif
                u_xlat9.y = u_xlat11.x + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati11.z != 0) {
                u_xlat11.x = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat31 = u_xlat2.w * 0.00200000009;
                u_xlat31 = max(u_xlat31, 0.000500000024);
                u_xlat31 = (-u_xlat31) + u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb31 = !!(u_xlat11.x<u_xlat31);
#else
                u_xlatb31 = u_xlat11.x<u_xlat31;
#endif
                u_xlat9.y = u_xlat11.x + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb31)) ? u_xlat9.xy : u_xlat17.xz;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb11 = !!(0.0<u_xlat17.x);
#else
            u_xlatb11 = 0.0<u_xlat17.x;
#endif
            u_xlat31 = u_xlat17.z / u_xlat17.x;
            u_xlat31 = u_xlatb11 ? u_xlat31 : float(0.0);
            u_xlat31 = (-u_xlat31) + u_xlat2.w;
            u_xlat31 = u_xlat31 * _PCSSLightSize;
            u_xlat21.x = max(u_xlat11.y, u_xlat31);
            u_xlat21.x = max(u_xlat21.x, 1.0);
            u_xlat21.x = min(u_xlat21.x, 20.0);
            u_xlat11.x = (u_xlatb11) ? u_xlat21.x : 1.0;
            u_xlat11.x = u_xlat11.x * _ShadowMapTexture_TexelSize.x;
            u_xlati21 = max(_PCSSSampleCount, 4);
            u_xlati21 = min(u_xlati21, 16);
            u_xlat16_6.x = float(0.0);
            u_xlat16_16 = float(0.0);
            u_xlati31 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb17 = !!(u_xlati31>=16);
#else
                u_xlatb17 = u_xlati31>=16;
#endif
                if(u_xlatb17){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb17 = !!(u_xlati31<u_xlati21);
#else
                u_xlatb17 = u_xlati31<u_xlati21;
#endif
                if(u_xlatb17){
                    u_xlat17.xy = u_xlat7.xx * ImmCB_0[u_xlati31].yx;
                    u_xlat9.x = ImmCB_0[u_xlati31].x * u_xlat8.x + (-u_xlat17.x);
                    u_xlat9.y = ImmCB_0[u_xlati31].y * u_xlat8.x + u_xlat17.y;
                    u_xlat17.xy = u_xlat9.xy * u_xlat11.xx + u_xlat2.xy;
                    u_xlatb18.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat17.xyxx).xy;
                    u_xlatb9.xy = lessThan(u_xlat17.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb37 = u_xlatb18.x && u_xlatb9.x;
                    u_xlatb37 = u_xlatb18.y && u_xlatb37;
                    u_xlatb37 = u_xlatb9.y && u_xlatb37;
                    if(!u_xlatb37){
                        u_xlati37 = u_xlati31 + 1;
                        u_xlati31 = u_xlati37;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat17.xy,u_xlat2.w);
                    u_xlat10_17 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_6.x = u_xlat16_6.x + u_xlat10_17;
                    u_xlat16_16 = u_xlat16_16 + 1.0;
                }
                u_xlati31 = u_xlati31 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb11 = !!(0.0<u_xlat16_16);
#else
            u_xlatb11 = 0.0<u_xlat16_16;
#endif
            u_xlat16_6.x = u_xlat16_6.x / u_xlat16_16;
            u_xlat21.xy = (-u_xlat2.xy) + vec2(1.0, 1.0);
            u_xlat21.xy = min(u_xlat21.xy, u_xlat2.xy);
            u_xlat21.x = min(u_xlat21.y, u_xlat21.x);
            u_xlat21.x = u_xlat21.x * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
            u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
            u_xlat31 = u_xlat16_6.x + -1.0;
            u_xlat11.x = u_xlatb11 ? u_xlat31 : float(0.0);
            u_xlat11.x = u_xlat21.x * u_xlat11.x + 1.0;
            u_xlat16_11 = u_xlat11.x;
        } else {
            u_xlat16_11 = 1.0;
        }
        u_xlat16_6.x = (-u_xlat16_30) + 1.0;
        u_xlat16_30 = u_xlat16_11 * u_xlat16_6.x + u_xlat16_30;
        u_xlat30 = u_xlat16_30;
    } else {
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec4 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat7.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat17.x = (-u_xlat16_6.x) + 1.0;
        u_xlat30 = u_xlat7.x * u_xlat17.x + u_xlat16_6.x;
    }
    u_xlat7.x = (-u_xlat30) + 1.0;
    u_xlat7.x = (-u_xlat7.x) * _shadowStrength + 1.0;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = max(u_xlat1, u_xlat7.x);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat17.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat17.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat7.xyz;
    u_xlat37 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat7.xyz = (-u_xlat16_0.xyz) * u_xlat7.xyz + _FogColor.zxy;
    u_xlat7.xyz = vec3(u_xlat37) * u_xlat7.xyz + u_xlat16_6.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = log2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat7.xz * vec2(15.0, 0.9375);
    u_xlat37 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat7.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat37 * 0.0625 + u_xlat0.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat17.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat17.xy, 0.0).xyz;
    u_xlat7.x = u_xlat7.x * 15.0 + (-u_xlat37);
    u_xlat17.xyz = (-u_xlat16_8.xyz) + u_xlat16_9.xyz;
    u_xlat7.xyz = u_xlat7.xxx * u_xlat17.xyz + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(_shadowVector.x==1.0);
#else
    u_xlatb37 = _shadowVector.x==1.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb37)) ? vec3(u_xlat1) : u_xlat7.xyz;
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
vec4 ImmCB_0[16];
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
UNITY_LOCATION(2) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(7) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump float u_xlat16_11;
vec3 u_xlat12;
int u_xlati12;
mediump float u_xlat16_16;
vec2 u_xlat17;
mediump vec2 u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
float u_xlat22;
ivec2 u_xlati22;
bool u_xlatb22;
bvec2 u_xlatb28;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat10_32;
int u_xlati32;
bool u_xlatb32;
mediump float u_xlat16_33;
float u_xlat37;
bool u_xlatb37;
void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_0.xy);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.zxy / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz;
    u_xlat16_3.xyz = (u_xlatb2.x) ? u_xlat16_3.xyz : u_xlat16_4.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_20.x = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_20.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.5<_LMisCompressed);
#else
    u_xlatb31 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.zxy / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb31)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightMapColor.zxy;
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb1 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_20.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_1.x = texture(_CuEm_Mask, u_xlat16_20.xy).x;
    u_xlat16_11 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_2.xzw = texture(_normalMap, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_30 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_30) + vs_TEXCOORD2.yzx;
    u_xlat21 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xzw = vec3(u_xlat21) * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat2.xzw * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat2.zwx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat2.w;
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_0.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat2.x;
    u_xlat9.y = u_xlat7.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_0.xyz, u_xlat9.xyz);
    u_xlat7.x = u_xlat2.z;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_0.xyz, u_xlat7.xyz);
    u_xlat21 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xzw = vec3(u_xlat21) * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat7.xyz;
    u_xlat16_30 = dot((-u_xlat16_0.xyz), u_xlat2.xzw);
    u_xlat16_30 = u_xlat16_30 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat2.xzw * (-vec3(u_xlat16_30)) + (-u_xlat16_0.xyz);
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat16_7.xyz = texture(_CubeMap, u_xlat16_0.xyz).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb21 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_20.x = (u_xlatb21) ? (-u_xlat16_0.z) : u_xlat16_0.z;
    u_xlat16_20.x = u_xlat16_20.x + 1.0;
    u_xlat16_20.x = sqrt(u_xlat16_20.x);
    u_xlat16_20.x = u_xlat16_20.x * 2.82842708;
    u_xlat16_0.xz = u_xlat16_0.xy / u_xlat16_20.xx;
    u_xlat16_0.xz = u_xlat16_0.xz * _Cube_Vector.zz;
    u_xlat16_0.xz = u_xlat16_0.xz * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_8.xyz = texture(_Matcap, u_xlat16_0.xz).xyz;
    u_xlat16_0.xzw = (-u_xlat16_8.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_0.xzw = u_xlat16_8.zxy / u_xlat16_0.xzw;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_8.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.zxy;
    u_xlat16_0.xzw = (u_xlatb2.y) ? u_xlat16_0.xzw : u_xlat16_5.xyz;
    u_xlat16_33 = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * u_xlat16_7.zxy;
    u_xlat16_0.xzw = u_xlat16_0.xzw * _CuEm_Vector.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.xzw * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xzw = log2(u_xlat16_0.xzw);
    u_xlat16_0.xzw = u_xlat16_0.xzw * _Cube_Vector.xxx;
    u_xlat16_0.xzw = exp2(u_xlat16_0.xzw);
    u_xlat16_33 = u_xlat16_1.x * _CuEm_Vector.x;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_33);
    u_xlat16_10 = u_xlat16_0.y * _Cube_Vector.y + 1.0;
    u_xlat16_10 = u_xlat16_10 + (-_Cube_Vector.y);
    u_xlat16_10 = u_xlat16_10 * 0.5 + 0.5;
    u_xlat16_0.xyz = vec3(u_xlat16_10) * u_xlat16_0.xzw;
    u_xlat16_30 = u_xlat16_11 * _CuEm_Vector.y;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
    u_xlat16_5.xyz = u_xlat16_0.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * _MainColor.zxy + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb1 = _ShadowBias.z!=0.0;
#endif
    u_xlat11.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat12.xxx;
    u_xlat11.x = dot(u_xlat2.xzw, u_xlat11.xyz);
    u_xlat11.x = (-u_xlat11.x) * u_xlat11.x + 1.0;
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x * _ShadowBias.z;
    u_xlat11.xyz = (-u_xlat2.xzw) * u_xlat11.xxx + vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat11.xyz : vs_TEXCOORD3.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
    u_xlat3 = u_xlat1.yyyy * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat5 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat1.z + (-u_xlat2.x);
    u_xlat12.x = max((-u_xlat1.w), u_xlat2.x);
    u_xlat12.x = (-u_xlat2.x) + u_xlat12.x;
    u_xlat1.z = _ShadowBias.y * u_xlat12.x + u_xlat2.x;
    u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb21 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb21){
        u_xlat16_30 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(u_xlat1.w<1.0);
#else
        u_xlatb21 = u_xlat1.w<1.0;
#endif
        if(u_xlatb21){
            u_xlat2.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat21 = max(u_xlat2.x, 2.0);
            u_xlat21 = min(u_xlat21, 30.0);
            u_xlat21 = u_xlat21 * _ShadowMapTexture_TexelSize.x;
            u_xlat2.xz = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat2.x = dot(u_xlat2.xz, vec2(0.0671105608, 0.00583714992));
            u_xlat2.x = fract(u_xlat2.x);
            u_xlat2.x = u_xlat2.x * 52.9829178;
            u_xlat2.x = fract(u_xlat2.x);
            u_xlat2.x = u_xlat2.x * 6.28318548;
            u_xlat7.x = cos(u_xlat2.x);
            u_xlat2.x = sin(u_xlat2.x);
            u_xlat3 = u_xlat2.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.399062157, -0.768907249) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat17.y = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat22 = u_xlat1.w * 0.00200000009;
                u_xlat22 = max(u_xlat22, 0.000500000024);
                u_xlat22 = u_xlat1.w + (-u_xlat22);
#ifdef UNITY_ADRENO_ES3
                u_xlatb22 = !!(u_xlat17.y<u_xlat22);
#else
                u_xlatb22 = u_xlat17.y<u_xlat22;
#endif
                u_xlat17.x = 1.0;
                u_xlat17.xy = bool(u_xlatb22) ? u_xlat17.xy : vec2(0.0, 0.0);
            } else {
                u_xlat17.x = float(0.0);
                u_xlat17.y = float(0.0);
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.929388702, 0.293877602) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.457714319, -0.879124641) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.276768446, 0.756483793) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat4.xy = u_xlat7.xx * vec2(0.443233252, 0.53742981) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.975115538, -0.4737342) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.418930233, 0.190901875) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.997065067, 0.914375901) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat4.xy = u_xlat7.xx * vec2(0.199841261, 0.143831611) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.78641367, -0.1410079) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat21 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat22 = u_xlat1.w * 0.00200000009;
                u_xlat22 = max(u_xlat22, 0.000500000024);
                u_xlat22 = u_xlat1.w + (-u_xlat22);
#ifdef UNITY_ADRENO_ES3
                u_xlatb22 = !!(u_xlat21<u_xlat22);
#else
                u_xlatb22 = u_xlat21<u_xlat22;
#endif
                u_xlat8.y = u_xlat21 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb22)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat21 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat22 = u_xlat1.w * 0.00200000009;
                u_xlat22 = max(u_xlat22, 0.000500000024);
                u_xlat22 = u_xlat1.w + (-u_xlat22);
#ifdef UNITY_ADRENO_ES3
                u_xlatb22 = !!(u_xlat21<u_xlat22);
#else
                u_xlatb22 = u_xlat21<u_xlat22;
#endif
                u_xlat8.y = u_xlat21 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb22)) ? u_xlat8.xy : u_xlat17.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb21 = !!(0.0<u_xlat17.x);
#else
            u_xlatb21 = 0.0<u_xlat17.x;
#endif
            u_xlat22 = u_xlat17.y / u_xlat17.x;
            u_xlat22 = u_xlatb21 ? u_xlat22 : float(0.0);
            u_xlat22 = u_xlat1.w + (-u_xlat22);
            u_xlat22 = u_xlat22 * _PCSSLightSize;
            u_xlat12.x = max(u_xlat2.y, u_xlat22);
            u_xlat12.x = max(u_xlat12.x, 1.0);
            u_xlat12.x = min(u_xlat12.x, 20.0);
            u_xlat21 = (u_xlatb21) ? u_xlat12.x : 1.0;
            u_xlat21 = u_xlat21 * _ShadowMapTexture_TexelSize.x;
            u_xlati12 = max(_PCSSSampleCount, 4);
            u_xlati12 = min(u_xlati12, 16);
            u_xlat16_6.x = float(0.0);
            u_xlat16_16 = float(0.0);
            u_xlati22.x = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlati22.x>=16);
#else
                u_xlatb32 = u_xlati22.x>=16;
#endif
                if(u_xlatb32){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlati22.x<u_xlati12);
#else
                u_xlatb32 = u_xlati22.x<u_xlati12;
#endif
                if(u_xlatb32){
                    u_xlat17.xy = u_xlat2.xx * ImmCB_0[u_xlati22.x].yx;
                    u_xlat8.x = ImmCB_0[u_xlati22.x].x * u_xlat7.x + (-u_xlat17.x);
                    u_xlat8.y = ImmCB_0[u_xlati22.x].y * u_xlat7.x + u_xlat17.y;
                    u_xlat17.xy = u_xlat8.xy * vec2(u_xlat21) + u_xlat1.xy;
                    u_xlatb8.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat17.xyxx).xy;
                    u_xlatb28.xy = lessThan(u_xlat17.xyxy, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026)).xy;
                    u_xlatb32 = u_xlatb28.x && u_xlatb8.x;
                    u_xlatb32 = u_xlatb8.y && u_xlatb32;
                    u_xlatb32 = u_xlatb28.y && u_xlatb32;
                    if(!u_xlatb32){
                        u_xlati32 = u_xlati22.x + 1;
                        u_xlati22.x = u_xlati32;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat17.xy,u_xlat1.w);
                    u_xlat10_32 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_6.x = u_xlat10_32 + u_xlat16_6.x;
                    u_xlat16_16 = u_xlat16_16 + 1.0;
                }
                u_xlati22.x = u_xlati22.x + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb21 = !!(0.0<u_xlat16_16);
#else
            u_xlatb21 = 0.0<u_xlat16_16;
#endif
            u_xlat16_6.x = u_xlat16_6.x / u_xlat16_16;
            u_xlat2.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
            u_xlat2.xy = min(u_xlat1.xy, u_xlat2.xy);
            u_xlat2.x = min(u_xlat2.y, u_xlat2.x);
            u_xlat2.x = u_xlat2.x * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
            u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
            u_xlat12.x = u_xlat16_6.x + -1.0;
            u_xlat21 = u_xlatb21 ? u_xlat12.x : float(0.0);
            u_xlat21 = u_xlat2.x * u_xlat21 + 1.0;
            u_xlat16_21 = u_xlat21;
        } else {
            u_xlat16_21 = 1.0;
        }
        u_xlat16_6.x = (-u_xlat16_30) + 1.0;
        u_xlat16_30 = u_xlat16_21 * u_xlat16_6.x + u_xlat16_30;
        u_xlat30 = u_xlat16_30;
    } else {
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
        vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat1.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat1.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat1.xyw + u_xlat7.xyz;
        vec3 txVec4 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat12.x = (-u_xlat16_6.x) + 1.0;
        u_xlat30 = u_xlat2.x * u_xlat12.x + u_xlat16_6.x;
    }
    u_xlat2.x = (-u_xlat30) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat12.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat12.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat32 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat2.xyz = (-u_xlat16_0.xyz) * u_xlat2.xyz + _FogColor.zxy;
    u_xlat2.xyz = vec3(u_xlat32) * u_xlat2.xyz + u_xlat16_6.xyz;
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
    u_xlat32 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat32 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat12.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat12.xy, 0.0).xyz;
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat32);
    u_xlat12.xyz = (-u_xlat16_7.xyz) + u_xlat16_8.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat12.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
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
vec4 ImmCB_0[16];
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
UNITY_LOCATION(2) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(7) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump float u_xlat16_11;
vec3 u_xlat12;
int u_xlati12;
mediump float u_xlat16_16;
vec2 u_xlat17;
mediump vec2 u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
float u_xlat22;
ivec2 u_xlati22;
bool u_xlatb22;
bvec2 u_xlatb28;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat10_32;
int u_xlati32;
bool u_xlatb32;
mediump float u_xlat16_33;
float u_xlat37;
bool u_xlatb37;
void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_0.xy);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.zxy / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz;
    u_xlat16_3.xyz = (u_xlatb2.x) ? u_xlat16_3.xyz : u_xlat16_4.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_20.x = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_20.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.5<_LMisCompressed);
#else
    u_xlatb31 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.zxy / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb31)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightMapColor.zxy;
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb1 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_20.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_1.x = texture(_CuEm_Mask, u_xlat16_20.xy).x;
    u_xlat16_11 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_2.xzw = texture(_normalMap, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_30 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_30) + vs_TEXCOORD2.yzx;
    u_xlat21 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xzw = vec3(u_xlat21) * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat2.xzw * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat2.zwx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat2.w;
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_0.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat2.x;
    u_xlat9.y = u_xlat7.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_0.xyz, u_xlat9.xyz);
    u_xlat7.x = u_xlat2.z;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_0.xyz, u_xlat7.xyz);
    u_xlat21 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xzw = vec3(u_xlat21) * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat7.xyz;
    u_xlat16_30 = dot((-u_xlat16_0.xyz), u_xlat2.xzw);
    u_xlat16_30 = u_xlat16_30 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat2.xzw * (-vec3(u_xlat16_30)) + (-u_xlat16_0.xyz);
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat16_7.xyz = texture(_CubeMap, u_xlat16_0.xyz).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb21 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_20.x = (u_xlatb21) ? (-u_xlat16_0.z) : u_xlat16_0.z;
    u_xlat16_20.x = u_xlat16_20.x + 1.0;
    u_xlat16_20.x = sqrt(u_xlat16_20.x);
    u_xlat16_20.x = u_xlat16_20.x * 2.82842708;
    u_xlat16_0.xz = u_xlat16_0.xy / u_xlat16_20.xx;
    u_xlat16_0.xz = u_xlat16_0.xz * _Cube_Vector.zz;
    u_xlat16_0.xz = u_xlat16_0.xz * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_8.xyz = texture(_Matcap, u_xlat16_0.xz).xyz;
    u_xlat16_0.xzw = (-u_xlat16_8.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_0.xzw = u_xlat16_8.zxy / u_xlat16_0.xzw;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_8.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.zxy;
    u_xlat16_0.xzw = (u_xlatb2.y) ? u_xlat16_0.xzw : u_xlat16_5.xyz;
    u_xlat16_33 = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * u_xlat16_7.zxy;
    u_xlat16_0.xzw = u_xlat16_0.xzw * _CuEm_Vector.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.xzw * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xzw = log2(u_xlat16_0.xzw);
    u_xlat16_0.xzw = u_xlat16_0.xzw * _Cube_Vector.xxx;
    u_xlat16_0.xzw = exp2(u_xlat16_0.xzw);
    u_xlat16_33 = u_xlat16_1.x * _CuEm_Vector.x;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_33);
    u_xlat16_10 = u_xlat16_0.y * _Cube_Vector.y + 1.0;
    u_xlat16_10 = u_xlat16_10 + (-_Cube_Vector.y);
    u_xlat16_10 = u_xlat16_10 * 0.5 + 0.5;
    u_xlat16_0.xyz = vec3(u_xlat16_10) * u_xlat16_0.xzw;
    u_xlat16_30 = u_xlat16_11 * _CuEm_Vector.y;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
    u_xlat16_5.xyz = u_xlat16_0.xyz * _CubeColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * _CubeColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * _MainColor.zxy + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb1 = _ShadowBias.z!=0.0;
#endif
    u_xlat11.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat12.xxx;
    u_xlat11.x = dot(u_xlat2.xzw, u_xlat11.xyz);
    u_xlat11.x = (-u_xlat11.x) * u_xlat11.x + 1.0;
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x * _ShadowBias.z;
    u_xlat11.xyz = (-u_xlat2.xzw) * u_xlat11.xxx + vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat11.xyz : vs_TEXCOORD3.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
    u_xlat3 = u_xlat1.yyyy * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat5 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat1.z + (-u_xlat2.x);
    u_xlat12.x = max((-u_xlat1.w), u_xlat2.x);
    u_xlat12.x = (-u_xlat2.x) + u_xlat12.x;
    u_xlat1.z = _ShadowBias.y * u_xlat12.x + u_xlat2.x;
    u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb21 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb21){
        u_xlat16_30 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(u_xlat1.w<1.0);
#else
        u_xlatb21 = u_xlat1.w<1.0;
#endif
        if(u_xlatb21){
            u_xlat2.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat21 = max(u_xlat2.x, 2.0);
            u_xlat21 = min(u_xlat21, 30.0);
            u_xlat21 = u_xlat21 * _ShadowMapTexture_TexelSize.x;
            u_xlat2.xz = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat2.x = dot(u_xlat2.xz, vec2(0.0671105608, 0.00583714992));
            u_xlat2.x = fract(u_xlat2.x);
            u_xlat2.x = u_xlat2.x * 52.9829178;
            u_xlat2.x = fract(u_xlat2.x);
            u_xlat2.x = u_xlat2.x * 6.28318548;
            u_xlat7.x = cos(u_xlat2.x);
            u_xlat2.x = sin(u_xlat2.x);
            u_xlat3 = u_xlat2.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.399062157, -0.768907249) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat17.y = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat22 = u_xlat1.w * 0.00200000009;
                u_xlat22 = max(u_xlat22, 0.000500000024);
                u_xlat22 = u_xlat1.w + (-u_xlat22);
#ifdef UNITY_ADRENO_ES3
                u_xlatb22 = !!(u_xlat17.y<u_xlat22);
#else
                u_xlatb22 = u_xlat17.y<u_xlat22;
#endif
                u_xlat17.x = 1.0;
                u_xlat17.xy = bool(u_xlatb22) ? u_xlat17.xy : vec2(0.0, 0.0);
            } else {
                u_xlat17.x = float(0.0);
                u_xlat17.y = float(0.0);
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.929388702, 0.293877602) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.457714319, -0.879124641) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.276768446, 0.756483793) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat4.xy = u_xlat7.xx * vec2(0.443233252, 0.53742981) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.975115538, -0.4737342) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.418930233, 0.190901875) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.997065067, 0.914375901) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat4.xy = u_xlat7.xx * vec2(0.199841261, 0.143831611) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.78641367, -0.1410079) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat21 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat22 = u_xlat1.w * 0.00200000009;
                u_xlat22 = max(u_xlat22, 0.000500000024);
                u_xlat22 = u_xlat1.w + (-u_xlat22);
#ifdef UNITY_ADRENO_ES3
                u_xlatb22 = !!(u_xlat21<u_xlat22);
#else
                u_xlatb22 = u_xlat21<u_xlat22;
#endif
                u_xlat8.y = u_xlat21 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb22)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat21 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat22 = u_xlat1.w * 0.00200000009;
                u_xlat22 = max(u_xlat22, 0.000500000024);
                u_xlat22 = u_xlat1.w + (-u_xlat22);
#ifdef UNITY_ADRENO_ES3
                u_xlatb22 = !!(u_xlat21<u_xlat22);
#else
                u_xlatb22 = u_xlat21<u_xlat22;
#endif
                u_xlat8.y = u_xlat21 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb22)) ? u_xlat8.xy : u_xlat17.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb21 = !!(0.0<u_xlat17.x);
#else
            u_xlatb21 = 0.0<u_xlat17.x;
#endif
            u_xlat22 = u_xlat17.y / u_xlat17.x;
            u_xlat22 = u_xlatb21 ? u_xlat22 : float(0.0);
            u_xlat22 = u_xlat1.w + (-u_xlat22);
            u_xlat22 = u_xlat22 * _PCSSLightSize;
            u_xlat12.x = max(u_xlat2.y, u_xlat22);
            u_xlat12.x = max(u_xlat12.x, 1.0);
            u_xlat12.x = min(u_xlat12.x, 20.0);
            u_xlat21 = (u_xlatb21) ? u_xlat12.x : 1.0;
            u_xlat21 = u_xlat21 * _ShadowMapTexture_TexelSize.x;
            u_xlati12 = max(_PCSSSampleCount, 4);
            u_xlati12 = min(u_xlati12, 16);
            u_xlat16_6.x = float(0.0);
            u_xlat16_16 = float(0.0);
            u_xlati22.x = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlati22.x>=16);
#else
                u_xlatb32 = u_xlati22.x>=16;
#endif
                if(u_xlatb32){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlati22.x<u_xlati12);
#else
                u_xlatb32 = u_xlati22.x<u_xlati12;
#endif
                if(u_xlatb32){
                    u_xlat17.xy = u_xlat2.xx * ImmCB_0[u_xlati22.x].yx;
                    u_xlat8.x = ImmCB_0[u_xlati22.x].x * u_xlat7.x + (-u_xlat17.x);
                    u_xlat8.y = ImmCB_0[u_xlati22.x].y * u_xlat7.x + u_xlat17.y;
                    u_xlat17.xy = u_xlat8.xy * vec2(u_xlat21) + u_xlat1.xy;
                    u_xlatb8.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat17.xyxx).xy;
                    u_xlatb28.xy = lessThan(u_xlat17.xyxy, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026)).xy;
                    u_xlatb32 = u_xlatb28.x && u_xlatb8.x;
                    u_xlatb32 = u_xlatb8.y && u_xlatb32;
                    u_xlatb32 = u_xlatb28.y && u_xlatb32;
                    if(!u_xlatb32){
                        u_xlati32 = u_xlati22.x + 1;
                        u_xlati22.x = u_xlati32;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat17.xy,u_xlat1.w);
                    u_xlat10_32 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_6.x = u_xlat10_32 + u_xlat16_6.x;
                    u_xlat16_16 = u_xlat16_16 + 1.0;
                }
                u_xlati22.x = u_xlati22.x + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb21 = !!(0.0<u_xlat16_16);
#else
            u_xlatb21 = 0.0<u_xlat16_16;
#endif
            u_xlat16_6.x = u_xlat16_6.x / u_xlat16_16;
            u_xlat2.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
            u_xlat2.xy = min(u_xlat1.xy, u_xlat2.xy);
            u_xlat2.x = min(u_xlat2.y, u_xlat2.x);
            u_xlat2.x = u_xlat2.x * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
            u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
            u_xlat12.x = u_xlat16_6.x + -1.0;
            u_xlat21 = u_xlatb21 ? u_xlat12.x : float(0.0);
            u_xlat21 = u_xlat2.x * u_xlat21 + 1.0;
            u_xlat16_21 = u_xlat21;
        } else {
            u_xlat16_21 = 1.0;
        }
        u_xlat16_6.x = (-u_xlat16_30) + 1.0;
        u_xlat16_30 = u_xlat16_21 * u_xlat16_6.x + u_xlat16_30;
        u_xlat30 = u_xlat16_30;
    } else {
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
        vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat1.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat1.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat1.xyw + u_xlat7.xyz;
        vec3 txVec4 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat12.x = (-u_xlat16_6.x) + 1.0;
        u_xlat30 = u_xlat2.x * u_xlat12.x + u_xlat16_6.x;
    }
    u_xlat2.x = (-u_xlat30) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat12.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat12.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat32 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat2.xyz = (-u_xlat16_0.xyz) * u_xlat2.xyz + _FogColor.zxy;
    u_xlat2.xyz = vec3(u_xlat32) * u_xlat2.xyz + u_xlat16_6.xyz;
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
    u_xlat32 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat32 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat12.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat12.xy, 0.0).xyz;
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat32);
    u_xlat12.xyz = (-u_xlat16_7.xyz) + u_xlat16_8.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat12.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
uniform 	mediump float _isAdaptive;
uniform 	mediump vec4 _shadowVector;
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
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump vec3 u_xlat16_14;
vec2 u_xlat18;
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
    u_xlat0.x = min(_MainLightDirectionAndAngleOffset.y, 0.879999995);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat9.x = _MainLightDirectionAndAngleOffset.y * -1.62 + 2.5;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 18.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive));
#else
    u_xlatb9 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive);
#endif
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : _shadowVector.y;
    u_xlat16_32 = (u_xlatb9) ? 1.0 : _shadowVector.z;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat9.xy = vs_TEXCOORD3.xz + vec2(-312.5, -1.25);
    u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_32;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat9.x = max(u_xlat0.x, 1.0);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat2.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat9.xyz * u_xlat16_5.xyz;
    u_xlat9.xyz = (-u_xlat16_5.xyz) * u_xlat9.xyz + _FogColor.zxy;
    u_xlat2.x = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xyz + u_xlat16_6.xyz;
    u_xlat9.xyz = u_xlat9.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat9.xz * vec2(15.0, 0.9375);
    u_xlat2.x = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat9.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat9.x = u_xlat9.x * 15.0 + (-u_xlat2.x);
    u_xlat1.x = u_xlat2.x * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat18.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat18.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
    u_xlat9.xyz = u_xlat9.xxx * u_xlat3.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_shadowVector.x==1.0);
#else
    u_xlatb2 = _shadowVector.x==1.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat0.xxx : u_xlat9.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
uniform 	mediump float _isAdaptive;
uniform 	mediump vec4 _shadowVector;
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
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump vec3 u_xlat16_14;
vec2 u_xlat18;
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
    u_xlat0.x = min(_MainLightDirectionAndAngleOffset.y, 0.879999995);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat9.x = _MainLightDirectionAndAngleOffset.y * -1.62 + 2.5;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 18.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive));
#else
    u_xlatb9 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive);
#endif
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : _shadowVector.y;
    u_xlat16_32 = (u_xlatb9) ? 1.0 : _shadowVector.z;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat9.xy = vs_TEXCOORD3.xz + vec2(-312.5, -1.25);
    u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_32;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat9.x = max(u_xlat0.x, 1.0);
    u_xlat16_6.xyz = _shadowColor.zxy * _shadowColor.www;
    u_xlat2.xyz = (-_shadowColor.www) * _shadowColor.zxy + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat9.xyz * u_xlat16_5.xyz;
    u_xlat9.xyz = (-u_xlat16_5.xyz) * u_xlat9.xyz + _FogColor.zxy;
    u_xlat2.x = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xyz + u_xlat16_6.xyz;
    u_xlat9.xyz = u_xlat9.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat9.xz * vec2(15.0, 0.9375);
    u_xlat2.x = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat9.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat9.x = u_xlat9.x * 15.0 + (-u_xlat2.x);
    u_xlat1.x = u_xlat2.x * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat18.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat18.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
    u_xlat9.xyz = u_xlat9.xxx * u_xlat3.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_shadowVector.x==1.0);
#else
    u_xlatb2 = _shadowVector.x==1.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat0.xxx : u_xlat9.xyz;
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
vec4 ImmCB_0[16];
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
uniform 	mediump float _isAdaptive;
uniform 	mediump vec4 _shadowVector;
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
UNITY_LOCATION(2) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(7) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump float u_xlat16_11;
ivec3 u_xlati11;
bool u_xlatb11;
mediump float u_xlat16_16;
vec3 u_xlat17;
mediump float u_xlat10_17;
ivec2 u_xlati17;
bool u_xlatb17;
ivec2 u_xlati18;
bvec2 u_xlatb18;
mediump vec2 u_xlat16_20;
vec2 u_xlat21;
int u_xlati21;
bool u_xlatb21;
float u_xlat27;
bool u_xlatb27;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat31;
int u_xlati31;
bool u_xlatb31;
mediump float u_xlat16_33;
float u_xlat37;
int u_xlati37;
bool u_xlatb37;
void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_0.xy);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = (u_xlatb2.x) ? u_xlat16_3.xyz : u_xlat16_4.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_20.x = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_20.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.5<_LMisCompressed);
#else
    u_xlatb31 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.xyz / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb31)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightMapColor.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb1 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_20.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_1.x = texture(_CuEm_Mask, u_xlat16_20.xy).x;
    u_xlat16_11 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_2.xzw = texture(_normalMap, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_30 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_30) + vs_TEXCOORD2.yzx;
    u_xlat21.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat21.x = max(u_xlat21.x, 1.17549435e-38);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat2.xzw = u_xlat21.xxx * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat2.xzw * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat2.zwx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat2.w;
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_0.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat2.x;
    u_xlat9.y = u_xlat7.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_0.xyz, u_xlat9.xyz);
    u_xlat7.x = u_xlat2.z;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_0.xyz, u_xlat7.xyz);
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat21.x = max(u_xlat21.x, 1.17549435e-38);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat2.xzw = u_xlat21.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat7.xyz;
    u_xlat16_30 = dot((-u_xlat16_0.xyz), u_xlat2.xzw);
    u_xlat16_30 = u_xlat16_30 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat2.xzw * (-vec3(u_xlat16_30)) + (-u_xlat16_0.xyz);
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat16_7.xyz = texture(_CubeMap, u_xlat16_0.xyz).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb21 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_20.x = (u_xlatb21) ? (-u_xlat16_0.z) : u_xlat16_0.z;
    u_xlat16_20.x = u_xlat16_20.x + 1.0;
    u_xlat16_20.x = sqrt(u_xlat16_20.x);
    u_xlat16_20.x = u_xlat16_20.x * 2.82842708;
    u_xlat16_0.xz = u_xlat16_0.xy / u_xlat16_20.xx;
    u_xlat16_0.xz = u_xlat16_0.xz * _Cube_Vector.zz;
    u_xlat16_0.xz = u_xlat16_0.xz * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_8.xyz = texture(_Matcap, u_xlat16_0.xz).xyz;
    u_xlat16_0.xzw = (-u_xlat16_8.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_0.xzw = u_xlat16_8.xyz / u_xlat16_0.xzw;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.xyz;
    u_xlat16_0.xzw = (u_xlatb2.y) ? u_xlat16_0.xzw : u_xlat16_5.xyz;
    u_xlat16_33 = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * u_xlat16_7.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xzw * _CuEm_Vector.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.xzw * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xzw = log2(u_xlat16_0.xzw);
    u_xlat16_0.xzw = u_xlat16_0.xzw * _Cube_Vector.xxx;
    u_xlat16_0.xzw = exp2(u_xlat16_0.xzw);
    u_xlat16_33 = u_xlat16_1.x * _CuEm_Vector.x;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_33);
    u_xlat16_10 = u_xlat16_0.y * _Cube_Vector.y + 1.0;
    u_xlat16_10 = u_xlat16_10 + (-_Cube_Vector.y);
    u_xlat16_10 = u_xlat16_10 * 0.5 + 0.5;
    u_xlat16_0.xyz = vec3(u_xlat16_10) * u_xlat16_0.xzw;
    u_xlat16_30 = u_xlat16_11 * _CuEm_Vector.y;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
    u_xlat16_5.xyz = u_xlat16_0.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * _MainColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive);
#endif
    u_xlat11.xy = vs_TEXCOORD3.xz + vec2(-312.5, -1.25);
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat21.x = min(_MainLightDirectionAndAngleOffset.y, 0.879999995);
    u_xlat21.x = (-u_xlat21.x) + 1.0;
    u_xlat31 = _MainLightDirectionAndAngleOffset.y * -1.62 + 2.5;
    u_xlat21.x = log2(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * u_xlat31;
    u_xlat21.x = exp2(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * 18.0;
    u_xlat21.x = (u_xlatb1) ? u_xlat21.x : _shadowVector.y;
    u_xlat21.x = max(u_xlat21.x, 0.0);
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat11.x = u_xlat21.x * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat21.x = u_xlat11.x * -2.0 + 3.0;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat21.x;
    u_xlat16_30 = (u_xlatb1) ? 1.0 : _shadowVector.z;
    u_xlat1 = log2(u_xlat11.x);
    u_xlat1 = u_xlat16_30 * u_xlat1;
    u_xlat1 = exp2(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb11 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat7.xyz = u_xlat21.xxx * u_xlat7.xyz;
    u_xlat21.x = dot(u_xlat2.xzw, u_xlat7.xyz);
    u_xlat21.x = (-u_xlat21.x) * u_xlat21.x + 1.0;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * _ShadowBias.z;
    u_xlat2.xyz = (-u_xlat2.xzw) * u_xlat21.xxx + vs_TEXCOORD3.xyz;
    u_xlat11.xyz = (bool(u_xlatb11)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
    u_xlat3 = u_xlat11.yyyy * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat11.xxxx + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat11.zzzz + u_xlat2;
    u_xlat2 = u_xlat5 + u_xlat2;
    u_xlat11.x = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat11.x) + u_xlat2.z;
    u_xlat21.x = max((-u_xlat2.w), u_xlat11.x);
    u_xlat21.x = (-u_xlat11.x) + u_xlat21.x;
    u_xlat2.z = _ShadowBias.y * u_xlat21.x + u_xlat11.x;
    u_xlat11.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb11 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb11){
        u_xlat16_30 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat2.w<1.0);
#else
        u_xlatb11 = u_xlat2.w<1.0;
#endif
        if(u_xlatb11){
            u_xlat11.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat11.x = max(u_xlat11.x, 2.0);
            u_xlat11.x = min(u_xlat11.x, 30.0);
            u_xlat11.x = u_xlat11.x * _ShadowMapTexture_TexelSize.x;
            u_xlat7.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat31 = dot(u_xlat7.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat31 = fract(u_xlat31);
            u_xlat31 = u_xlat31 * 52.9829178;
            u_xlat31 = fract(u_xlat31);
            u_xlat31 = u_xlat31 * 6.28318548;
            u_xlat7.x = sin(u_xlat31);
            u_xlat8.x = cos(u_xlat31);
            u_xlat3 = u_xlat7.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.399062157, -0.768907249) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati17.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati17.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati17.xy));
            u_xlati17.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati17.xy));
            if(u_xlati17.x != 0) {
                u_xlat17.z = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat31 = u_xlat2.w * 0.00200000009;
                u_xlat31 = max(u_xlat31, 0.000500000024);
                u_xlat31 = (-u_xlat31) + u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb31 = !!(u_xlat17.z<u_xlat31);
#else
                u_xlatb31 = u_xlat17.z<u_xlat31;
#endif
                u_xlat17.x = 1.0;
                u_xlat17.xz = bool(u_xlatb31) ? u_xlat17.xz : vec2(0.0, 0.0);
            } else {
                u_xlat17.x = float(0.0);
                u_xlat17.z = float(0.0);
            }
            if(u_xlati17.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.929388702, 0.293877602) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.457714319, -0.879124641) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.276768446, 0.756483793) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat4.xy = u_xlat8.xx * vec2(0.443233252, 0.53742981) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.975115538, -0.4737342) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.418930233, 0.190901875) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.997065067, 0.914375901) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat4.xy = u_xlat8.xx * vec2(0.199841261, 0.143831611) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.78641367, -0.1410079) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati11.xz = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati11.xz = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati11.xz));
            u_xlati11.xz = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati11.xz));
            if(u_xlati11.x != 0) {
                u_xlat11.x = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat11.x<u_xlat27);
#else
                u_xlatb27 = u_xlat11.x<u_xlat27;
#endif
                u_xlat9.y = u_xlat11.x + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati11.z != 0) {
                u_xlat11.x = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat31 = u_xlat2.w * 0.00200000009;
                u_xlat31 = max(u_xlat31, 0.000500000024);
                u_xlat31 = (-u_xlat31) + u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb31 = !!(u_xlat11.x<u_xlat31);
#else
                u_xlatb31 = u_xlat11.x<u_xlat31;
#endif
                u_xlat9.y = u_xlat11.x + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb31)) ? u_xlat9.xy : u_xlat17.xz;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb11 = !!(0.0<u_xlat17.x);
#else
            u_xlatb11 = 0.0<u_xlat17.x;
#endif
            u_xlat31 = u_xlat17.z / u_xlat17.x;
            u_xlat31 = u_xlatb11 ? u_xlat31 : float(0.0);
            u_xlat31 = (-u_xlat31) + u_xlat2.w;
            u_xlat31 = u_xlat31 * _PCSSLightSize;
            u_xlat21.x = max(u_xlat11.y, u_xlat31);
            u_xlat21.x = max(u_xlat21.x, 1.0);
            u_xlat21.x = min(u_xlat21.x, 20.0);
            u_xlat11.x = (u_xlatb11) ? u_xlat21.x : 1.0;
            u_xlat11.x = u_xlat11.x * _ShadowMapTexture_TexelSize.x;
            u_xlati21 = max(_PCSSSampleCount, 4);
            u_xlati21 = min(u_xlati21, 16);
            u_xlat16_6.x = float(0.0);
            u_xlat16_16 = float(0.0);
            u_xlati31 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb17 = !!(u_xlati31>=16);
#else
                u_xlatb17 = u_xlati31>=16;
#endif
                if(u_xlatb17){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb17 = !!(u_xlati31<u_xlati21);
#else
                u_xlatb17 = u_xlati31<u_xlati21;
#endif
                if(u_xlatb17){
                    u_xlat17.xy = u_xlat7.xx * ImmCB_0[u_xlati31].yx;
                    u_xlat9.x = ImmCB_0[u_xlati31].x * u_xlat8.x + (-u_xlat17.x);
                    u_xlat9.y = ImmCB_0[u_xlati31].y * u_xlat8.x + u_xlat17.y;
                    u_xlat17.xy = u_xlat9.xy * u_xlat11.xx + u_xlat2.xy;
                    u_xlatb18.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat17.xyxx).xy;
                    u_xlatb9.xy = lessThan(u_xlat17.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb37 = u_xlatb18.x && u_xlatb9.x;
                    u_xlatb37 = u_xlatb18.y && u_xlatb37;
                    u_xlatb37 = u_xlatb9.y && u_xlatb37;
                    if(!u_xlatb37){
                        u_xlati37 = u_xlati31 + 1;
                        u_xlati31 = u_xlati37;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat17.xy,u_xlat2.w);
                    u_xlat10_17 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_6.x = u_xlat16_6.x + u_xlat10_17;
                    u_xlat16_16 = u_xlat16_16 + 1.0;
                }
                u_xlati31 = u_xlati31 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb11 = !!(0.0<u_xlat16_16);
#else
            u_xlatb11 = 0.0<u_xlat16_16;
#endif
            u_xlat16_6.x = u_xlat16_6.x / u_xlat16_16;
            u_xlat21.xy = (-u_xlat2.xy) + vec2(1.0, 1.0);
            u_xlat21.xy = min(u_xlat21.xy, u_xlat2.xy);
            u_xlat21.x = min(u_xlat21.y, u_xlat21.x);
            u_xlat21.x = u_xlat21.x * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
            u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
            u_xlat31 = u_xlat16_6.x + -1.0;
            u_xlat11.x = u_xlatb11 ? u_xlat31 : float(0.0);
            u_xlat11.x = u_xlat21.x * u_xlat11.x + 1.0;
            u_xlat16_11 = u_xlat11.x;
        } else {
            u_xlat16_11 = 1.0;
        }
        u_xlat16_6.x = (-u_xlat16_30) + 1.0;
        u_xlat16_30 = u_xlat16_11 * u_xlat16_6.x + u_xlat16_30;
        u_xlat30 = u_xlat16_30;
    } else {
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec4 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat7.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat17.x = (-u_xlat16_6.x) + 1.0;
        u_xlat30 = u_xlat7.x * u_xlat17.x + u_xlat16_6.x;
    }
    u_xlat7.x = (-u_xlat30) + 1.0;
    u_xlat7.x = (-u_xlat7.x) * _shadowStrength + 1.0;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = max(u_xlat1, u_xlat7.x);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat17.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat17.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat7.xyz;
    u_xlat37 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat7.xyz = (-u_xlat16_0.xyz) * u_xlat7.xyz + _FogColor.xyz;
    u_xlat7.xyz = vec3(u_xlat37) * u_xlat7.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(_shadowVector.x==1.0);
#else
    u_xlatb37 = _shadowVector.x==1.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb37)) ? vec3(u_xlat1) : u_xlat7.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
vec4 ImmCB_0[16];
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
uniform 	mediump float _isAdaptive;
uniform 	mediump vec4 _shadowVector;
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
UNITY_LOCATION(2) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(7) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump float u_xlat16_11;
ivec3 u_xlati11;
bool u_xlatb11;
mediump float u_xlat16_16;
vec3 u_xlat17;
mediump float u_xlat10_17;
ivec2 u_xlati17;
bool u_xlatb17;
ivec2 u_xlati18;
bvec2 u_xlatb18;
mediump vec2 u_xlat16_20;
vec2 u_xlat21;
int u_xlati21;
bool u_xlatb21;
float u_xlat27;
bool u_xlatb27;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat31;
int u_xlati31;
bool u_xlatb31;
mediump float u_xlat16_33;
float u_xlat37;
int u_xlati37;
bool u_xlatb37;
void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_0.xy);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = (u_xlatb2.x) ? u_xlat16_3.xyz : u_xlat16_4.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_20.x = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_20.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.5<_LMisCompressed);
#else
    u_xlatb31 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.xyz / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb31)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightMapColor.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb1 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_20.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_1.x = texture(_CuEm_Mask, u_xlat16_20.xy).x;
    u_xlat16_11 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_2.xzw = texture(_normalMap, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_30 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_30) + vs_TEXCOORD2.yzx;
    u_xlat21.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat21.x = max(u_xlat21.x, 1.17549435e-38);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat2.xzw = u_xlat21.xxx * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat2.xzw * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat2.zwx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat2.w;
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_0.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat2.x;
    u_xlat9.y = u_xlat7.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_0.xyz, u_xlat9.xyz);
    u_xlat7.x = u_xlat2.z;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_0.xyz, u_xlat7.xyz);
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat21.x = max(u_xlat21.x, 1.17549435e-38);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat2.xzw = u_xlat21.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat7.xyz;
    u_xlat16_30 = dot((-u_xlat16_0.xyz), u_xlat2.xzw);
    u_xlat16_30 = u_xlat16_30 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat2.xzw * (-vec3(u_xlat16_30)) + (-u_xlat16_0.xyz);
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat16_7.xyz = texture(_CubeMap, u_xlat16_0.xyz).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb21 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_20.x = (u_xlatb21) ? (-u_xlat16_0.z) : u_xlat16_0.z;
    u_xlat16_20.x = u_xlat16_20.x + 1.0;
    u_xlat16_20.x = sqrt(u_xlat16_20.x);
    u_xlat16_20.x = u_xlat16_20.x * 2.82842708;
    u_xlat16_0.xz = u_xlat16_0.xy / u_xlat16_20.xx;
    u_xlat16_0.xz = u_xlat16_0.xz * _Cube_Vector.zz;
    u_xlat16_0.xz = u_xlat16_0.xz * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_8.xyz = texture(_Matcap, u_xlat16_0.xz).xyz;
    u_xlat16_0.xzw = (-u_xlat16_8.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_0.xzw = u_xlat16_8.xyz / u_xlat16_0.xzw;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.xyz;
    u_xlat16_0.xzw = (u_xlatb2.y) ? u_xlat16_0.xzw : u_xlat16_5.xyz;
    u_xlat16_33 = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * u_xlat16_7.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xzw * _CuEm_Vector.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.xzw * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xzw = log2(u_xlat16_0.xzw);
    u_xlat16_0.xzw = u_xlat16_0.xzw * _Cube_Vector.xxx;
    u_xlat16_0.xzw = exp2(u_xlat16_0.xzw);
    u_xlat16_33 = u_xlat16_1.x * _CuEm_Vector.x;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_33);
    u_xlat16_10 = u_xlat16_0.y * _Cube_Vector.y + 1.0;
    u_xlat16_10 = u_xlat16_10 + (-_Cube_Vector.y);
    u_xlat16_10 = u_xlat16_10 * 0.5 + 0.5;
    u_xlat16_0.xyz = vec3(u_xlat16_10) * u_xlat16_0.xzw;
    u_xlat16_30 = u_xlat16_11 * _CuEm_Vector.y;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
    u_xlat16_5.xyz = u_xlat16_0.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * _MainColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive);
#endif
    u_xlat11.xy = vs_TEXCOORD3.xz + vec2(-312.5, -1.25);
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat21.x = min(_MainLightDirectionAndAngleOffset.y, 0.879999995);
    u_xlat21.x = (-u_xlat21.x) + 1.0;
    u_xlat31 = _MainLightDirectionAndAngleOffset.y * -1.62 + 2.5;
    u_xlat21.x = log2(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * u_xlat31;
    u_xlat21.x = exp2(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * 18.0;
    u_xlat21.x = (u_xlatb1) ? u_xlat21.x : _shadowVector.y;
    u_xlat21.x = max(u_xlat21.x, 0.0);
    u_xlat21.x = float(1.0) / u_xlat21.x;
    u_xlat11.x = u_xlat21.x * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat21.x = u_xlat11.x * -2.0 + 3.0;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat21.x;
    u_xlat16_30 = (u_xlatb1) ? 1.0 : _shadowVector.z;
    u_xlat1 = log2(u_xlat11.x);
    u_xlat1 = u_xlat16_30 * u_xlat1;
    u_xlat1 = exp2(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb11 = _ShadowBias.z!=0.0;
#endif
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat21.x = inversesqrt(u_xlat21.x);
    u_xlat7.xyz = u_xlat21.xxx * u_xlat7.xyz;
    u_xlat21.x = dot(u_xlat2.xzw, u_xlat7.xyz);
    u_xlat21.x = (-u_xlat21.x) * u_xlat21.x + 1.0;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * _ShadowBias.z;
    u_xlat2.xyz = (-u_xlat2.xzw) * u_xlat21.xxx + vs_TEXCOORD3.xyz;
    u_xlat11.xyz = (bool(u_xlatb11)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
    u_xlat3 = u_xlat11.yyyy * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat11.xxxx + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat11.zzzz + u_xlat2;
    u_xlat2 = u_xlat5 + u_xlat2;
    u_xlat11.x = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat11.x) + u_xlat2.z;
    u_xlat21.x = max((-u_xlat2.w), u_xlat11.x);
    u_xlat21.x = (-u_xlat11.x) + u_xlat21.x;
    u_xlat2.z = _ShadowBias.y * u_xlat21.x + u_xlat11.x;
    u_xlat11.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat11.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb11 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb11){
        u_xlat16_30 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat2.w<1.0);
#else
        u_xlatb11 = u_xlat2.w<1.0;
#endif
        if(u_xlatb11){
            u_xlat11.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat11.x = max(u_xlat11.x, 2.0);
            u_xlat11.x = min(u_xlat11.x, 30.0);
            u_xlat11.x = u_xlat11.x * _ShadowMapTexture_TexelSize.x;
            u_xlat7.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat31 = dot(u_xlat7.xy, vec2(0.0671105608, 0.00583714992));
            u_xlat31 = fract(u_xlat31);
            u_xlat31 = u_xlat31 * 52.9829178;
            u_xlat31 = fract(u_xlat31);
            u_xlat31 = u_xlat31 * 6.28318548;
            u_xlat7.x = sin(u_xlat31);
            u_xlat8.x = cos(u_xlat31);
            u_xlat3 = u_xlat7.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.399062157, -0.768907249) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati17.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati17.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati17.xy));
            u_xlati17.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati17.xy));
            if(u_xlati17.x != 0) {
                u_xlat17.z = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat31 = u_xlat2.w * 0.00200000009;
                u_xlat31 = max(u_xlat31, 0.000500000024);
                u_xlat31 = (-u_xlat31) + u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb31 = !!(u_xlat17.z<u_xlat31);
#else
                u_xlatb31 = u_xlat17.z<u_xlat31;
#endif
                u_xlat17.x = 1.0;
                u_xlat17.xz = bool(u_xlatb31) ? u_xlat17.xz : vec2(0.0, 0.0);
            } else {
                u_xlat17.x = float(0.0);
                u_xlat17.z = float(0.0);
            }
            if(u_xlati17.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.929388702, 0.293877602) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.457714319, -0.879124641) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.276768446, 0.756483793) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat4.xy = u_xlat8.xx * vec2(0.443233252, 0.53742981) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.975115538, -0.4737342) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(-0.418930233, 0.190901875) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat4.xy = u_xlat8.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.997065067, 0.914375901) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati18.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati18.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            u_xlati18.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati18.xy));
            if(u_xlati18.x != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati18.y != 0) {
                u_xlat31 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat31<u_xlat27);
#else
                u_xlatb27 = u_xlat31<u_xlat27;
#endif
                u_xlat9.y = u_xlat31 + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            u_xlat3 = u_xlat7.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat4.xy = u_xlat8.xx * vec2(0.199841261, 0.143831611) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat8.xx * vec2(0.78641367, -0.1410079) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * u_xlat11.xxxx + u_xlat2.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati11.xz = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati11.xz = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati11.xz));
            u_xlati11.xz = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati11.xz));
            if(u_xlati11.x != 0) {
                u_xlat11.x = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat27 = u_xlat2.w * 0.00200000009;
                u_xlat27 = max(u_xlat27, 0.000500000024);
                u_xlat27 = u_xlat2.w + (-u_xlat27);
#ifdef UNITY_ADRENO_ES3
                u_xlatb27 = !!(u_xlat11.x<u_xlat27);
#else
                u_xlatb27 = u_xlat11.x<u_xlat27;
#endif
                u_xlat9.y = u_xlat11.x + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb27)) ? u_xlat9.xy : u_xlat17.xz;
            }
            if(u_xlati11.z != 0) {
                u_xlat11.x = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat31 = u_xlat2.w * 0.00200000009;
                u_xlat31 = max(u_xlat31, 0.000500000024);
                u_xlat31 = (-u_xlat31) + u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
                u_xlatb31 = !!(u_xlat11.x<u_xlat31);
#else
                u_xlatb31 = u_xlat11.x<u_xlat31;
#endif
                u_xlat9.y = u_xlat11.x + u_xlat17.z;
                u_xlat9.x = u_xlat17.x + 1.0;
                u_xlat17.xz = (bool(u_xlatb31)) ? u_xlat9.xy : u_xlat17.xz;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb11 = !!(0.0<u_xlat17.x);
#else
            u_xlatb11 = 0.0<u_xlat17.x;
#endif
            u_xlat31 = u_xlat17.z / u_xlat17.x;
            u_xlat31 = u_xlatb11 ? u_xlat31 : float(0.0);
            u_xlat31 = (-u_xlat31) + u_xlat2.w;
            u_xlat31 = u_xlat31 * _PCSSLightSize;
            u_xlat21.x = max(u_xlat11.y, u_xlat31);
            u_xlat21.x = max(u_xlat21.x, 1.0);
            u_xlat21.x = min(u_xlat21.x, 20.0);
            u_xlat11.x = (u_xlatb11) ? u_xlat21.x : 1.0;
            u_xlat11.x = u_xlat11.x * _ShadowMapTexture_TexelSize.x;
            u_xlati21 = max(_PCSSSampleCount, 4);
            u_xlati21 = min(u_xlati21, 16);
            u_xlat16_6.x = float(0.0);
            u_xlat16_16 = float(0.0);
            u_xlati31 = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb17 = !!(u_xlati31>=16);
#else
                u_xlatb17 = u_xlati31>=16;
#endif
                if(u_xlatb17){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb17 = !!(u_xlati31<u_xlati21);
#else
                u_xlatb17 = u_xlati31<u_xlati21;
#endif
                if(u_xlatb17){
                    u_xlat17.xy = u_xlat7.xx * ImmCB_0[u_xlati31].yx;
                    u_xlat9.x = ImmCB_0[u_xlati31].x * u_xlat8.x + (-u_xlat17.x);
                    u_xlat9.y = ImmCB_0[u_xlati31].y * u_xlat8.x + u_xlat17.y;
                    u_xlat17.xy = u_xlat9.xy * u_xlat11.xx + u_xlat2.xy;
                    u_xlatb18.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat17.xyxx).xy;
                    u_xlatb9.xy = lessThan(u_xlat17.xyxx, vec4(0.998000026, 0.998000026, 0.0, 0.0)).xy;
                    u_xlatb37 = u_xlatb18.x && u_xlatb9.x;
                    u_xlatb37 = u_xlatb18.y && u_xlatb37;
                    u_xlatb37 = u_xlatb9.y && u_xlatb37;
                    if(!u_xlatb37){
                        u_xlati37 = u_xlati31 + 1;
                        u_xlati31 = u_xlati37;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat17.xy,u_xlat2.w);
                    u_xlat10_17 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_6.x = u_xlat16_6.x + u_xlat10_17;
                    u_xlat16_16 = u_xlat16_16 + 1.0;
                }
                u_xlati31 = u_xlati31 + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb11 = !!(0.0<u_xlat16_16);
#else
            u_xlatb11 = 0.0<u_xlat16_16;
#endif
            u_xlat16_6.x = u_xlat16_6.x / u_xlat16_16;
            u_xlat21.xy = (-u_xlat2.xy) + vec2(1.0, 1.0);
            u_xlat21.xy = min(u_xlat21.xy, u_xlat2.xy);
            u_xlat21.x = min(u_xlat21.y, u_xlat21.x);
            u_xlat21.x = u_xlat21.x * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
            u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
            u_xlat31 = u_xlat16_6.x + -1.0;
            u_xlat11.x = u_xlatb11 ? u_xlat31 : float(0.0);
            u_xlat11.x = u_xlat21.x * u_xlat11.x + 1.0;
            u_xlat16_11 = u_xlat11.x;
        } else {
            u_xlat16_11 = 1.0;
        }
        u_xlat16_6.x = (-u_xlat16_30) + 1.0;
        u_xlat16_30 = u_xlat16_11 * u_xlat16_6.x + u_xlat16_30;
        u_xlat30 = u_xlat16_30;
    } else {
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec4 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat7.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat17.x = (-u_xlat16_6.x) + 1.0;
        u_xlat30 = u_xlat7.x * u_xlat17.x + u_xlat16_6.x;
    }
    u_xlat7.x = (-u_xlat30) + 1.0;
    u_xlat7.x = (-u_xlat7.x) * _shadowStrength + 1.0;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = max(u_xlat1, u_xlat7.x);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat17.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat17.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat7.xyz;
    u_xlat37 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat7.xyz = (-u_xlat16_0.xyz) * u_xlat7.xyz + _FogColor.xyz;
    u_xlat7.xyz = vec3(u_xlat37) * u_xlat7.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(_shadowVector.x==1.0);
#else
    u_xlatb37 = _shadowVector.x==1.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb37)) ? vec3(u_xlat1) : u_xlat7.xyz;
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
vec4 ImmCB_0[16];
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
UNITY_LOCATION(2) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(7) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump float u_xlat16_11;
vec3 u_xlat12;
int u_xlati12;
mediump float u_xlat16_16;
vec2 u_xlat17;
mediump vec2 u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
float u_xlat22;
ivec2 u_xlati22;
bool u_xlatb22;
bvec2 u_xlatb28;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat10_32;
int u_xlati32;
bool u_xlatb32;
mediump float u_xlat16_33;
float u_xlat37;
bool u_xlatb37;
void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_0.xy);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = (u_xlatb2.x) ? u_xlat16_3.xyz : u_xlat16_4.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_20.x = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_20.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.5<_LMisCompressed);
#else
    u_xlatb31 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.xyz / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb31)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightMapColor.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb1 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_20.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_1.x = texture(_CuEm_Mask, u_xlat16_20.xy).x;
    u_xlat16_11 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_2.xzw = texture(_normalMap, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_30 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_30) + vs_TEXCOORD2.yzx;
    u_xlat21 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xzw = vec3(u_xlat21) * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat2.xzw * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat2.zwx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat2.w;
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_0.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat2.x;
    u_xlat9.y = u_xlat7.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_0.xyz, u_xlat9.xyz);
    u_xlat7.x = u_xlat2.z;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_0.xyz, u_xlat7.xyz);
    u_xlat21 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xzw = vec3(u_xlat21) * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat7.xyz;
    u_xlat16_30 = dot((-u_xlat16_0.xyz), u_xlat2.xzw);
    u_xlat16_30 = u_xlat16_30 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat2.xzw * (-vec3(u_xlat16_30)) + (-u_xlat16_0.xyz);
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat16_7.xyz = texture(_CubeMap, u_xlat16_0.xyz).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb21 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_20.x = (u_xlatb21) ? (-u_xlat16_0.z) : u_xlat16_0.z;
    u_xlat16_20.x = u_xlat16_20.x + 1.0;
    u_xlat16_20.x = sqrt(u_xlat16_20.x);
    u_xlat16_20.x = u_xlat16_20.x * 2.82842708;
    u_xlat16_0.xz = u_xlat16_0.xy / u_xlat16_20.xx;
    u_xlat16_0.xz = u_xlat16_0.xz * _Cube_Vector.zz;
    u_xlat16_0.xz = u_xlat16_0.xz * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_8.xyz = texture(_Matcap, u_xlat16_0.xz).xyz;
    u_xlat16_0.xzw = (-u_xlat16_8.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_0.xzw = u_xlat16_8.xyz / u_xlat16_0.xzw;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.xyz;
    u_xlat16_0.xzw = (u_xlatb2.y) ? u_xlat16_0.xzw : u_xlat16_5.xyz;
    u_xlat16_33 = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * u_xlat16_7.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xzw * _CuEm_Vector.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.xzw * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xzw = log2(u_xlat16_0.xzw);
    u_xlat16_0.xzw = u_xlat16_0.xzw * _Cube_Vector.xxx;
    u_xlat16_0.xzw = exp2(u_xlat16_0.xzw);
    u_xlat16_33 = u_xlat16_1.x * _CuEm_Vector.x;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_33);
    u_xlat16_10 = u_xlat16_0.y * _Cube_Vector.y + 1.0;
    u_xlat16_10 = u_xlat16_10 + (-_Cube_Vector.y);
    u_xlat16_10 = u_xlat16_10 * 0.5 + 0.5;
    u_xlat16_0.xyz = vec3(u_xlat16_10) * u_xlat16_0.xzw;
    u_xlat16_30 = u_xlat16_11 * _CuEm_Vector.y;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
    u_xlat16_5.xyz = u_xlat16_0.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * _MainColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb1 = _ShadowBias.z!=0.0;
#endif
    u_xlat11.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat12.xxx;
    u_xlat11.x = dot(u_xlat2.xzw, u_xlat11.xyz);
    u_xlat11.x = (-u_xlat11.x) * u_xlat11.x + 1.0;
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x * _ShadowBias.z;
    u_xlat11.xyz = (-u_xlat2.xzw) * u_xlat11.xxx + vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat11.xyz : vs_TEXCOORD3.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
    u_xlat3 = u_xlat1.yyyy * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat5 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat1.z + (-u_xlat2.x);
    u_xlat12.x = max((-u_xlat1.w), u_xlat2.x);
    u_xlat12.x = (-u_xlat2.x) + u_xlat12.x;
    u_xlat1.z = _ShadowBias.y * u_xlat12.x + u_xlat2.x;
    u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb21 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb21){
        u_xlat16_30 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(u_xlat1.w<1.0);
#else
        u_xlatb21 = u_xlat1.w<1.0;
#endif
        if(u_xlatb21){
            u_xlat2.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat21 = max(u_xlat2.x, 2.0);
            u_xlat21 = min(u_xlat21, 30.0);
            u_xlat21 = u_xlat21 * _ShadowMapTexture_TexelSize.x;
            u_xlat2.xz = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat2.x = dot(u_xlat2.xz, vec2(0.0671105608, 0.00583714992));
            u_xlat2.x = fract(u_xlat2.x);
            u_xlat2.x = u_xlat2.x * 52.9829178;
            u_xlat2.x = fract(u_xlat2.x);
            u_xlat2.x = u_xlat2.x * 6.28318548;
            u_xlat7.x = cos(u_xlat2.x);
            u_xlat2.x = sin(u_xlat2.x);
            u_xlat3 = u_xlat2.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.399062157, -0.768907249) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat17.y = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat22 = u_xlat1.w * 0.00200000009;
                u_xlat22 = max(u_xlat22, 0.000500000024);
                u_xlat22 = u_xlat1.w + (-u_xlat22);
#ifdef UNITY_ADRENO_ES3
                u_xlatb22 = !!(u_xlat17.y<u_xlat22);
#else
                u_xlatb22 = u_xlat17.y<u_xlat22;
#endif
                u_xlat17.x = 1.0;
                u_xlat17.xy = bool(u_xlatb22) ? u_xlat17.xy : vec2(0.0, 0.0);
            } else {
                u_xlat17.x = float(0.0);
                u_xlat17.y = float(0.0);
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.929388702, 0.293877602) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.457714319, -0.879124641) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.276768446, 0.756483793) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat4.xy = u_xlat7.xx * vec2(0.443233252, 0.53742981) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.975115538, -0.4737342) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.418930233, 0.190901875) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.997065067, 0.914375901) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat4.xy = u_xlat7.xx * vec2(0.199841261, 0.143831611) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.78641367, -0.1410079) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat21 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat22 = u_xlat1.w * 0.00200000009;
                u_xlat22 = max(u_xlat22, 0.000500000024);
                u_xlat22 = u_xlat1.w + (-u_xlat22);
#ifdef UNITY_ADRENO_ES3
                u_xlatb22 = !!(u_xlat21<u_xlat22);
#else
                u_xlatb22 = u_xlat21<u_xlat22;
#endif
                u_xlat8.y = u_xlat21 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb22)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat21 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat22 = u_xlat1.w * 0.00200000009;
                u_xlat22 = max(u_xlat22, 0.000500000024);
                u_xlat22 = u_xlat1.w + (-u_xlat22);
#ifdef UNITY_ADRENO_ES3
                u_xlatb22 = !!(u_xlat21<u_xlat22);
#else
                u_xlatb22 = u_xlat21<u_xlat22;
#endif
                u_xlat8.y = u_xlat21 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb22)) ? u_xlat8.xy : u_xlat17.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb21 = !!(0.0<u_xlat17.x);
#else
            u_xlatb21 = 0.0<u_xlat17.x;
#endif
            u_xlat22 = u_xlat17.y / u_xlat17.x;
            u_xlat22 = u_xlatb21 ? u_xlat22 : float(0.0);
            u_xlat22 = u_xlat1.w + (-u_xlat22);
            u_xlat22 = u_xlat22 * _PCSSLightSize;
            u_xlat12.x = max(u_xlat2.y, u_xlat22);
            u_xlat12.x = max(u_xlat12.x, 1.0);
            u_xlat12.x = min(u_xlat12.x, 20.0);
            u_xlat21 = (u_xlatb21) ? u_xlat12.x : 1.0;
            u_xlat21 = u_xlat21 * _ShadowMapTexture_TexelSize.x;
            u_xlati12 = max(_PCSSSampleCount, 4);
            u_xlati12 = min(u_xlati12, 16);
            u_xlat16_6.x = float(0.0);
            u_xlat16_16 = float(0.0);
            u_xlati22.x = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlati22.x>=16);
#else
                u_xlatb32 = u_xlati22.x>=16;
#endif
                if(u_xlatb32){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlati22.x<u_xlati12);
#else
                u_xlatb32 = u_xlati22.x<u_xlati12;
#endif
                if(u_xlatb32){
                    u_xlat17.xy = u_xlat2.xx * ImmCB_0[u_xlati22.x].yx;
                    u_xlat8.x = ImmCB_0[u_xlati22.x].x * u_xlat7.x + (-u_xlat17.x);
                    u_xlat8.y = ImmCB_0[u_xlati22.x].y * u_xlat7.x + u_xlat17.y;
                    u_xlat17.xy = u_xlat8.xy * vec2(u_xlat21) + u_xlat1.xy;
                    u_xlatb8.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat17.xyxx).xy;
                    u_xlatb28.xy = lessThan(u_xlat17.xyxy, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026)).xy;
                    u_xlatb32 = u_xlatb28.x && u_xlatb8.x;
                    u_xlatb32 = u_xlatb8.y && u_xlatb32;
                    u_xlatb32 = u_xlatb28.y && u_xlatb32;
                    if(!u_xlatb32){
                        u_xlati32 = u_xlati22.x + 1;
                        u_xlati22.x = u_xlati32;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat17.xy,u_xlat1.w);
                    u_xlat10_32 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_6.x = u_xlat10_32 + u_xlat16_6.x;
                    u_xlat16_16 = u_xlat16_16 + 1.0;
                }
                u_xlati22.x = u_xlati22.x + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb21 = !!(0.0<u_xlat16_16);
#else
            u_xlatb21 = 0.0<u_xlat16_16;
#endif
            u_xlat16_6.x = u_xlat16_6.x / u_xlat16_16;
            u_xlat2.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
            u_xlat2.xy = min(u_xlat1.xy, u_xlat2.xy);
            u_xlat2.x = min(u_xlat2.y, u_xlat2.x);
            u_xlat2.x = u_xlat2.x * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
            u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
            u_xlat12.x = u_xlat16_6.x + -1.0;
            u_xlat21 = u_xlatb21 ? u_xlat12.x : float(0.0);
            u_xlat21 = u_xlat2.x * u_xlat21 + 1.0;
            u_xlat16_21 = u_xlat21;
        } else {
            u_xlat16_21 = 1.0;
        }
        u_xlat16_6.x = (-u_xlat16_30) + 1.0;
        u_xlat16_30 = u_xlat16_21 * u_xlat16_6.x + u_xlat16_30;
        u_xlat30 = u_xlat16_30;
    } else {
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
        vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat1.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat1.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat1.xyw + u_xlat7.xyz;
        vec3 txVec4 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat12.x = (-u_xlat16_6.x) + 1.0;
        u_xlat30 = u_xlat2.x * u_xlat12.x + u_xlat16_6.x;
    }
    u_xlat2.x = (-u_xlat30) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat12.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat12.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat32 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat2.xyz = (-u_xlat16_0.xyz) * u_xlat2.xyz + _FogColor.xyz;
    u_xlat2.xyz = vec3(u_xlat32) * u_xlat2.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
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
vec4 ImmCB_0[16];
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	int _PCSSSampleCount;
uniform 	float _PCSSLightSize;
uniform 	mediump float _UseMainLightPCSS;
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
UNITY_LOCATION(2) uniform mediump sampler2D _ShadowMapDepth;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(7) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump float u_xlat16_11;
vec3 u_xlat12;
int u_xlati12;
mediump float u_xlat16_16;
vec2 u_xlat17;
mediump vec2 u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
float u_xlat22;
ivec2 u_xlati22;
bool u_xlatb22;
bvec2 u_xlatb28;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat10_32;
int u_xlati32;
bool u_xlatb32;
mediump float u_xlat16_33;
float u_xlat37;
bool u_xlatb37;
void main()
{
ImmCB_0[0] = vec4(-0.942016244,-0.399062157,0.0,0.0);
ImmCB_0[1] = vec4(0.945586085,-0.768907249,0.0,0.0);
ImmCB_0[2] = vec4(-0.0941841006,-0.929388702,0.0,0.0);
ImmCB_0[3] = vec4(0.344959378,0.293877602,0.0,0.0);
ImmCB_0[4] = vec4(-0.915885806,0.457714319,0.0,0.0);
ImmCB_0[5] = vec4(-0.815442324,-0.879124641,0.0,0.0);
ImmCB_0[6] = vec4(-0.382775426,0.276768446,0.0,0.0);
ImmCB_0[7] = vec4(0.974843979,0.756483793,0.0,0.0);
ImmCB_0[8] = vec4(0.443233252,-0.975115538,0.0,0.0);
ImmCB_0[9] = vec4(0.53742981,-0.4737342,0.0,0.0);
ImmCB_0[10] = vec4(-0.26496911,-0.418930233,0.0,0.0);
ImmCB_0[11] = vec4(0.791975141,0.190901875,0.0,0.0);
ImmCB_0[12] = vec4(-0.241888404,0.997065067,0.0,0.0);
ImmCB_0[13] = vec4(-0.81409955,0.914375901,0.0,0.0);
ImmCB_0[14] = vec4(0.199841261,0.78641367,0.0,0.0);
ImmCB_0[15] = vec4(0.143831611,-0.1410079,0.0,0.0);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat16_0.xy);
    u_xlatb2.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_isCompressed, _isReflectionCompressed, _isCompressed, _isCompressed)).xy;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_1.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = (u_xlatb2.x) ? u_xlat16_3.xyz : u_xlat16_4.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(8.0, 8.0, 8.0));
    u_xlat16_20.x = u_xlat16_1.w * _MainColor.w;
    SV_Target0.w = u_xlat16_20.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.5<_LMisCompressed);
#else
    u_xlatb31 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.xyz / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb31)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightMapColor.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_CuEm_Vector.w);
#else
    u_xlatb1 = 0.5<_CuEm_Vector.w;
#endif
    u_xlat16_20.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_1.x = texture(_CuEm_Mask, u_xlat16_20.xy).x;
    u_xlat16_11 = texture(_CuEm_Mask, vs_TEXCOORD0.xy).y;
    u_xlat16_2.xzw = texture(_normalMap, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_2.xzw * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_30 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_30) + vs_TEXCOORD2.yzx;
    u_xlat21 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xzw = vec3(u_xlat21) * u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat2.xzw * vs_TEXCOORD1.zxy;
    u_xlat7.xyz = vs_TEXCOORD1.yzx * u_xlat2.zwx + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xzy * vs_TEXCOORD2.www;
    u_xlat8.x = u_xlat2.w;
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat8.x = dot(u_xlat16_0.xyz, u_xlat8.xyz);
    u_xlat9.x = u_xlat2.x;
    u_xlat9.y = u_xlat7.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_0.xyz, u_xlat9.xyz);
    u_xlat7.x = u_xlat2.z;
    u_xlat7.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_0.xyz, u_xlat7.xyz);
    u_xlat21 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xzw = vec3(u_xlat21) * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat7.xyz;
    u_xlat16_30 = dot((-u_xlat16_0.xyz), u_xlat2.xzw);
    u_xlat16_30 = u_xlat16_30 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat2.xzw * (-vec3(u_xlat16_30)) + (-u_xlat16_0.xyz);
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat16_7.xyz = texture(_CubeMap, u_xlat16_0.xyz).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Cube_Vector.w==1.0);
#else
    u_xlatb21 = _Cube_Vector.w==1.0;
#endif
    u_xlat16_20.x = (u_xlatb21) ? (-u_xlat16_0.z) : u_xlat16_0.z;
    u_xlat16_20.x = u_xlat16_20.x + 1.0;
    u_xlat16_20.x = sqrt(u_xlat16_20.x);
    u_xlat16_20.x = u_xlat16_20.x * 2.82842708;
    u_xlat16_0.xz = u_xlat16_0.xy / u_xlat16_20.xx;
    u_xlat16_0.xz = u_xlat16_0.xz * _Cube_Vector.zz;
    u_xlat16_0.xz = u_xlat16_0.xz * _Matcap_ST.xy + _Matcap_ST.zw;
    u_xlat16_8.xyz = texture(_Matcap, u_xlat16_0.xz).xyz;
    u_xlat16_0.xzw = (-u_xlat16_8.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_0.xzw = u_xlat16_8.xyz / u_xlat16_0.xzw;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.xyz;
    u_xlat16_0.xzw = (u_xlatb2.y) ? u_xlat16_0.xzw : u_xlat16_5.xyz;
    u_xlat16_33 = (-_CuEm_Vector.z) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * u_xlat16_7.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xzw * _CuEm_Vector.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_0.xzw * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xzw = u_xlat16_0.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xzw = log2(u_xlat16_0.xzw);
    u_xlat16_0.xzw = u_xlat16_0.xzw * _Cube_Vector.xxx;
    u_xlat16_0.xzw = exp2(u_xlat16_0.xzw);
    u_xlat16_33 = u_xlat16_1.x * _CuEm_Vector.x;
    u_xlat16_0.xzw = u_xlat16_0.xzw * vec3(u_xlat16_33);
    u_xlat16_10 = u_xlat16_0.y * _Cube_Vector.y + 1.0;
    u_xlat16_10 = u_xlat16_10 + (-_Cube_Vector.y);
    u_xlat16_10 = u_xlat16_10 * 0.5 + 0.5;
    u_xlat16_0.xyz = vec3(u_xlat16_10) * u_xlat16_0.xzw;
    u_xlat16_30 = u_xlat16_11 * _CuEm_Vector.y;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
    u_xlat16_5.xyz = u_xlat16_0.xyz * _CubeColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * _CubeColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Reflection_HDR_Intensity) + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * _MainColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb1 = _ShadowBias.z!=0.0;
#endif
    u_xlat11.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat12.x = inversesqrt(u_xlat12.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat12.xxx;
    u_xlat11.x = dot(u_xlat2.xzw, u_xlat11.xyz);
    u_xlat11.x = (-u_xlat11.x) * u_xlat11.x + 1.0;
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x * _ShadowBias.z;
    u_xlat11.xyz = (-u_xlat2.xzw) * u_xlat11.xxx + vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat11.xyz : vs_TEXCOORD3.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
    u_xlat3 = u_xlat1.yyyy * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat5 + u_xlat1;
    u_xlat2.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat1.z + (-u_xlat2.x);
    u_xlat12.x = max((-u_xlat1.w), u_xlat2.x);
    u_xlat12.x = (-u_xlat2.x) + u_xlat12.x;
    u_xlat1.z = _ShadowBias.y * u_xlat12.x + u_xlat2.x;
    u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.5<_UseMainLightPCSS);
#else
    u_xlatb21 = 0.5<_UseMainLightPCSS;
#endif
    if(u_xlatb21){
        u_xlat16_30 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(u_xlat1.w<1.0);
#else
        u_xlatb21 = u_xlat1.w<1.0;
#endif
        if(u_xlatb21){
            u_xlat2.xy = vec2(vec2(_PCSSLightSize, _PCSSLightSize)) * vec2(0.5, 0.0599999987);
            u_xlat21 = max(u_xlat2.x, 2.0);
            u_xlat21 = min(u_xlat21, 30.0);
            u_xlat21 = u_xlat21 * _ShadowMapTexture_TexelSize.x;
            u_xlat2.xz = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw;
            u_xlat2.x = dot(u_xlat2.xz, vec2(0.0671105608, 0.00583714992));
            u_xlat2.x = fract(u_xlat2.x);
            u_xlat2.x = u_xlat2.x * 52.9829178;
            u_xlat2.x = fract(u_xlat2.x);
            u_xlat2.x = u_xlat2.x * 6.28318548;
            u_xlat7.x = cos(u_xlat2.x);
            u_xlat2.x = sin(u_xlat2.x);
            u_xlat3 = u_xlat2.xxxx * vec4(-0.399062157, -0.942016244, -0.768907249, 0.945586085);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.942016244, 0.945586085) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.399062157, -0.768907249) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat17.y = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat22 = u_xlat1.w * 0.00200000009;
                u_xlat22 = max(u_xlat22, 0.000500000024);
                u_xlat22 = u_xlat1.w + (-u_xlat22);
#ifdef UNITY_ADRENO_ES3
                u_xlatb22 = !!(u_xlat17.y<u_xlat22);
#else
                u_xlatb22 = u_xlat17.y<u_xlat22;
#endif
                u_xlat17.x = 1.0;
                u_xlat17.xy = bool(u_xlatb22) ? u_xlat17.xy : vec2(0.0, 0.0);
            } else {
                u_xlat17.x = float(0.0);
                u_xlat17.y = float(0.0);
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(-0.929388702, -0.0941841006, 0.293877602, 0.344959378);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.0941841006, 0.344959378) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.929388702, 0.293877602) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.457714319, -0.915885806, -0.879124641, -0.815442324);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.915885806, -0.815442324) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.457714319, -0.879124641) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.276768446, -0.382775426, 0.756483793, 0.974843979);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.382775426, 0.974843979) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.276768446, 0.756483793) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(-0.975115538, 0.443233252, -0.4737342, 0.53742981);
            u_xlat4.xy = u_xlat7.xx * vec2(0.443233252, 0.53742981) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.975115538, -0.4737342) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(-0.418930233, -0.26496911, 0.190901875, 0.791975141);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.26496911, 0.791975141) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(-0.418930233, 0.190901875) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.997065067, -0.241888404, 0.914375901, -0.81409955);
            u_xlat4.xy = u_xlat7.xx * vec2(-0.241888404, -0.81409955) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.997065067, 0.914375901) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat37 = u_xlat1.w * 0.00200000009;
                u_xlat37 = max(u_xlat37, 0.000500000024);
                u_xlat37 = u_xlat1.w + (-u_xlat37);
#ifdef UNITY_ADRENO_ES3
                u_xlatb37 = !!(u_xlat22<u_xlat37);
#else
                u_xlatb37 = u_xlat22<u_xlat37;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb37)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat22 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat32 = u_xlat1.w * 0.00200000009;
                u_xlat32 = max(u_xlat32, 0.000500000024);
                u_xlat32 = u_xlat1.w + (-u_xlat32);
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlat22<u_xlat32);
#else
                u_xlatb32 = u_xlat22<u_xlat32;
#endif
                u_xlat8.y = u_xlat22 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb32)) ? u_xlat8.xy : u_xlat17.xy;
            }
            u_xlat3 = u_xlat2.xxxx * vec4(0.78641367, 0.199841261, -0.1410079, 0.143831611);
            u_xlat4.xy = u_xlat7.xx * vec2(0.199841261, 0.143831611) + (-u_xlat3.xz);
            u_xlat4.zw = u_xlat7.xx * vec2(0.78641367, -0.1410079) + u_xlat3.yw;
            u_xlat3 = u_xlat4.xzyw * vec4(u_xlat21) + u_xlat1.xyxy;
            u_xlatb4 = lessThan(vec4(0.00200000009, 0.00200000009, 0.00200000009, 0.00200000009), u_xlat3);
            u_xlatb5 = lessThan(u_xlat3, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026));
            u_xlati22.xy = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) & (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb4.z) * 0xffffffffu) & (uint(u_xlatb5.z) * 0xffffffffu)));
            u_xlati22.xy = ivec2((uvec2(u_xlatb4.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            u_xlati22.xy = ivec2((uvec2(u_xlatb5.yw) * 0xFFFFFFFFu) & uvec2(u_xlati22.xy));
            if(u_xlati22.x != 0) {
                u_xlat21 = texture(_ShadowMapDepth, u_xlat3.xy).x;
                u_xlat22 = u_xlat1.w * 0.00200000009;
                u_xlat22 = max(u_xlat22, 0.000500000024);
                u_xlat22 = u_xlat1.w + (-u_xlat22);
#ifdef UNITY_ADRENO_ES3
                u_xlatb22 = !!(u_xlat21<u_xlat22);
#else
                u_xlatb22 = u_xlat21<u_xlat22;
#endif
                u_xlat8.y = u_xlat21 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb22)) ? u_xlat8.xy : u_xlat17.xy;
            }
            if(u_xlati22.y != 0) {
                u_xlat21 = texture(_ShadowMapDepth, u_xlat3.zw).x;
                u_xlat22 = u_xlat1.w * 0.00200000009;
                u_xlat22 = max(u_xlat22, 0.000500000024);
                u_xlat22 = u_xlat1.w + (-u_xlat22);
#ifdef UNITY_ADRENO_ES3
                u_xlatb22 = !!(u_xlat21<u_xlat22);
#else
                u_xlatb22 = u_xlat21<u_xlat22;
#endif
                u_xlat8.y = u_xlat21 + u_xlat17.y;
                u_xlat8.x = u_xlat17.x + 1.0;
                u_xlat17.xy = (bool(u_xlatb22)) ? u_xlat8.xy : u_xlat17.xy;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb21 = !!(0.0<u_xlat17.x);
#else
            u_xlatb21 = 0.0<u_xlat17.x;
#endif
            u_xlat22 = u_xlat17.y / u_xlat17.x;
            u_xlat22 = u_xlatb21 ? u_xlat22 : float(0.0);
            u_xlat22 = u_xlat1.w + (-u_xlat22);
            u_xlat22 = u_xlat22 * _PCSSLightSize;
            u_xlat12.x = max(u_xlat2.y, u_xlat22);
            u_xlat12.x = max(u_xlat12.x, 1.0);
            u_xlat12.x = min(u_xlat12.x, 20.0);
            u_xlat21 = (u_xlatb21) ? u_xlat12.x : 1.0;
            u_xlat21 = u_xlat21 * _ShadowMapTexture_TexelSize.x;
            u_xlati12 = max(_PCSSSampleCount, 4);
            u_xlati12 = min(u_xlati12, 16);
            u_xlat16_6.x = float(0.0);
            u_xlat16_16 = float(0.0);
            u_xlati22.x = 0;
            while(true){
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlati22.x>=16);
#else
                u_xlatb32 = u_xlati22.x>=16;
#endif
                if(u_xlatb32){break;}
#ifdef UNITY_ADRENO_ES3
                u_xlatb32 = !!(u_xlati22.x<u_xlati12);
#else
                u_xlatb32 = u_xlati22.x<u_xlati12;
#endif
                if(u_xlatb32){
                    u_xlat17.xy = u_xlat2.xx * ImmCB_0[u_xlati22.x].yx;
                    u_xlat8.x = ImmCB_0[u_xlati22.x].x * u_xlat7.x + (-u_xlat17.x);
                    u_xlat8.y = ImmCB_0[u_xlati22.x].y * u_xlat7.x + u_xlat17.y;
                    u_xlat17.xy = u_xlat8.xy * vec2(u_xlat21) + u_xlat1.xy;
                    u_xlatb8.xy = lessThan(vec4(0.00200000009, 0.00200000009, 0.0, 0.0), u_xlat17.xyxx).xy;
                    u_xlatb28.xy = lessThan(u_xlat17.xyxy, vec4(0.998000026, 0.998000026, 0.998000026, 0.998000026)).xy;
                    u_xlatb32 = u_xlatb28.x && u_xlatb8.x;
                    u_xlatb32 = u_xlatb8.y && u_xlatb32;
                    u_xlatb32 = u_xlatb28.y && u_xlatb32;
                    if(!u_xlatb32){
                        u_xlati32 = u_xlati22.x + 1;
                        u_xlati22.x = u_xlati32;
                        continue;
                    }
                    vec3 txVec0 = vec3(u_xlat17.xy,u_xlat1.w);
                    u_xlat10_32 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
                    u_xlat16_6.x = u_xlat10_32 + u_xlat16_6.x;
                    u_xlat16_16 = u_xlat16_16 + 1.0;
                }
                u_xlati22.x = u_xlati22.x + 1;
            }
#ifdef UNITY_ADRENO_ES3
            u_xlatb21 = !!(0.0<u_xlat16_16);
#else
            u_xlatb21 = 0.0<u_xlat16_16;
#endif
            u_xlat16_6.x = u_xlat16_6.x / u_xlat16_16;
            u_xlat2.xy = (-u_xlat1.xy) + vec2(1.0, 1.0);
            u_xlat2.xy = min(u_xlat1.xy, u_xlat2.xy);
            u_xlat2.x = min(u_xlat2.y, u_xlat2.x);
            u_xlat2.x = u_xlat2.x * 100.0;
#ifdef UNITY_ADRENO_ES3
            u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
            u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
            u_xlat12.x = u_xlat16_6.x + -1.0;
            u_xlat21 = u_xlatb21 ? u_xlat12.x : float(0.0);
            u_xlat21 = u_xlat2.x * u_xlat21 + 1.0;
            u_xlat16_21 = u_xlat21;
        } else {
            u_xlat16_21 = 1.0;
        }
        u_xlat16_6.x = (-u_xlat16_30) + 1.0;
        u_xlat16_30 = u_xlat16_21 * u_xlat16_6.x + u_xlat16_30;
        u_xlat30 = u_xlat16_30;
    } else {
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
        vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat1.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat1.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat1.xyw + u_xlat7.xyz;
        vec3 txVec4 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
        u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat12.x = (-u_xlat16_6.x) + 1.0;
        u_xlat30 = u_xlat2.x * u_xlat12.x + u_xlat16_6.x;
    }
    u_xlat2.x = (-u_xlat30) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat12.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat12.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat32 = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat2.xyz = (-u_xlat16_0.xyz) * u_xlat2.xyz + _FogColor.xyz;
    u_xlat2.xyz = vec3(u_xlat32) * u_xlat2.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
uniform 	mediump float _isAdaptive;
uniform 	mediump vec4 _shadowVector;
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
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
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
    u_xlat0.x = min(_MainLightDirectionAndAngleOffset.y, 0.879999995);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat9.x = _MainLightDirectionAndAngleOffset.y * -1.62 + 2.5;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 18.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive));
#else
    u_xlatb9 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive);
#endif
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : _shadowVector.y;
    u_xlat16_32 = (u_xlatb9) ? 1.0 : _shadowVector.z;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat9.xy = vs_TEXCOORD3.xz + vec2(-312.5, -1.25);
    u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_32;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat9.x = max(u_xlat0.x, 1.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat2.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat9.xyz * u_xlat16_5.xyz;
    u_xlat9.xyz = (-u_xlat16_5.xyz) * u_xlat9.xyz + _FogColor.xyz;
    u_xlat2.x = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_shadowVector.x==1.0);
#else
    u_xlatb2 = _shadowVector.x==1.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat0.xxx : u_xlat9.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
uniform 	mediump float _isAdaptive;
uniform 	mediump vec4 _shadowVector;
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
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
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
    u_xlat0.x = min(_MainLightDirectionAndAngleOffset.y, 0.879999995);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat9.x = _MainLightDirectionAndAngleOffset.y * -1.62 + 2.5;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 18.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive));
#else
    u_xlatb9 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isAdaptive);
#endif
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : _shadowVector.y;
    u_xlat16_32 = (u_xlatb9) ? 1.0 : _shadowVector.z;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat9.xy = vs_TEXCOORD3.xz + vec2(-312.5, -1.25);
    u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_32;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat9.x = max(u_xlat0.x, 1.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat2.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat9.xyz * u_xlat16_5.xyz;
    u_xlat9.xyz = (-u_xlat16_5.xyz) * u_xlat9.xyz + _FogColor.xyz;
    u_xlat2.x = vs_TEXCOORD3.w * _FogColor.w;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_shadowVector.x==1.0);
#else
    u_xlatb2 = _shadowVector.x==1.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat0.xxx : u_xlat9.xyz;
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
Local Keywords { "_SHADOW_WEAKEN_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
Local Keywords { "_SHADOW_WEAKEN_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
Local Keywords { "_SHADOW_WEAKEN_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
Local Keywords { "_SHADOW_WEAKEN_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
Local Keywords { "_SHADOW_WEAKEN_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
Local Keywords { "_SHADOW_WEAKEN_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
Local Keywords { "_SHADOW_WEAKEN_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
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
Local Keywords { "_SHADOW_WEAKEN_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_SHADOW_WEAKEN_ON" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 80179
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
CustomEditor "CodeGenShaderGUI.Theseus_Scene_CompressionGUI"
}