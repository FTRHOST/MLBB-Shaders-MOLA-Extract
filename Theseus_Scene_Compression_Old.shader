//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Scene/Compression_Old" {
Properties {

_cull ("剔除模式", Float) = 2.0

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_isCompressed ("_IsCompressed", Float) = 1.0

_MainTex ("MainTex", 2D) = "white" { }

_MainColor ("颜色", Color) = (1,1,1,1)

_HDR_Intensity ("HDR强度限制", Range(0, 3)) = 1.0

_AlphaClip ("AlphaClip", Range(0, 1)) = 0.0

_LMisCompressed ("_IsCompressed", Float) = 0.0

_LightMap ("MainTex", 2D) = "white" { }

_LightMapColor ("颜色", Color) = (1,1,1,1)

_LG_ON ("开启流光", Float) = 0.0

_LGMask_UV ("流光遮罩UV", Float) = 0.0

_LG_UV ("流光UV", Float) = 0.0

_LGMask ("流光遮罩(RGB色)", 2D) = "white" { }

_LGTex ("流光纹理", 2D) = "white" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Vector ("流光X:强度 YZ:流速", Vector) = (1,0,0,0)

_CUBE_ON ("_CUBE_ON", Float) = 0.0

_normalMap ("法线贴图", 2D) = "bump" { }

_CuEm_Mask ("遮罩[R:Cube G:自发光 B:matcap]", 2D) = "white" { }

_CubeMap ("Cubemap", Cube) = "_Skybox" { }

_CubeColor ("Cube&Matcap颜色", Color) = (1,1,1,1)

_CuEm_Vector ("CuEm_Vector", Vector) = (0,0,0,0)

_Cube_Vector ("Cube_Vector", Vector) = (1,0.4,1,0)

_Matcap ("matcap", 2D) = "black" { }

_Matcap_Vector ("Matcap_Vector", Vector) = (1,0,5,0)

_FogColor ("雾效颜色", Color) = (1,1,1,1)

_FogVector ("FogVector", Vector) = (0,1000,1,0)

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_StencilRef ("StencilRef", Float) = 0.0

_StencilComp ("StencilComp", Float) = 4.0

}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 49123
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat12;
bool u_xlatb12;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_4.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.zxy * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_4.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_4.zxy / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_2.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + _FogColor.zxy;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_FogVector.x);
#else
    u_xlatb12 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb12)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat12 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat12);
    u_xlat1.x = u_xlat12 * 0.0625 + u_xlat1.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_4.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat12;
bool u_xlatb12;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_4.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.zxy * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_4.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_4.zxy / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_2.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + _FogColor.zxy;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_FogVector.x);
#else
    u_xlatb12 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb12)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat12 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat12);
    u_xlat1.x = u_xlat12 * 0.0625 + u_xlat1.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_4.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_isCompressed);
#else
    u_xlatb5 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.zxy / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb5)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
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
    u_xlat5.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + _FogColor.zxy;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat5.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
float u_xlat6;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_isCompressed);
#else
    u_xlatb5 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.zxy / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb5)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
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
    u_xlat5.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + _FogColor.zxy;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat5.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
bool u_xlatb15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_5.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_5.zxy * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_5.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_5.zxy / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_LMisCompressed);
#else
    u_xlatb0 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_5.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_5.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_5.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_5.zxy / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightMapColor.zxy;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
bool u_xlatb15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_5.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_5.zxy * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_5.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_5.zxy / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_LMisCompressed);
#else
    u_xlatb0 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_5.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_5.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_5.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_5.zxy / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightMapColor.zxy;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
float u_xlat7;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_isCompressed);
#else
    u_xlatb6 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.zxy / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb6)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_LMisCompressed);
#else
    u_xlatb6 = 0.5<_LMisCompressed;
#endif
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.zxy / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb6)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.zxy;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_FogVector.x);
#else
    u_xlatb18 = 0.5<_FogVector.x;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
float u_xlat7;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_isCompressed);
#else
    u_xlatb6 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.zxy / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb6)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_LMisCompressed);
#else
    u_xlatb6 = 0.5<_LMisCompressed;
#endif
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.zxy / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb6)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.zxy;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_FogVector.x);
#else
    u_xlatb18 = 0.5<_FogVector.x;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_CubeColor.z, _CubeColor.x, _CubeColor.y) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_CubeColor.z, _CubeColor.x, _CubeColor.y) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_CubeColor.z, _CubeColor.x, _CubeColor.y) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_CubeColor.z, _CubeColor.x, _CubeColor.y) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.zxy + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.zxy;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.zxy + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.zxy;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.zxy + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.zxy;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.zxy + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.zxy;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat10;
float u_xlat15;
bool u_xlatb15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_5.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_5.zxy * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_5.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_5.zxy / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_2.xyz;
    u_xlat0.xy = _LG_Vector.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat10.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat10.xy;
    u_xlat16_2.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_2.xy).xyz;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = u_xlat0.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_0.xyz = texture(_LGTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * _LG_Vector.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LG_Color.zxy;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.zxy + u_xlat16_1.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + _FogColor.zxy;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_5.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat10;
float u_xlat15;
bool u_xlatb15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_5.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_5.zxy * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_5.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_5.zxy / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_2.xyz;
    u_xlat0.xy = _LG_Vector.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat10.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat10.xy;
    u_xlat16_2.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_2.xy).xyz;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = u_xlat0.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_0.xyz = texture(_LGTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * _LG_Vector.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LG_Color.zxy;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.zxy + u_xlat16_1.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + _FogColor.zxy;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_5.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
vec2 u_xlat7;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat7.x = (-u_xlat1.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat1.x;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_isCompressed);
#else
    u_xlatb6 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.zxy / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb6)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
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
    u_xlat6.xy = _LG_Vector.yz * _Time.yy;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlatb1.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat13.xy = (u_xlatb1.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = (u_xlatb1.y) ? vs_TEXCOORD0.zw : u_xlat13.xy;
    u_xlat16_4.xy = (u_xlatb1.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_2.xyz = texture(_LGMask, u_xlat16_4.xy).xyz;
    u_xlat6.xy = u_xlat6.xy + u_xlat7.xy;
    u_xlat6.xy = u_xlat6.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_6.xyz = texture(_LGTex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_6.zxy * _LG_Vector.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LG_Color.zxy;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_2.zxy + u_xlat16_3.xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + _FogColor.zxy;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_FogVector.x);
#else
    u_xlatb18 = 0.5<_FogVector.x;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
vec2 u_xlat7;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat7.x = (-u_xlat1.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat1.x;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_isCompressed);
#else
    u_xlatb6 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.zxy / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb6)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
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
    u_xlat6.xy = _LG_Vector.yz * _Time.yy;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlatb1.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat13.xy = (u_xlatb1.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = (u_xlatb1.y) ? vs_TEXCOORD0.zw : u_xlat13.xy;
    u_xlat16_4.xy = (u_xlatb1.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_2.xyz = texture(_LGMask, u_xlat16_4.xy).xyz;
    u_xlat6.xy = u_xlat6.xy + u_xlat7.xy;
    u_xlat6.xy = u_xlat6.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_6.xyz = texture(_LGTex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_6.zxy * _LG_Vector.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LG_Color.zxy;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_2.zxy + u_xlat16_3.xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + _FogColor.zxy;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_FogVector.x);
#else
    u_xlatb18 = 0.5<_FogVector.x;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(2) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(3) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat10;
float u_xlat15;
bool u_xlatb15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_5.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_5.zxy * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_5.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_5.zxy / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_LMisCompressed);
#else
    u_xlatb0 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_5.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_5.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_5.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_5.zxy / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightMapColor.zxy;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xy = _LG_Vector.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlatb4.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat10.xy = (u_xlatb4.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = (u_xlatb4.y) ? vs_TEXCOORD0.zw : u_xlat10.xy;
    u_xlat16_2.xy = (u_xlatb4.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_4.xyz = texture(_LGMask, u_xlat16_2.xy).xyz;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = u_xlat0.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_0.xyz = texture(_LGTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * _LG_Vector.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LG_Color.zxy;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.zxy + u_xlat16_1.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + _FogColor.zxy;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(2) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(3) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat10;
float u_xlat15;
bool u_xlatb15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_5.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_5.zxy * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_5.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_5.zxy / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_LMisCompressed);
#else
    u_xlatb0 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_5.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_5.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_5.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_5.zxy / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightMapColor.zxy;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xy = _LG_Vector.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlatb4.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat10.xy = (u_xlatb4.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = (u_xlatb4.y) ? vs_TEXCOORD0.zw : u_xlat10.xy;
    u_xlat16_2.xy = (u_xlatb4.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_4.xyz = texture(_LGMask, u_xlat16_2.xy).xyz;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = u_xlat0.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_0.xyz = texture(_LGTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * _LG_Vector.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LG_Color.zxy;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.zxy + u_xlat16_1.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + _FogColor.zxy;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(4) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(5) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(6) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
vec2 u_xlat7;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat7.x = (-u_xlat1.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat1.x;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_isCompressed);
#else
    u_xlatb6 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.zxy / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb6)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_LMisCompressed);
#else
    u_xlatb6 = 0.5<_LMisCompressed;
#endif
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.zxy / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb6)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.zxy;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat6.xy = _LG_Vector.yz * _Time.yy;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlatb1.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat13.xy = (u_xlatb1.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = (u_xlatb1.y) ? vs_TEXCOORD0.zw : u_xlat13.xy;
    u_xlat16_4.xy = (u_xlatb1.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_2.xyz = texture(_LGMask, u_xlat16_4.xy).xyz;
    u_xlat6.xy = u_xlat6.xy + u_xlat7.xy;
    u_xlat6.xy = u_xlat6.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_6.xyz = texture(_LGTex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_6.zxy * _LG_Vector.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LG_Color.zxy;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_2.zxy + u_xlat16_3.xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + _FogColor.zxy;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_FogVector.x);
#else
    u_xlatb18 = 0.5<_FogVector.x;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(4) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(5) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(6) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
vec2 u_xlat7;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat7.x = (-u_xlat1.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat1.x;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_isCompressed);
#else
    u_xlatb6 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.zxy * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.zxy / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb6)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_LMisCompressed);
#else
    u_xlatb6 = 0.5<_LMisCompressed;
#endif
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.zxy * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_1.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.zxy / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb6)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.zxy;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat6.xy = _LG_Vector.yz * _Time.yy;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlatb1.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat13.xy = (u_xlatb1.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = (u_xlatb1.y) ? vs_TEXCOORD0.zw : u_xlat13.xy;
    u_xlat16_4.xy = (u_xlatb1.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_2.xyz = texture(_LGMask, u_xlat16_4.xy).xyz;
    u_xlat6.xy = u_xlat6.xy + u_xlat7.xy;
    u_xlat6.xy = u_xlat6.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_6.xyz = texture(_LGTex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_6.zxy * _LG_Vector.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LG_Color.zxy;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_2.zxy + u_xlat16_3.xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + _FogColor.zxy;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_FogVector.x);
#else
    u_xlatb18 = 0.5<_FogVector.x;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(5) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.zxy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.zxy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.zxy + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(5) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.zxy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.zxy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.zxy + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(7) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.zxy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.zxy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.zxy + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(7) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.zxy + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.zxy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.zxy + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(2) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(3) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(6) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.zxy + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.zxy;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.zxy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.zxy + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(2) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(3) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(6) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.zxy + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.zxy;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.zxy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.zxy + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(4) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(5) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(8) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.zxy + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.zxy;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.zxy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.zxy + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(4) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(5) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(8) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _Matcap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.zxy * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.zxy * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.zxy / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.zxy + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.zxy * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.zxy / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.zxy;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.zxy * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.zxy;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.zxy + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.z, _FogColor.x, _FogColor.y);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat29 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat29);
    u_xlat0.x = u_xlat29 * 0.0625 + u_xlat0.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
bool u_xlatb9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_3.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_3.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_2.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + _FogColor.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.5<_FogVector.x);
#else
    u_xlatb9 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
bool u_xlatb9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_3.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_3.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_2.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + _FogColor.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.5<_FogVector.x);
#else
    u_xlatb9 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_isCompressed);
#else
    u_xlatb5 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb5)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
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
    u_xlat5.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat5.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_isCompressed);
#else
    u_xlatb5 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb5)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
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
    u_xlat5.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat5.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb12;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_4.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_4.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_LMisCompressed);
#else
    u_xlatb0 = 0.5<_LMisCompressed;
#endif
    u_xlat16_4.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightMapColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_FogVector.x);
#else
    u_xlatb12 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb12)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb12;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_4.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_4.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_LMisCompressed);
#else
    u_xlatb0 = 0.5<_LMisCompressed;
#endif
    u_xlat16_4.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightMapColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_FogVector.x);
#else
    u_xlatb12 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb12)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _LightMap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat7;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_isCompressed);
#else
    u_xlatb6 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb6)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_LMisCompressed);
#else
    u_xlatb6 = 0.5<_LMisCompressed;
#endif
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.xyz / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb6)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_FogVector.x);
#else
    u_xlatb18 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _LightMap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat7;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_isCompressed);
#else
    u_xlatb6 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb6)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_LMisCompressed);
#else
    u_xlatb6 = 0.5<_LMisCompressed;
#endif
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.xyz / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb6)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_FogVector.x);
#else
    u_xlatb18 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_CubeColor.x, _CubeColor.y, _CubeColor.z) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_CubeColor.x, _CubeColor.y, _CubeColor.z) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_CubeColor.x, _CubeColor.y, _CubeColor.z) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_CubeColor.x, _CubeColor.y, _CubeColor.z) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat10;
bool u_xlatb15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_5.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_5.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_2.xyz;
    u_xlat0.xy = _LG_Vector.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat10.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat10.xy;
    u_xlat16_2.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_2.xy).xyz;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = u_xlat0.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_0.xyz = texture(_LGTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _LG_Vector.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LG_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + _FogColor.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat10;
bool u_xlatb15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_5.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_5.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_2.xyz;
    u_xlat0.xy = _LG_Vector.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat10.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat10.xy;
    u_xlat16_2.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_2.xy).xyz;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = u_xlat0.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_0.xyz = texture(_LGTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _LG_Vector.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LG_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + _FogColor.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
vec2 u_xlat7;
vec2 u_xlat13;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat7.x = (-u_xlat1.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat1.x;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_isCompressed);
#else
    u_xlatb6 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb6)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
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
    u_xlat6.xy = _LG_Vector.yz * _Time.yy;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlatb1.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat13.xy = (u_xlatb1.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = (u_xlatb1.y) ? vs_TEXCOORD0.zw : u_xlat13.xy;
    u_xlat16_4.xy = (u_xlatb1.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_2.xyz = texture(_LGMask, u_xlat16_4.xy).xyz;
    u_xlat6.xy = u_xlat6.xy + u_xlat7.xy;
    u_xlat6.xy = u_xlat6.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_6.xyz = texture(_LGTex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * _LG_Vector.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LG_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_FogVector.x);
#else
    u_xlatb18 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
vec2 u_xlat7;
vec2 u_xlat13;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat7.x = (-u_xlat1.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat1.x;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_isCompressed);
#else
    u_xlatb6 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb6)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
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
    u_xlat6.xy = _LG_Vector.yz * _Time.yy;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlatb1.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat13.xy = (u_xlatb1.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = (u_xlatb1.y) ? vs_TEXCOORD0.zw : u_xlat13.xy;
    u_xlat16_4.xy = (u_xlatb1.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_2.xyz = texture(_LGMask, u_xlat16_4.xy).xyz;
    u_xlat6.xy = u_xlat6.xy + u_xlat7.xy;
    u_xlat6.xy = u_xlat6.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_6.xyz = texture(_LGTex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * _LG_Vector.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LG_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_FogVector.x);
#else
    u_xlatb18 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(2) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(3) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat10;
bool u_xlatb15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_5.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_5.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_LMisCompressed);
#else
    u_xlatb0 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_5.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_5.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightMapColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xy = _LG_Vector.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlatb4.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat10.xy = (u_xlatb4.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = (u_xlatb4.y) ? vs_TEXCOORD0.zw : u_xlat10.xy;
    u_xlat16_2.xy = (u_xlatb4.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_4.xyz = texture(_LGMask, u_xlat16_2.xy).xyz;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = u_xlat0.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_0.xyz = texture(_LGTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _LG_Vector.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LG_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + _FogColor.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(2) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(3) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat10;
bool u_xlatb15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_isCompressed);
#else
    u_xlatb0 = 0.5<_isCompressed;
#endif
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_5.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_5.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_LMisCompressed);
#else
    u_xlatb0 = 0.5<_LMisCompressed;
#endif
    u_xlat16_5.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_5.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_5.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LightMapColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xy = _LG_Vector.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlatb4.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat10.xy = (u_xlatb4.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = (u_xlatb4.y) ? vs_TEXCOORD0.zw : u_xlat10.xy;
    u_xlat16_2.xy = (u_xlatb4.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_4.xyz = texture(_LGMask, u_xlat16_2.xy).xyz;
    u_xlat0.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat0.xy = u_xlat0.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_0.xyz = texture(_LGTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _LG_Vector.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _LG_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = (-u_xlat16_1.xyz) + _FogColor.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.5<_FogVector.x);
#else
    u_xlatb15 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(4) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(5) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
vec2 u_xlat7;
vec2 u_xlat13;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat7.x = (-u_xlat1.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat1.x;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_isCompressed);
#else
    u_xlatb6 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb6)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_LMisCompressed);
#else
    u_xlatb6 = 0.5<_LMisCompressed;
#endif
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.xyz / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb6)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat6.xy = _LG_Vector.yz * _Time.yy;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlatb1.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat13.xy = (u_xlatb1.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = (u_xlatb1.y) ? vs_TEXCOORD0.zw : u_xlat13.xy;
    u_xlat16_4.xy = (u_xlatb1.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_2.xyz = texture(_LGMask, u_xlat16_4.xy).xyz;
    u_xlat6.xy = u_xlat6.xy + u_xlat7.xy;
    u_xlat6.xy = u_xlat6.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_6.xyz = texture(_LGTex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * _LG_Vector.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LG_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_FogVector.x);
#else
    u_xlatb18 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(4) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(5) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
vec2 u_xlat7;
vec2 u_xlat13;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
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
    u_xlat7.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat7.x = (-u_xlat1.x) + u_xlat7.x;
    u_xlat0.z = _ShadowBias.y * u_xlat7.x + u_xlat1.x;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_isCompressed);
#else
    u_xlatb6 = 0.5<_isCompressed;
#endif
    u_xlat16_1.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_4.xyz = u_xlat16_1.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = (bool(u_xlatb6)) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_LMisCompressed);
#else
    u_xlatb6 = 0.5<_LMisCompressed;
#endif
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_1.xyz / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb6)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat6.xy = _LG_Vector.yz * _Time.yy;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlatb1.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat13.xy = (u_xlatb1.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = (u_xlatb1.y) ? vs_TEXCOORD0.zw : u_xlat13.xy;
    u_xlat16_4.xy = (u_xlatb1.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_2.xyz = texture(_LGMask, u_xlat16_4.xy).xyz;
    u_xlat6.xy = u_xlat6.xy + u_xlat7.xy;
    u_xlat6.xy = u_xlat6.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_6.xyz = texture(_LGTex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * _LG_Vector.xxx;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LG_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.www * u_xlat6.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_FogVector.x);
#else
    u_xlatb18 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(5) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(5) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(7) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(7) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_6.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(2) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(3) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(6) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(2) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(3) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(6) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat2.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(4) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(5) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(8) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
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
uniform 	mediump vec3 _FogVector;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.ww;
    vs_TEXCOORD4.xy = u_xlat1.xy;
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
    u_xlat0.x = u_xlat0.x / _FogVector.y;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2 = max(_FogVector.z, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2;
    u_xlat0.x = exp2(u_xlat0.x);
    vs_TEXCOORD3.w = min(u_xlat0.x, 1.0);
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump vec4 _LG_Vector;
uniform 	mediump float _LGMask_UV;
uniform 	mediump float _LG_UV;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump vec4 _CuEm_Vector;
uniform 	mediump vec2 _Cube_Vector;
uniform 	mediump vec4 _Matcap_Vector;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec3 _FogColor;
uniform 	mediump vec3 _FogVector;
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
UNITY_LOCATION(4) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(5) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(8) uniform mediump sampler2D _CuEm_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _Matcap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat20;
float u_xlat27;
mediump float u_xlat16_28;
float u_xlat29;
bool u_xlatb29;
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
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_28 = dot((-u_xlat16_1.xyz), u_xlat0.xyz);
    u_xlat16_28 = u_xlat16_28 + u_xlat16_28;
    u_xlat16_1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_28)) + (-u_xlat16_1.xyz);
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat16_0.w = (-u_xlat16_0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Matcap_Vector.z==4.0);
#else
    u_xlatb2.x = _Matcap_Vector.z==4.0;
#endif
    u_xlat16_5.yz = (u_xlatb2.x) ? u_xlat16_0.zy : u_xlat16_0.yz;
    u_xlat16_5.x = u_xlat16_0.x;
    u_xlatb2 = equal(_Matcap_Vector.zzzz, vec4(0.0, 1.0, 2.0, 3.0));
    u_xlat16_5.xyz = (u_xlatb2.w) ? u_xlat16_0.zyx : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.z) ? u_xlat16_0.xyw : u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_0.xzy * vec3(1.0, 1.0, -1.0);
    u_xlat16_7.xyz = u_xlat16_0.zyx * vec3(1.0, 1.0, -1.0);
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    u_xlat16_28 = u_xlat16_5.z + 1.0;
    u_xlat16_28 = sqrt(u_xlat16_28);
    u_xlat16_28 = u_xlat16_28 * 2.82842708;
    u_xlat16_5.xy = u_xlat16_5.xy / vec2(u_xlat16_28);
    u_xlat16_5.xy = u_xlat16_5.xy * _Matcap_Vector.xx;
    u_xlat16_28 = _Matcap_Vector.y * 0.00555555569 + -1.0;
    u_xlat16_28 = u_xlat16_28 * 3.14159274;
    u_xlat16_6.x = sin(u_xlat16_28);
    u_xlat16_7.x = cos(u_xlat16_28);
    u_xlat16_8.z = u_xlat16_6.x;
    u_xlat16_8.y = u_xlat16_7.x;
    u_xlat16_8.x = (-u_xlat16_6.x);
    u_xlat2.y = dot(u_xlat16_5.xy, u_xlat16_8.xy);
    u_xlat2.x = dot(u_xlat16_5.xy, u_xlat16_8.yz);
    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Matcap, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = texture(_CuEm_Mask, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * _CuEm_Vector.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_5.zzz;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0 = texture(_CubeMap, u_xlat16_1.xyz);
    u_xlat16_1.x = u_xlat16_1.y * _Cube_Vector.y + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + (-_Cube_Vector.y);
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = log2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _Cube_Vector.xxx;
    u_xlat16_10.xyz = exp2(u_xlat16_10.xyz);
    u_xlat16_10.xyz = u_xlat16_0.www * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_5.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_isCompressed);
#else
    u_xlatb2.x = 0.5<_isCompressed;
#endif
    u_xlat16_11.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xzw = u_xlat16_11.xyz * u_xlat16_5.xzw;
    u_xlat16_6.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_6.xyz = u_xlat16_11.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_5.xzw = (u_xlatb2.x) ? u_xlat16_6.xyz : u_xlat16_5.xzw;
    u_xlat16_6.xyz = u_xlat16_5.xzw * u_xlat16_5.yyy;
    u_xlat16_5.xyz = u_xlat16_5.xzw * _MainColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _CubeColor.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.5<_LMisCompressed);
#else
    u_xlatb2.x = 0.5<_LMisCompressed;
#endif
    u_xlat16_11.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = (-u_xlat16_11.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_7.xyz = u_xlat16_11.xyz / u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightMapColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_7.xyz = u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_7.xyz;
    u_xlat2.xy = _LG_Vector.yz * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlatb3.xyz = equal(vec4(_LGMask_UV, _LG_UV, _LG_UV, _LGMask_UV), vec4(0.0, 1.0, 2.0, 0.0)).xyz;
    u_xlat20.xy = (u_xlatb3.z) ? vs_TEXCOORD4.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = (u_xlatb3.y) ? vs_TEXCOORD0.zw : u_xlat20.xy;
    u_xlat16_6.xy = (u_xlatb3.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xyz = texture(_LGMask, u_xlat16_6.xy).xyz;
    u_xlat2.xy = u_xlat2.xy + u_xlat20.xy;
    u_xlat2.xy = u_xlat2.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * _LG_Vector.xxx;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_5.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * u_xlat2.xxx + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb29 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : vs_TEXCOORD3.xyz;
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
    u_xlat11.x = max((-u_xlat0.w), u_xlat2.x);
    u_xlat11.x = (-u_xlat2.x) + u_xlat11.x;
    u_xlat0.z = _ShadowBias.y * u_xlat11.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_28 = (-_ShadowBias.w) + 1.0;
    u_xlat11.x = (-u_xlat16_28) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat11.x + u_xlat16_28;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * _shadowStrength + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat11.xyz = (-u_xlat16_1.xyz) * u_xlat2.xxx + vec3(_FogColor.x, _FogColor.y, _FogColor.z);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vs_TEXCOORD3.www * u_xlat11.xyz + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.5<_FogVector.x);
#else
    u_xlatb29 = 0.5<_FogVector.x;
#endif
    SV_Target0.xyz = (bool(u_xlatb29)) ? u_xlat2.xyz : u_xlat3.xyz;
    SV_Target0.w = 1.0;
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
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LM_ON" }
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
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
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
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LM_ON" }
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
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
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
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LM_ON" }
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
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
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
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LM_ON" }
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
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUBE_ON" "_LG_ON" "_LM_ON" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_Scene_CompressionOldGUI"
}