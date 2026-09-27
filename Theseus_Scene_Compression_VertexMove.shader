//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Scene/Compression_VertexMove" {
Properties {

_cull ("剔除模式", Float) = 2.0

_renderingMode ("渲染模式", Float) = 0.0

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

_WindEdgeFlutterVector ("_WindEdgeFlutterVector", Vector) = (0.5,0.5,0.5,0.5)

_WindParams ("风向参数XYZ是风的方向W是风的大小", Vector) = (1,1,1,1)

_EdgeBendingFactor ("混合法线振幅", Float) = 0.0

_SHOW_COLOR ("_SHOW_COLOR", Vector) = (0.5,0.5,0.5,0.5)

_CUBE_ON ("_CUBE_ON", Float) = 0.0

_normalMap ("法线贴图", 2D) = "bump" { }

_CuEm_Mask ("遮罩[R:反射遮罩 G:自发光 B:]", 2D) = "white" { }

_CubeMap ("Cubemap", Cube) = "" { }

_CuEm_Vector ("CuEm_Vector", Vector) = (0,0,0,0)

_Cube_Vector ("Cube_Vector", Vector) = (1,0,1,0)

_Matcap ("matcap", 2D) = "white" { }

_CubeColor ("反射颜色", Color) = (1,1,1,1)

_FogColor ("雾效颜色", Color) = (1,1,1,1)

_FogVector ("FogVector", Vector) = (9999,1,0,0)

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_StencilRef ("StencilRef", Float) = 0.0

_StencilComp ("StencilComp", Float) = 8.0

_zwrite ("__zw", Float) = 1.0

}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 16542
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_16;
float u_xlat17;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
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
    u_xlat17 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat17);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat17 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_7.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_16;
float u_xlat17;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
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
    u_xlat17 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat17);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat17 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_7.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb17 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb17)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat7.x = (-u_xlat2.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_16 = (-_ShadowBias.w) + 1.0;
    u_xlat7.x = (-u_xlat16_16) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat7.x + u_xlat16_16;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat7.xyz;
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
    u_xlat17 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat17);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat17 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_7.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb17 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb17)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat7.x = (-u_xlat2.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_16 = (-_ShadowBias.w) + 1.0;
    u_xlat7.x = (-u_xlat16_16) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat7.x + u_xlat16_16;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat7.xyz;
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
    u_xlat17 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat17);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat17 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_7.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb17 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb17)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat7.x = (-u_xlat2.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_16 = (-_ShadowBias.w) + 1.0;
    u_xlat7.x = (-u_xlat16_16) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat7.x + u_xlat16_16;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat7.xyz;
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
    u_xlat17 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat17);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat17 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_7.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb17 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb17)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat7.x = (-u_xlat2.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_16 = (-_ShadowBias.w) + 1.0;
    u_xlat7.x = (-u_xlat16_16) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat7.x + u_xlat16_16;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat7.xyz;
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
    u_xlat17 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat17);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat17 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_7.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(4) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec3 u_xlat16_5;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec2 u_xlat14;
mediump float u_xlat16_19;
float u_xlat20;
bool u_xlatb20;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    SV_Target0.w = u_xlat16_19;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb4.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat14.xy = (u_xlatb4.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = (u_xlatb4.y) ? vs_TEXCOORD0.zw : u_xlat14.xy;
    u_xlat16_3.xy = (u_xlatb4.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_4.xyz = texture(_LGMask, u_xlat16_3.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.zxy * _LG_Vector.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LG_Color.zxy;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.zxy + u_xlat16_1.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat20 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb20 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb20)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat8.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat8.x = (-u_xlat2.x) + u_xlat8.x;
    u_xlat0.z = _ShadowBias.y * u_xlat8.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_19 = (-_ShadowBias.w) + 1.0;
    u_xlat8.x = (-u_xlat16_19) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat8.x + u_xlat16_19;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat8.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat8.xyz;
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
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_8.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(4) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec3 u_xlat16_5;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec2 u_xlat14;
mediump float u_xlat16_19;
float u_xlat20;
bool u_xlatb20;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    SV_Target0.w = u_xlat16_19;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb4.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat14.xy = (u_xlatb4.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = (u_xlatb4.y) ? vs_TEXCOORD0.zw : u_xlat14.xy;
    u_xlat16_3.xy = (u_xlatb4.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_4.xyz = texture(_LGMask, u_xlat16_3.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.zxy * _LG_Vector.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LG_Color.zxy;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.zxy + u_xlat16_1.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat20 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb20 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb20)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat8.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat8.x = (-u_xlat2.x) + u_xlat8.x;
    u_xlat0.z = _ShadowBias.y * u_xlat8.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_19 = (-_ShadowBias.w) + 1.0;
    u_xlat8.x = (-u_xlat16_19) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat8.x + u_xlat16_19;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat8.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat8.xyz;
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
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_8.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb17 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb17)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat7.x = (-u_xlat2.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_16 = (-_ShadowBias.w) + 1.0;
    u_xlat7.x = (-u_xlat16_16) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat7.x + u_xlat16_16;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat7.xyz;
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
    u_xlat17 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat17);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat17 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_7.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb17 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb17)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat7.x = (-u_xlat2.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_16 = (-_ShadowBias.w) + 1.0;
    u_xlat7.x = (-u_xlat16_16) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat7.x + u_xlat16_16;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat7.xyz;
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
    u_xlat17 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat17);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat17 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_7.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_16;
float u_xlat17;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
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
    u_xlat17 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat17);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat17 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_7.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_16;
float u_xlat17;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
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
    u_xlat17 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat17);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat17 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_7.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_16;
float u_xlat17;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
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
    u_xlat17 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat17);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat17 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_7.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_16;
float u_xlat17;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
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
    u_xlat17 = floor(u_xlat0.x);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat17);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat17 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_7.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(1) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(2) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
vec2 u_xlat14;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    SV_Target0.w = u_xlat16_19;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb4.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat14.xy = (u_xlatb4.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = (u_xlatb4.y) ? vs_TEXCOORD0.zw : u_xlat14.xy;
    u_xlat16_3.xy = (u_xlatb4.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_4.xyz = texture(_LGMask, u_xlat16_3.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.zxy * _LG_Vector.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LG_Color.zxy;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.zxy + u_xlat16_1.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
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
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_8.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(1) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(2) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_8;
vec2 u_xlat14;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    SV_Target0.w = u_xlat16_19;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb4.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat14.xy = (u_xlatb4.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = (u_xlatb4.y) ? vs_TEXCOORD0.zw : u_xlat14.xy;
    u_xlat16_3.xy = (u_xlatb4.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_4.xyz = texture(_LGMask, u_xlat16_3.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.zxy * _LG_Vector.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LG_Color.zxy;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.zxy + u_xlat16_1.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
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
    u_xlat4.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_8.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_13 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_13;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_13;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_13 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_13;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat7;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb17 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb17)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat7.x = (-u_xlat2.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_16 = (-_ShadowBias.w) + 1.0;
    u_xlat7.x = (-u_xlat16_16) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat7.x + u_xlat16_16;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat7.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat7;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb17 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb17)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat7.x = (-u_xlat2.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_16 = (-_ShadowBias.w) + 1.0;
    u_xlat7.x = (-u_xlat16_16) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat7.x + u_xlat16_16;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat7.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec2 u_xlatb4;
vec3 u_xlat7;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb17 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb17)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat7.x = (-u_xlat2.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_16 = (-_ShadowBias.w) + 1.0;
    u_xlat7.x = (-u_xlat16_16) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat7.x + u_xlat16_16;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat7.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec2 u_xlatb4;
vec3 u_xlat7;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb17 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb17)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat7.x = (-u_xlat2.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_16 = (-_ShadowBias.w) + 1.0;
    u_xlat7.x = (-u_xlat16_16) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat7.x + u_xlat16_16;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat7.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(4) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec3 u_xlat16_5;
vec3 u_xlat8;
vec2 u_xlat14;
mediump float u_xlat16_19;
float u_xlat20;
bool u_xlatb20;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    SV_Target0.w = u_xlat16_19;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb4.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat14.xy = (u_xlatb4.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = (u_xlatb4.y) ? vs_TEXCOORD0.zw : u_xlat14.xy;
    u_xlat16_3.xy = (u_xlatb4.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_4.xyz = texture(_LGMask, u_xlat16_3.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _LG_Vector.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LG_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat20 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb20 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb20)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat8.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat8.x = (-u_xlat2.x) + u_xlat8.x;
    u_xlat0.z = _ShadowBias.y * u_xlat8.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_19 = (-_ShadowBias.w) + 1.0;
    u_xlat8.x = (-u_xlat16_19) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat8.x + u_xlat16_19;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat8.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat8.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(4) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec3 u_xlat16_5;
vec3 u_xlat8;
vec2 u_xlat14;
mediump float u_xlat16_19;
float u_xlat20;
bool u_xlatb20;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    SV_Target0.w = u_xlat16_19;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb4.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat14.xy = (u_xlatb4.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = (u_xlatb4.y) ? vs_TEXCOORD0.zw : u_xlat14.xy;
    u_xlat16_3.xy = (u_xlatb4.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_4.xyz = texture(_LGMask, u_xlat16_3.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _LG_Vector.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LG_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat20 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb20 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb20)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat8.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat8.x = (-u_xlat2.x) + u_xlat8.x;
    u_xlat0.z = _ShadowBias.y * u_xlat8.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_19 = (-_ShadowBias.w) + 1.0;
    u_xlat8.x = (-u_xlat16_19) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat8.x + u_xlat16_19;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat8.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat8.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat7;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb17 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb17)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat7.x = (-u_xlat2.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_16 = (-_ShadowBias.w) + 1.0;
    u_xlat7.x = (-u_xlat16_16) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat7.x + u_xlat16_16;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat7.xyz;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat7;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb17 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb17)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
    u_xlat0 = u_xlat0 * u_xlat2.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat2.zzzz + u_xlat0;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat7.x = (-u_xlat2.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_16 = (-_ShadowBias.w) + 1.0;
    u_xlat7.x = (-u_xlat16_16) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat7.x + u_xlat16_16;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat4.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat4.xyz + u_xlat7.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_13;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_13 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_13;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_13;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_13 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_13;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
bvec2 u_xlatb4;
mediump float u_xlat16_16;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
bvec2 u_xlatb4;
mediump float u_xlat16_16;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    u_xlat16_16 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_16;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(1) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(2) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat14;
mediump float u_xlat16_19;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    SV_Target0.w = u_xlat16_19;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb4.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat14.xy = (u_xlatb4.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = (u_xlatb4.y) ? vs_TEXCOORD0.zw : u_xlat14.xy;
    u_xlat16_3.xy = (u_xlatb4.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_4.xyz = texture(_LGMask, u_xlat16_3.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _LG_Vector.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LG_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3.w = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3.w = min(max(vs_TEXCOORD3.w, 0.0), 1.0);
#else
    vs_TEXCOORD3.w = clamp(vs_TEXCOORD3.w, 0.0, 1.0);
#endif
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
uniform 	mediump float _isCompressed;
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec4 _SHOW_COLOR;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(1) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(2) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat14;
mediump float u_xlat16_19;
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
    u_xlat16_1.x = u_xlat16_0.w * _MainColor.w + (-_AlphaClip);
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
    SV_Target0.w = u_xlat16_19;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb4.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat14.xy = (u_xlatb4.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = (u_xlatb4.y) ? vs_TEXCOORD0.zw : u_xlat14.xy;
    u_xlat16_3.xy = (u_xlatb4.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_4.xyz = texture(_LGMask, u_xlat16_3.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _LG_Vector.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _LG_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlatb4.xy = equal(_SHOW_COLOR.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb4.x) ? vs_COLOR0.x : u_xlat2.x;
    u_xlat16_1.yz = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat2.yz;
    SV_Target0.xz = (u_xlatb4.y) ? vec2(0.0, 0.0) : u_xlat16_1.xz;
    SV_Target0.y = (u_xlatb4.y) ? vs_COLOR0.y : u_xlat16_1.y;
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
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
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
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_VERTEX_MOVE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_LG_ON" "_VERTEX_MOVE" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_Scene_Compression_VertexMoveGUI"
}