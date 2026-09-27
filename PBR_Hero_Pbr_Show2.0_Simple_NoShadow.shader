//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PBR/Hero_Pbr_Show2.0_Simple_NoShadow" {
Properties {

_Intensity ("整体强度", Float) = 1.0

_DirectionalLight_Color ("平行光颜色", Color) = (1,1,1,1)

_Ambient_Color ("环境光颜色", Color) = (0.5,0.5,0.5,1)

_MainTex ("MainTex", 2D) = "white" { }

_Normal ("法线贴图", 2D) = "bump" { }

[Toggle(_EMISSION_ON)] _EMISSION_ON ("自发光开关", Float) = 0.0

_EmissionTex ("自发光贴图(RGB)", 2D) = "black" { }

_Em_Intensity ("自发光强度", Float) = 1.0

_Em_Speed ("自发光呼吸速度", Float) = 0.0

[Space(10)] [Header(CubeMap)] _Cubemap ("Cubemap", Cube) = "_Skybox" { }

_Cube_Intensity ("Cube强度", Float) = 1.0

[Space(10)] [Header(Sanshe)] [Toggle(_Directional_Sanshe)] _Directional_Sanshe ("补光类型(关闭:边缘光;打开:平行光)", Float) = 0.0

_Sanshe_color ("补光颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe_Fw ("补光范围", Range(0, 10)) = 1.0

_Sanshe_Power ("补光强度", Float) = 0.0

_Sanshe_X ("补光X轴偏移", Range(-1, 1)) = 0.0

_Sanshe_Y ("补光Y轴偏移", Range(-1, 1)) = 0.0

[Toggle] _isGradient ("渐变补光", Float) = 0.0

_Sanshe_color_low ("渐变补光颜色(补光最低点以下颜色）", Color) = (0.5,0.5,0.5,1)

_Sanshe_GradientCenter ("渐变补光中心点高度偏移(相对模型中心)", Float) = 0.0

_Sanshe_GradientRange ("渐变补光范围", Float) = 0.0

[Space(8)] [Toggle(_SANSHE2)] _SANSHE2 ("补光2开关", Float) = 0.0

_Sanshe2_color ("补光2颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe2_Fw ("补光2范围", Range(0, 10)) = 1.0

_Sanshe2_Power ("补光2强度", Float) = 0.0

_Sanshe2_X ("补光2X轴偏移", Range(-1, 1)) = 0.0

_Sanshe2_Y ("补光2Y轴偏移", Range(-1, 1)) = 0.0

[Toggle] _isGradient2 ("渐变补光", Float) = 0.0

_Sanshe2_color_low ("渐变补光颜色(补光最低点以下颜色）", Color) = (0.5,0.5,0.5,1)

_Sanshe2_GradientCenter ("渐变补光中心点高度偏移(相对模型中心)", Float) = 0.0

_Sanshe2_GradientRange ("渐变补光范围", Float) = 0.0

[Space(10)] [Header(LiuGuang)] [Toggle(_LG_ON)] _LG_ON ("流光开关", Float) = 0.0

[Toggle] _Use_2U ("使用2U", Float) = 0.0

_LG_Mask ("流光遮罩(RGB色)", 2D) = "white" { }

_LG_Tex ("流光纹理", 2D) = "black" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Intensity ("流光强度", Float) = 1.0

_U_LG ("U向流动速度", Float) = 0.0

_V_LG ("V向流动速度", Float) = 0.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "ForwardBase"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
  GpuProgramID 17886
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat7.xy).xyz;
    u_xlat16_7.xyz = texture(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat19 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat20 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat19 = u_xlat19 + (-u_xlat20);
    u_xlat19 = u_xlat19 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat3.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat7.xy).xyz;
    u_xlat16_7.xyz = texture(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat19 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat20 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat19 = u_xlat19 + (-u_xlat20);
    u_xlat19 = u_xlat19 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat3.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
    u_xlat10_7.xyz = texture2D(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat19 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat20 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat19 = u_xlat19 + (-u_xlat20);
    u_xlat19 = u_xlat19 / _Sanshe_GradientRange;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz + _Sanshe_color_low.xyz;
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat3.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
    u_xlat10_7.xyz = texture2D(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat19 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat20 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat19 = u_xlat19 + (-u_xlat20);
    u_xlat19 = u_xlat19 / _Sanshe_GradientRange;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz + _Sanshe_color_low.xyz;
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat3.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_LG_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec2 u_xlat14;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat7.xy).xyz;
    u_xlat16_7.xyz = texture(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat19 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat20 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat19 = u_xlat19 + (-u_xlat20);
    u_xlat19 = u_xlat19 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat3.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat19 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Use_2U==1.0);
#else
    u_xlatb2 = _Use_2U==1.0;
#endif
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = vec2(u_xlat19) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat14.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat16_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_LG_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec2 u_xlat14;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat7.xy).xyz;
    u_xlat16_7.xyz = texture(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat19 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat20 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat19 = u_xlat19 + (-u_xlat20);
    u_xlat19 = u_xlat19 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat3.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat19 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Use_2U==1.0);
#else
    u_xlatb2 = _Use_2U==1.0;
#endif
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = vec2(u_xlat19) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat14.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat16_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec2 u_xlat14;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
    u_xlat10_7.xyz = texture2D(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat19 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat20 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat19 = u_xlat19 + (-u_xlat20);
    u_xlat19 = u_xlat19 / _Sanshe_GradientRange;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz + _Sanshe_color_low.xyz;
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat3.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat19 = _Time.y + _TimeEditor.y;
    u_xlatb2 = _Use_2U==1.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = vec2(u_xlat19) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat10_3.xyz = texture2D(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat14.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_0.xyz * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat10_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec2 u_xlat14;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
    u_xlat10_7.xyz = texture2D(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat19 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat20 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat19 = u_xlat19 + (-u_xlat20);
    u_xlat19 = u_xlat19 / _Sanshe_GradientRange;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz + _Sanshe_color_low.xyz;
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat3.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat19 = _Time.y + _TimeEditor.y;
    u_xlatb2 = _Use_2U==1.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = vec2(u_xlat19) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat10_3.xyz = texture2D(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat14.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_0.xyz * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat10_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EMISSION_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
mediump float u_xlat16_21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_21 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_0.xyz = vec3(u_xlat16_21) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat8.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat8.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat8.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat22 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat22 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat22 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat23 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat22 = u_xlat22 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Fw;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat22 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat22);
    u_xlat22 = _Time.y * _Em_Speed;
    u_xlat22 = sin(u_xlat22);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat22)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_6.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_6.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EMISSION_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
mediump float u_xlat16_21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_21 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_0.xyz = vec3(u_xlat16_21) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat8.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat8.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat8.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat22 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat22 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat22 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat23 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat22 = u_xlat22 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Fw;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat22 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat22);
    u_xlat22 = _Time.y * _Em_Speed;
    u_xlat22 = sin(u_xlat22);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat22)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_6.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_6.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
mediump float u_xlat16_21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_21 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_0.xyz = vec3(u_xlat16_21) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat8.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat8.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat8.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat22 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat22 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat22 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat23 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat22 = u_xlat22 / _Sanshe_GradientRange;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Fw;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat22 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat22);
    u_xlat22 = _Time.y * _Em_Speed;
    u_xlat22 = sin(u_xlat22);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat22)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_6.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_6.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
mediump float u_xlat16_21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_21 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_0.xyz = vec3(u_xlat16_21) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat8.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat8.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat8.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat22 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat22 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat22 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat23 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat22 = u_xlat22 / _Sanshe_GradientRange;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Fw;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat22 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat22);
    u_xlat22 = _Time.y * _Em_Speed;
    u_xlat22 = sin(u_xlat22);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat22)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_6.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_6.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EMISSION_ON" "_LG_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
vec2 u_xlat17;
mediump float u_xlat16_21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_21 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_0.xyz = vec3(u_xlat16_21) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat8.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat8.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat8.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat22 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat22 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat22 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat23 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat22 = u_xlat22 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Fw;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat22 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_Use_2U==1.0);
#else
    u_xlatb23 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb23)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat17.xy = vec2(u_xlat22) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat17.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat22 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat22);
    u_xlat22 = _Time.y * _Em_Speed;
    u_xlat22 = sin(u_xlat22);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat22)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_6.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_6.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EMISSION_ON" "_LG_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
vec2 u_xlat17;
mediump float u_xlat16_21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_21 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_0.xyz = vec3(u_xlat16_21) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat8.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat8.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat8.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat22 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat22 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat22 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat23 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat22 = u_xlat22 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Fw;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat22 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_Use_2U==1.0);
#else
    u_xlatb23 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb23)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat17.xy = vec2(u_xlat22) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat17.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat22 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat22);
    u_xlat22 = _Time.y * _Em_Speed;
    u_xlat22 = sin(u_xlat22);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat22)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_6.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_6.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ON" "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
vec2 u_xlat17;
mediump float u_xlat16_21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_21 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_0.xyz = vec3(u_xlat16_21) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat8.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat8.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat8.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat22 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat22 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat22 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat23 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat22 = u_xlat22 / _Sanshe_GradientRange;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Fw;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat22 = _Time.y + _TimeEditor.y;
    u_xlatb23 = _Use_2U==1.0;
    u_xlat3.xy = (bool(u_xlatb23)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat17.xy = vec2(u_xlat22) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat17.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat10_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat22 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat22);
    u_xlat22 = _Time.y * _Em_Speed;
    u_xlat22 = sin(u_xlat22);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat22)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_6.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_6.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ON" "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
vec2 u_xlat17;
mediump float u_xlat16_21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_21 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_0.xyz = vec3(u_xlat16_21) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat8.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat8.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat8.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat22 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat22 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat22 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat22 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat23 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat22 = u_xlat22 / _Sanshe_GradientRange;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Fw;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat22 = _Time.y + _TimeEditor.y;
    u_xlatb23 = _Use_2U==1.0;
    u_xlat3.xy = (bool(u_xlatb23)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat17.xy = vec2(u_xlat22) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat17.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat10_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat22 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat22);
    u_xlat22 = _Time.y * _Em_Speed;
    u_xlat22 = sin(u_xlat22);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat22)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_6.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_6.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
bvec2 u_xlatb14;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat7.xy).xyz;
    u_xlat16_7.xyz = texture(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat8.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat8.xy = u_xlat8.xy + (-u_xlat3.xy);
    u_xlat8.xy = u_xlat8.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat8.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb14.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb14.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat8.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb14.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
bvec2 u_xlatb14;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat7.xy).xyz;
    u_xlat16_7.xyz = texture(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat8.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat8.xy = u_xlat8.xy + (-u_xlat3.xy);
    u_xlat8.xy = u_xlat8.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat8.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb14.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb14.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat8.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb14.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec2 u_xlat8;
bvec2 u_xlatb14;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
    u_xlat10_7.xyz = texture2D(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat8.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat8.xy = u_xlat8.xy + (-u_xlat3.xy);
    u_xlat8.xy = u_xlat8.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat8.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb14.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb14.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat8.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb14.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec2 u_xlat8;
bvec2 u_xlatb14;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
    u_xlat10_7.xyz = texture2D(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat8.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat8.xy = u_xlat8.xy + (-u_xlat3.xy);
    u_xlat8.xy = u_xlat8.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat8.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb14.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb14.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat8.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb14.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_LG_ON" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
vec2 u_xlat14;
bvec2 u_xlatb14;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat7.xy).xyz;
    u_xlat16_7.xyz = texture(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat8.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat8.xy = u_xlat8.xy + (-u_xlat3.xy);
    u_xlat8.xy = u_xlat8.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat8.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb14.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb14.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat8.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb14.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat19 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Use_2U==1.0);
#else
    u_xlatb2 = _Use_2U==1.0;
#endif
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = vec2(u_xlat19) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat14.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat16_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_LG_ON" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
vec2 u_xlat14;
bvec2 u_xlatb14;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat7.xy).xyz;
    u_xlat16_7.xyz = texture(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat8.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat8.xy = u_xlat8.xy + (-u_xlat3.xy);
    u_xlat8.xy = u_xlat8.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat8.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb14.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb14.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat8.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb14.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat19 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Use_2U==1.0);
#else
    u_xlatb2 = _Use_2U==1.0;
#endif
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = vec2(u_xlat19) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat14.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat16_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_LG_ON" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec2 u_xlat8;
vec2 u_xlat14;
bvec2 u_xlatb14;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
    u_xlat10_7.xyz = texture2D(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat8.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat8.xy = u_xlat8.xy + (-u_xlat3.xy);
    u_xlat8.xy = u_xlat8.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat8.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb14.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb14.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat8.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb14.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat19 = _Time.y + _TimeEditor.y;
    u_xlatb2 = _Use_2U==1.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = vec2(u_xlat19) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat10_3.xyz = texture2D(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat14.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_0.xyz * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat10_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_LG_ON" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec2 u_xlat8;
vec2 u_xlat14;
bvec2 u_xlatb14;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
    u_xlat10_7.xyz = texture2D(_Normal, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat19 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat3.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat3.z = vs_TEXCOORD7.z;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat8.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat8.xy = u_xlat8.xy + (-u_xlat3.xy);
    u_xlat8.xy = u_xlat8.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat8.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb14.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb14.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat8.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb14.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat19 = _Time.y + _TimeEditor.y;
    u_xlatb2 = _Use_2U==1.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat14.xy = vec2(u_xlat19) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat10_3.xyz = texture2D(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat14.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_0.xyz * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat10_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EMISSION_ON" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat7;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat15;
mediump float u_xlat16_18;
float u_xlat19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat7.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat7.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat19 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat19 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat20 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = log2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Fw;
    u_xlat20 = exp2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat15.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat15.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat9.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat9.xyz = (u_xlatb4.y) ? u_xlat9.xyz : _Sanshe2_color.xyz;
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat9.xyz;
    u_xlat10.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat10.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat9.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat19 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat19);
    u_xlat19 = _Time.y * _Em_Speed;
    u_xlat19 = sin(u_xlat19);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat19)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EMISSION_ON" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat7;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat15;
mediump float u_xlat16_18;
float u_xlat19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat7.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat7.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat19 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat19 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat20 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = log2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Fw;
    u_xlat20 = exp2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat15.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat15.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat9.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat9.xyz = (u_xlatb4.y) ? u_xlat9.xyz : _Sanshe2_color.xyz;
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat9.xyz;
    u_xlat10.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat10.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat9.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat19 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat19);
    u_xlat19 = _Time.y * _Em_Speed;
    u_xlat19 = sin(u_xlat19);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat19)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ON" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat7;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat15;
mediump float u_xlat16_18;
float u_xlat19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat7.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat19 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat19 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat20 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = log2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Fw;
    u_xlat20 = exp2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat15.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat15.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat9.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat9.xyz = (u_xlatb4.y) ? u_xlat9.xyz : _Sanshe2_color.xyz;
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat9.xyz;
    u_xlat10.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat10.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat9.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat19 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat19);
    u_xlat19 = _Time.y * _Em_Speed;
    u_xlat19 = sin(u_xlat19);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat19)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ON" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat7;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat15;
mediump float u_xlat16_18;
float u_xlat19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat7.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat19 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat19 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat20 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = log2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Fw;
    u_xlat20 = exp2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat15.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat15.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat9.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat9.xyz = (u_xlatb4.y) ? u_xlat9.xyz : _Sanshe2_color.xyz;
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat9.xyz;
    u_xlat10.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat10.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat9.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat19 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat19);
    u_xlat19 = _Time.y * _Em_Speed;
    u_xlat19 = sin(u_xlat19);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat19)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat7;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat15;
mediump float u_xlat16_18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat7.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat7.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat19 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat19 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat20 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = log2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Fw;
    u_xlat20 = exp2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat15.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat15.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat9.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat9.xyz = (u_xlatb4.y) ? u_xlat9.xyz : _Sanshe2_color.xyz;
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat9.xyz;
    u_xlat10.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat10.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat9.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat19 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(_Use_2U==1.0);
#else
    u_xlatb20 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb20)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat19) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat19 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat19);
    u_xlat19 = _Time.y * _Em_Speed;
    u_xlat19 = sin(u_xlat19);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat19)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat7;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat15;
mediump float u_xlat16_18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat7.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat7.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat19 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat19 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat20 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = log2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Fw;
    u_xlat20 = exp2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat15.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat15.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat9.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat9.xyz = (u_xlatb4.y) ? u_xlat9.xyz : _Sanshe2_color.xyz;
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat9.xyz;
    u_xlat10.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat10.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat9.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat19 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(_Use_2U==1.0);
#else
    u_xlatb20 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb20)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat19) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat19 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat19);
    u_xlat19 = _Time.y * _Em_Speed;
    u_xlat19 = sin(u_xlat19);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat19)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat7;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat15;
mediump float u_xlat16_18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat7.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat19 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat19 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat20 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = log2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Fw;
    u_xlat20 = exp2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat15.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat15.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat9.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat9.xyz = (u_xlatb4.y) ? u_xlat9.xyz : _Sanshe2_color.xyz;
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat9.xyz;
    u_xlat10.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat10.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat9.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat19 = _Time.y + _TimeEditor.y;
    u_xlatb20 = _Use_2U==1.0;
    u_xlat3.xy = (bool(u_xlatb20)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat19) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat10_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat19 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat19);
    u_xlat19 = _Time.y * _Em_Speed;
    u_xlat19 = sin(u_xlat19);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat19)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
bvec2 u_xlatb4;
mediump vec3 u_xlat16_5;
vec2 u_xlat7;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat15;
mediump float u_xlat16_18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_18 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_0.xyz = vec3(u_xlat16_18) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat7.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat7.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat19)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat19 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat19 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat19 = u_xlat19 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat19) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat19 = max(u_xlat19, 0.0);
    u_xlat19 = log2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Fw;
    u_xlat19 = exp2(u_xlat19);
    u_xlat19 = u_xlat19 * _Sanshe_Power;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat20 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = max(u_xlat20, 0.0);
    u_xlat20 = log2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Fw;
    u_xlat20 = exp2(u_xlat20);
    u_xlat20 = u_xlat20 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat15.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat15.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat9.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat9.xyz = (u_xlatb4.y) ? u_xlat9.xyz : _Sanshe2_color.xyz;
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat9.xyz;
    u_xlat10.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat10.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat4.xyz + u_xlat9.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat19 = _Time.y + _TimeEditor.y;
    u_xlatb20 = _Use_2U==1.0;
    u_xlat3.xy = (bool(u_xlatb20)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat19) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat10_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat19 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat19);
    u_xlat19 = _Time.y * _Em_Speed;
    u_xlat19 = sin(u_xlat19);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat19)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_27;
float u_xlat28;
bool u_xlatb28;
float u_xlat29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat10.xy).xyz;
    u_xlat16_10.xyz = texture(_Normal, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat10.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat28 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat28 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat29 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat28 = u_xlat28 + (-u_xlat29);
    u_xlat28 = u_xlat28 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat3.xyz = (bool(u_xlatb28)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6 = sin(u_xlat4.y);
    u_xlat7 = cos(u_xlat4.y);
    u_xlat28 = u_xlat4.x + u_xlat7;
    u_xlat5.y = u_xlat6;
    u_xlat5.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_27;
float u_xlat28;
bool u_xlatb28;
float u_xlat29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat10.xy).xyz;
    u_xlat16_10.xyz = texture(_Normal, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat10.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat28 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat28 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat29 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat28 = u_xlat28 + (-u_xlat29);
    u_xlat28 = u_xlat28 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat3.xyz = (bool(u_xlatb28)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6 = sin(u_xlat4.y);
    u_xlat7 = cos(u_xlat4.y);
    u_xlat28 = u_xlat4.x + u_xlat7;
    u_xlat5.y = u_xlat6;
    u_xlat5.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat10;
lowp vec3 u_xlat10_10;
mediump float u_xlat16_27;
float u_xlat28;
bool u_xlatb28;
float u_xlat29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat10.xy).xyz;
    u_xlat10_10.xyz = texture2D(_Normal, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_2.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat10.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat28 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat28 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat29 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat28 = u_xlat28 + (-u_xlat29);
    u_xlat28 = u_xlat28 / _Sanshe_GradientRange;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz + _Sanshe_color_low.xyz;
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat3.xyz = (bool(u_xlatb28)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6 = sin(u_xlat4.y);
    u_xlat7 = cos(u_xlat4.y);
    u_xlat28 = u_xlat4.x + u_xlat7;
    u_xlat5.y = u_xlat6;
    u_xlat5.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat10;
lowp vec3 u_xlat10_10;
mediump float u_xlat16_27;
float u_xlat28;
bool u_xlatb28;
float u_xlat29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat10.xy).xyz;
    u_xlat10_10.xyz = texture2D(_Normal, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_2.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat10.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat28 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat28 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat29 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat28 = u_xlat28 + (-u_xlat29);
    u_xlat28 = u_xlat28 / _Sanshe_GradientRange;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz + _Sanshe_color_low.xyz;
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat3.xyz = (bool(u_xlatb28)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6 = sin(u_xlat4.y);
    u_xlat7 = cos(u_xlat4.y);
    u_xlat28 = u_xlat4.x + u_xlat7;
    u_xlat5.y = u_xlat6;
    u_xlat5.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_LG_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec2 u_xlat20;
mediump float u_xlat16_27;
float u_xlat28;
bool u_xlatb28;
float u_xlat29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat10.xy).xyz;
    u_xlat16_10.xyz = texture(_Normal, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat10.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat28 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat28 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat29 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat28 = u_xlat28 + (-u_xlat29);
    u_xlat28 = u_xlat28 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat3.xyz = (bool(u_xlatb28)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6 = sin(u_xlat4.y);
    u_xlat7 = cos(u_xlat4.y);
    u_xlat28 = u_xlat4.x + u_xlat7;
    u_xlat5.y = u_xlat6;
    u_xlat5.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat28 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Use_2U==1.0);
#else
    u_xlatb2 = _Use_2U==1.0;
#endif
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = vec2(u_xlat28) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat20.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat16_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_LG_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec2 u_xlat20;
mediump float u_xlat16_27;
float u_xlat28;
bool u_xlatb28;
float u_xlat29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat10.xy).xyz;
    u_xlat16_10.xyz = texture(_Normal, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_2.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat10.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat28 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat28 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat29 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat28 = u_xlat28 + (-u_xlat29);
    u_xlat28 = u_xlat28 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat3.xyz = (bool(u_xlatb28)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6 = sin(u_xlat4.y);
    u_xlat7 = cos(u_xlat4.y);
    u_xlat28 = u_xlat4.x + u_xlat7;
    u_xlat5.y = u_xlat6;
    u_xlat5.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat28 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Use_2U==1.0);
#else
    u_xlatb2 = _Use_2U==1.0;
#endif
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = vec2(u_xlat28) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat20.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat16_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec2 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat10;
lowp vec3 u_xlat10_10;
vec2 u_xlat20;
mediump float u_xlat16_27;
float u_xlat28;
bool u_xlatb28;
float u_xlat29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat10.xy).xyz;
    u_xlat10_10.xyz = texture2D(_Normal, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_2.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat10.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat28 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat28 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat29 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat28 = u_xlat28 + (-u_xlat29);
    u_xlat28 = u_xlat28 / _Sanshe_GradientRange;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz + _Sanshe_color_low.xyz;
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat3.xyz = (bool(u_xlatb28)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6 = sin(u_xlat4.y);
    u_xlat7 = cos(u_xlat4.y);
    u_xlat28 = u_xlat4.x + u_xlat7;
    u_xlat5.y = u_xlat6;
    u_xlat5.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat28 = _Time.y + _TimeEditor.y;
    u_xlatb2 = _Use_2U==1.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = vec2(u_xlat28) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat10_3.xyz = texture2D(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat20.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_0.xyz * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat10_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec2 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat10;
lowp vec3 u_xlat10_10;
vec2 u_xlat20;
mediump float u_xlat16_27;
float u_xlat28;
bool u_xlatb28;
float u_xlat29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat10.xy).xyz;
    u_xlat10_10.xyz = texture2D(_Normal, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_2.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat10.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat28 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat28 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat29 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat28 = u_xlat28 + (-u_xlat29);
    u_xlat28 = u_xlat28 / _Sanshe_GradientRange;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz + _Sanshe_color_low.xyz;
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat3.xyz = (bool(u_xlatb28)) ? u_xlat3.xyz : _Sanshe_color.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6 = sin(u_xlat4.y);
    u_xlat7 = cos(u_xlat4.y);
    u_xlat28 = u_xlat4.x + u_xlat7;
    u_xlat5.y = u_xlat6;
    u_xlat5.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat28) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat28 = _Time.y + _TimeEditor.y;
    u_xlatb2 = _Use_2U==1.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat20.xy = vec2(u_xlat28) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat10_3.xyz = texture2D(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat20.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_0.xyz * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat10_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_9;
vec2 u_xlat11;
mediump float u_xlat16_30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat11.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat11.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat11.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat11.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat31 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat3.xyz = vec3(u_xlat31) * u_xlat3.xyz;
    u_xlat31 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat31)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat31 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat31 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat31 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat32 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat31 = u_xlat31 + (-u_xlat32);
    u_xlat31 = u_xlat31 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb31 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat4.xyz = (bool(u_xlatb31)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat5.xy = u_xlat5.xy * vec2(3.1400001, 3.1400001);
    u_xlat6.x = sin(u_xlat5.x);
    u_xlat5.x = cos(u_xlat5.x);
    u_xlat7 = sin(u_xlat5.y);
    u_xlat8 = cos(u_xlat5.y);
    u_xlat31 = u_xlat5.x + u_xlat8;
    u_xlat6.y = u_xlat7;
    u_xlat6.z = u_xlat31 * 0.5;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = log2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Fw;
    u_xlat31 = exp2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat31 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat31);
    u_xlat31 = _Time.y * _Em_Speed;
    u_xlat31 = sin(u_xlat31);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat31)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_9.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_9;
vec2 u_xlat11;
mediump float u_xlat16_30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat11.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat11.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat11.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat11.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat31 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat3.xyz = vec3(u_xlat31) * u_xlat3.xyz;
    u_xlat31 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat31)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat31 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat31 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat31 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat32 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat31 = u_xlat31 + (-u_xlat32);
    u_xlat31 = u_xlat31 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb31 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat4.xyz = (bool(u_xlatb31)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat5.xy = u_xlat5.xy * vec2(3.1400001, 3.1400001);
    u_xlat6.x = sin(u_xlat5.x);
    u_xlat5.x = cos(u_xlat5.x);
    u_xlat7 = sin(u_xlat5.y);
    u_xlat8 = cos(u_xlat5.y);
    u_xlat31 = u_xlat5.x + u_xlat8;
    u_xlat6.y = u_xlat7;
    u_xlat6.z = u_xlat31 * 0.5;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = log2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Fw;
    u_xlat31 = exp2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat31 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat31);
    u_xlat31 = _Time.y * _Em_Speed;
    u_xlat31 = sin(u_xlat31);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat31)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_9.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_9;
vec2 u_xlat11;
mediump float u_xlat16_30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat11.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat11.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat11.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat11.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat31 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat3.xyz = vec3(u_xlat31) * u_xlat3.xyz;
    u_xlat31 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat31)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat31 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat31 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat31 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat32 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat31 = u_xlat31 + (-u_xlat32);
    u_xlat31 = u_xlat31 / _Sanshe_GradientRange;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlatb31 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat4.xyz = (bool(u_xlatb31)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat5.xy = u_xlat5.xy * vec2(3.1400001, 3.1400001);
    u_xlat6.x = sin(u_xlat5.x);
    u_xlat5.x = cos(u_xlat5.x);
    u_xlat7 = sin(u_xlat5.y);
    u_xlat8 = cos(u_xlat5.y);
    u_xlat31 = u_xlat5.x + u_xlat8;
    u_xlat6.y = u_xlat7;
    u_xlat6.z = u_xlat31 * 0.5;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = log2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Fw;
    u_xlat31 = exp2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat31 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat31);
    u_xlat31 = _Time.y * _Em_Speed;
    u_xlat31 = sin(u_xlat31);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat31)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_9.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
vec2 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_9;
vec2 u_xlat11;
mediump float u_xlat16_30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat11.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat11.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat11.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat11.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat31 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat3.xyz = vec3(u_xlat31) * u_xlat3.xyz;
    u_xlat31 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat31)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat31 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat31 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat31 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat32 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat31 = u_xlat31 + (-u_xlat32);
    u_xlat31 = u_xlat31 / _Sanshe_GradientRange;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlatb31 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat4.xyz = (bool(u_xlatb31)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat5.xy = u_xlat5.xy * vec2(3.1400001, 3.1400001);
    u_xlat6.x = sin(u_xlat5.x);
    u_xlat5.x = cos(u_xlat5.x);
    u_xlat7 = sin(u_xlat5.y);
    u_xlat8 = cos(u_xlat5.y);
    u_xlat31 = u_xlat5.x + u_xlat8;
    u_xlat6.y = u_xlat7;
    u_xlat6.z = u_xlat31 * 0.5;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = log2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Fw;
    u_xlat31 = exp2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat31 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat31);
    u_xlat31 = _Time.y * _Em_Speed;
    u_xlat31 = sin(u_xlat31);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat31)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_9.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_9;
vec2 u_xlat11;
vec2 u_xlat23;
mediump float u_xlat16_30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat11.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat11.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat11.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat11.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat31 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat3.xyz = vec3(u_xlat31) * u_xlat3.xyz;
    u_xlat31 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat31)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat31 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat31 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat31 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat32 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat31 = u_xlat31 + (-u_xlat32);
    u_xlat31 = u_xlat31 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb31 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat4.xyz = (bool(u_xlatb31)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat5.xy = u_xlat5.xy * vec2(3.1400001, 3.1400001);
    u_xlat6.x = sin(u_xlat5.x);
    u_xlat5.x = cos(u_xlat5.x);
    u_xlat7 = sin(u_xlat5.y);
    u_xlat8 = cos(u_xlat5.y);
    u_xlat31 = u_xlat5.x + u_xlat8;
    u_xlat6.y = u_xlat7;
    u_xlat6.z = u_xlat31 * 0.5;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = log2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Fw;
    u_xlat31 = exp2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat31 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_Use_2U==1.0);
#else
    u_xlatb32 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb32)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat23.xy = vec2(u_xlat31) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat23.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat31 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat31);
    u_xlat31 = _Time.y * _Em_Speed;
    u_xlat31 = sin(u_xlat31);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat31)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_9.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_9;
vec2 u_xlat11;
vec2 u_xlat23;
mediump float u_xlat16_30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat11.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat11.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat11.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat11.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat31 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat3.xyz = vec3(u_xlat31) * u_xlat3.xyz;
    u_xlat31 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat31)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat31 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat31 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat31 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat32 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat31 = u_xlat31 + (-u_xlat32);
    u_xlat31 = u_xlat31 / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient));
#else
    u_xlatb31 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
#endif
    u_xlat4.xyz = (bool(u_xlatb31)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat5.xy = u_xlat5.xy * vec2(3.1400001, 3.1400001);
    u_xlat6.x = sin(u_xlat5.x);
    u_xlat5.x = cos(u_xlat5.x);
    u_xlat7 = sin(u_xlat5.y);
    u_xlat8 = cos(u_xlat5.y);
    u_xlat31 = u_xlat5.x + u_xlat8;
    u_xlat6.y = u_xlat7;
    u_xlat6.z = u_xlat31 * 0.5;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = log2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Fw;
    u_xlat31 = exp2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat31 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_Use_2U==1.0);
#else
    u_xlatb32 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb32)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat23.xy = vec2(u_xlat31) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat23.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat31 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat31);
    u_xlat31 = _Time.y * _Em_Speed;
    u_xlat31 = sin(u_xlat31);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat31)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_9.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_9;
vec2 u_xlat11;
vec2 u_xlat23;
mediump float u_xlat16_30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat11.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat11.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat11.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat11.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat31 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat3.xyz = vec3(u_xlat31) * u_xlat3.xyz;
    u_xlat31 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat31)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat31 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat31 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat31 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat32 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat31 = u_xlat31 + (-u_xlat32);
    u_xlat31 = u_xlat31 / _Sanshe_GradientRange;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlatb31 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat4.xyz = (bool(u_xlatb31)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat5.xy = u_xlat5.xy * vec2(3.1400001, 3.1400001);
    u_xlat6.x = sin(u_xlat5.x);
    u_xlat5.x = cos(u_xlat5.x);
    u_xlat7 = sin(u_xlat5.y);
    u_xlat8 = cos(u_xlat5.y);
    u_xlat31 = u_xlat5.x + u_xlat8;
    u_xlat6.y = u_xlat7;
    u_xlat6.z = u_xlat31 * 0.5;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = log2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Fw;
    u_xlat31 = exp2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat31 = _Time.y + _TimeEditor.y;
    u_xlatb32 = _Use_2U==1.0;
    u_xlat3.xy = (bool(u_xlatb32)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat23.xy = vec2(u_xlat31) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat23.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat10_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat31 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat31);
    u_xlat31 = _Time.y * _Em_Speed;
    u_xlat31 = sin(u_xlat31);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat31)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_9.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat8;
mediump vec3 u_xlat16_9;
vec2 u_xlat11;
vec2 u_xlat23;
mediump float u_xlat16_30;
float u_xlat31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_30 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_0.xyz = vec3(u_xlat16_30) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat11.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat11.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat11.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat11.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat31 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat3.xyz = vec3(u_xlat31) * u_xlat3.xyz;
    u_xlat31 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat31)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat31 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat31 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat31 = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD2.y;
    u_xlat32 = hlslcc_mtx4x4unity_ObjectToWorld[3].y + _Sanshe_GradientCenter;
    u_xlat31 = u_xlat31 + (-u_xlat32);
    u_xlat31 = u_xlat31 / _Sanshe_GradientRange;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlatb31 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_isGradient);
    u_xlat4.xyz = (bool(u_xlatb31)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat5.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat5.xy = u_xlat5.xy * vec2(3.1400001, 3.1400001);
    u_xlat6.x = sin(u_xlat5.x);
    u_xlat5.x = cos(u_xlat5.x);
    u_xlat7 = sin(u_xlat5.y);
    u_xlat8 = cos(u_xlat5.y);
    u_xlat31 = u_xlat5.x + u_xlat8;
    u_xlat6.y = u_xlat7;
    u_xlat6.z = u_xlat31 * 0.5;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = log2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Fw;
    u_xlat31 = exp2(u_xlat31);
    u_xlat31 = u_xlat31 * _Sanshe_Power;
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat31 = _Time.y + _TimeEditor.y;
    u_xlatb32 = _Use_2U==1.0;
    u_xlat3.xy = (bool(u_xlatb32)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat23.xy = vec2(u_xlat31) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat23.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat10_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat31 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat31);
    u_xlat31 = _Time.y * _Em_Speed;
    u_xlat31 = sin(u_xlat31);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat31)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_9.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec2 u_xlat10;
bvec2 u_xlatb18;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat9.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat9.xy).xyz;
    u_xlat16_9.xyz = texture(_Normal, u_xlat9.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat9.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat25 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat25 = u_xlat25 + u_xlat25;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat25)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat25 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat25 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat3.x = sin(u_xlat0.x);
    u_xlat4.x = cos(u_xlat0.x);
    u_xlat5 = sin(u_xlat0.y);
    u_xlat6 = cos(u_xlat0.y);
    u_xlat25 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat3.x = sin(u_xlat0.z);
    u_xlat4.x = cos(u_xlat0.z);
    u_xlat5 = sin(u_xlat0.w);
    u_xlat6 = cos(u_xlat0.w);
    u_xlat26 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat26 * 0.5;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat10.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat10.xy = u_xlat10.xy + (-u_xlat3.xy);
    u_xlat10.xy = u_xlat10.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat10.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb18.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat10.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb18.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_7.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_7.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec2 u_xlat10;
bvec2 u_xlatb18;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat9.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat9.xy).xyz;
    u_xlat16_9.xyz = texture(_Normal, u_xlat9.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat9.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat25 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat25 = u_xlat25 + u_xlat25;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat25)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat25 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat25 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat3.x = sin(u_xlat0.x);
    u_xlat4.x = cos(u_xlat0.x);
    u_xlat5 = sin(u_xlat0.y);
    u_xlat6 = cos(u_xlat0.y);
    u_xlat25 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat3.x = sin(u_xlat0.z);
    u_xlat4.x = cos(u_xlat0.z);
    u_xlat5 = sin(u_xlat0.w);
    u_xlat6 = cos(u_xlat0.w);
    u_xlat26 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat26 * 0.5;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat10.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat10.xy = u_xlat10.xy + (-u_xlat3.xy);
    u_xlat10.xy = u_xlat10.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat10.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb18.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat10.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb18.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_7.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_7.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec2 u_xlat10;
bvec2 u_xlatb18;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat9.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat9.xy).xyz;
    u_xlat10_9.xyz = texture2D(_Normal, u_xlat9.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat10_2.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat9.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat25 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat25 = u_xlat25 + u_xlat25;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat25)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat25 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat25 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat3.x = sin(u_xlat0.x);
    u_xlat4.x = cos(u_xlat0.x);
    u_xlat5 = sin(u_xlat0.y);
    u_xlat6 = cos(u_xlat0.y);
    u_xlat25 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat3.x = sin(u_xlat0.z);
    u_xlat4.x = cos(u_xlat0.z);
    u_xlat5 = sin(u_xlat0.w);
    u_xlat6 = cos(u_xlat0.w);
    u_xlat26 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat26 * 0.5;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat10.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat10.xy = u_xlat10.xy + (-u_xlat3.xy);
    u_xlat10.xy = u_xlat10.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat10.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb18.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat10.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb18.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_7.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_7.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec2 u_xlat10;
bvec2 u_xlatb18;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat9.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat9.xy).xyz;
    u_xlat10_9.xyz = texture2D(_Normal, u_xlat9.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat10_2.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat9.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat25 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat25 = u_xlat25 + u_xlat25;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat25)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat25 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat25 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat3.x = sin(u_xlat0.x);
    u_xlat4.x = cos(u_xlat0.x);
    u_xlat5 = sin(u_xlat0.y);
    u_xlat6 = cos(u_xlat0.y);
    u_xlat25 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat3.x = sin(u_xlat0.z);
    u_xlat4.x = cos(u_xlat0.z);
    u_xlat5 = sin(u_xlat0.w);
    u_xlat6 = cos(u_xlat0.w);
    u_xlat26 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat26 * 0.5;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat10.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat10.xy = u_xlat10.xy + (-u_xlat3.xy);
    u_xlat10.xy = u_xlat10.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat10.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb18.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat10.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb18.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_7.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_7.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec2 u_xlat10;
vec2 u_xlat18;
bvec2 u_xlatb18;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat9.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat9.xy).xyz;
    u_xlat16_9.xyz = texture(_Normal, u_xlat9.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat9.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat25 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat25 = u_xlat25 + u_xlat25;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat25)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat25 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat25 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat3.x = sin(u_xlat0.x);
    u_xlat4.x = cos(u_xlat0.x);
    u_xlat5 = sin(u_xlat0.y);
    u_xlat6 = cos(u_xlat0.y);
    u_xlat25 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat3.x = sin(u_xlat0.z);
    u_xlat4.x = cos(u_xlat0.z);
    u_xlat5 = sin(u_xlat0.w);
    u_xlat6 = cos(u_xlat0.w);
    u_xlat26 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat26 * 0.5;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat10.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat10.xy = u_xlat10.xy + (-u_xlat3.xy);
    u_xlat10.xy = u_xlat10.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat10.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb18.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat10.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb18.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat25 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Use_2U==1.0);
#else
    u_xlatb2 = _Use_2U==1.0;
#endif
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat18.xy = vec2(u_xlat25) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat16_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_7.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_7.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec2 u_xlat10;
vec2 u_xlat18;
bvec2 u_xlatb18;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat9.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat9.xy).xyz;
    u_xlat16_9.xyz = texture(_Normal, u_xlat9.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat9.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat25 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat25 = u_xlat25 + u_xlat25;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat25)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat25 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat25 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat3.x = sin(u_xlat0.x);
    u_xlat4.x = cos(u_xlat0.x);
    u_xlat5 = sin(u_xlat0.y);
    u_xlat6 = cos(u_xlat0.y);
    u_xlat25 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat3.x = sin(u_xlat0.z);
    u_xlat4.x = cos(u_xlat0.z);
    u_xlat5 = sin(u_xlat0.w);
    u_xlat6 = cos(u_xlat0.w);
    u_xlat26 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat26 * 0.5;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat10.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat10.xy = u_xlat10.xy + (-u_xlat3.xy);
    u_xlat10.xy = u_xlat10.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat10.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb18.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat10.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb18.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat25 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Use_2U==1.0);
#else
    u_xlatb2 = _Use_2U==1.0;
#endif
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat18.xy = vec2(u_xlat25) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat16_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_7.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_7.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec2 u_xlat10;
vec2 u_xlat18;
bvec2 u_xlatb18;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat9.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat9.xy).xyz;
    u_xlat10_9.xyz = texture2D(_Normal, u_xlat9.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat10_2.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat9.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat25 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat25 = u_xlat25 + u_xlat25;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat25)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat25 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat25 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat3.x = sin(u_xlat0.x);
    u_xlat4.x = cos(u_xlat0.x);
    u_xlat5 = sin(u_xlat0.y);
    u_xlat6 = cos(u_xlat0.y);
    u_xlat25 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat3.x = sin(u_xlat0.z);
    u_xlat4.x = cos(u_xlat0.z);
    u_xlat5 = sin(u_xlat0.w);
    u_xlat6 = cos(u_xlat0.w);
    u_xlat26 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat26 * 0.5;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat10.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat10.xy = u_xlat10.xy + (-u_xlat3.xy);
    u_xlat10.xy = u_xlat10.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat10.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb18.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat10.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb18.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat25 = _Time.y + _TimeEditor.y;
    u_xlatb2 = _Use_2U==1.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat18.xy = vec2(u_xlat25) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat10_3.xyz = texture2D(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_0.xyz * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat10_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_7.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_7.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec2 u_xlat10;
vec2 u_xlat18;
bvec2 u_xlatb18;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat9.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat9.xy).xyz;
    u_xlat10_9.xyz = texture2D(_Normal, u_xlat9.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat10_2.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat10_2.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat9.xyz * _Ambient_Color.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _DirectionalLight_Color.xyz + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat25 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat25 = u_xlat25 + u_xlat25;
    u_xlat3.xyz = u_xlat2.xyz * (-vec3(u_xlat25)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat3.xyz, 8.0);
    u_xlat25 = u_xlat3.y * 0.200000003 + 0.800000012;
    u_xlat3.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat25 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * 0.959999979 + 1.6e-05;
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(_Cube_Intensity) + u_xlat1.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat3.x = sin(u_xlat0.x);
    u_xlat4.x = cos(u_xlat0.x);
    u_xlat5 = sin(u_xlat0.y);
    u_xlat6 = cos(u_xlat0.y);
    u_xlat25 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat3.x = sin(u_xlat0.z);
    u_xlat4.x = cos(u_xlat0.z);
    u_xlat5 = sin(u_xlat0.w);
    u_xlat6 = cos(u_xlat0.w);
    u_xlat26 = u_xlat4.x + u_xlat6;
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat26 * 0.5;
    u_xlat2.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Fw;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _Sanshe2_Power;
    u_xlat10.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat3.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat10.xy = u_xlat10.xy + (-u_xlat3.xy);
    u_xlat10.xy = u_xlat10.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
    u_xlat3.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat10.yyy * u_xlat3.xyz + _Sanshe2_color_low.xyz;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient2)).xy;
    u_xlat3.xyz = (u_xlatb18.y) ? u_xlat3.xyz : _Sanshe2_color.xyz;
    u_xlat3.xyz = u_xlat2.xxx * u_xlat3.xyz;
    u_xlat4.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat2.xyw = u_xlat10.xxx * u_xlat4.xyz + _Sanshe_color_low.xyz;
    u_xlat2.xyz = (u_xlatb18.x) ? u_xlat2.xyw : _Sanshe_color.xyz;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat25 = _Time.y + _TimeEditor.y;
    u_xlatb2 = _Use_2U==1.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat18.xy = vec2(u_xlat25) * vec2(_U_LG, _V_LG) + u_xlat2.xy;
    u_xlat10_3.xyz = texture2D(_LG_Mask, u_xlat2.xy).xyz;
    u_xlat2.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_0.xyz * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_LG_Intensity);
    u_xlat2.xyz = u_xlat10_0.www * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat16_7.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_7.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec2 u_xlatb4;
float u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
vec3 u_xlat12;
vec3 u_xlat13;
vec2 u_xlat21;
mediump float u_xlat16_27;
float u_xlat28;
float u_xlat29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat10.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat10.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat28 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat28 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat4.x = sin(u_xlat0.x);
    u_xlat5 = cos(u_xlat0.x);
    u_xlat6 = sin(u_xlat0.y);
    u_xlat7 = cos(u_xlat0.y);
    u_xlat28 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat4.x = sin(u_xlat0.z);
    u_xlat5 = cos(u_xlat0.z);
    u_xlat6 = sin(u_xlat0.w);
    u_xlat7 = cos(u_xlat0.w);
    u_xlat29 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat29 * 0.5;
    u_xlat29 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat29 = max(u_xlat29, 0.0);
    u_xlat29 = log2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Fw;
    u_xlat29 = exp2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat21.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat21.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat12.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat12.xyz = (u_xlatb4.y) ? u_xlat12.xyz : _Sanshe2_color.xyz;
    u_xlat12.xyz = vec3(u_xlat29) * u_xlat12.xyz;
    u_xlat13.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat13.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat4.xyz + u_xlat12.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat28 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28);
    u_xlat28 = _Time.y * _Em_Speed;
    u_xlat28 = sin(u_xlat28);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat28)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec2 u_xlatb4;
float u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
vec3 u_xlat12;
vec3 u_xlat13;
vec2 u_xlat21;
mediump float u_xlat16_27;
float u_xlat28;
float u_xlat29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat10.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat10.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat28 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat28 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat4.x = sin(u_xlat0.x);
    u_xlat5 = cos(u_xlat0.x);
    u_xlat6 = sin(u_xlat0.y);
    u_xlat7 = cos(u_xlat0.y);
    u_xlat28 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat4.x = sin(u_xlat0.z);
    u_xlat5 = cos(u_xlat0.z);
    u_xlat6 = sin(u_xlat0.w);
    u_xlat7 = cos(u_xlat0.w);
    u_xlat29 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat29 * 0.5;
    u_xlat29 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat29 = max(u_xlat29, 0.0);
    u_xlat29 = log2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Fw;
    u_xlat29 = exp2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat21.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat21.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat12.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat12.xyz = (u_xlatb4.y) ? u_xlat12.xyz : _Sanshe2_color.xyz;
    u_xlat12.xyz = vec3(u_xlat29) * u_xlat12.xyz;
    u_xlat13.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat13.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat4.xyz + u_xlat12.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat28 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28);
    u_xlat28 = _Time.y * _Em_Speed;
    u_xlat28 = sin(u_xlat28);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat28)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
bvec2 u_xlatb4;
float u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
vec3 u_xlat12;
vec3 u_xlat13;
vec2 u_xlat21;
mediump float u_xlat16_27;
float u_xlat28;
float u_xlat29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat10.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat10.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat28 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat28 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat4.x = sin(u_xlat0.x);
    u_xlat5 = cos(u_xlat0.x);
    u_xlat6 = sin(u_xlat0.y);
    u_xlat7 = cos(u_xlat0.y);
    u_xlat28 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat4.x = sin(u_xlat0.z);
    u_xlat5 = cos(u_xlat0.z);
    u_xlat6 = sin(u_xlat0.w);
    u_xlat7 = cos(u_xlat0.w);
    u_xlat29 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat29 * 0.5;
    u_xlat29 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat29 = max(u_xlat29, 0.0);
    u_xlat29 = log2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Fw;
    u_xlat29 = exp2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat21.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat21.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat12.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat12.xyz = (u_xlatb4.y) ? u_xlat12.xyz : _Sanshe2_color.xyz;
    u_xlat12.xyz = vec3(u_xlat29) * u_xlat12.xyz;
    u_xlat13.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat13.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat4.xyz + u_xlat12.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat28 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28);
    u_xlat28 = _Time.y * _Em_Speed;
    u_xlat28 = sin(u_xlat28);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat28)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
bvec2 u_xlatb4;
float u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
vec3 u_xlat12;
vec3 u_xlat13;
vec2 u_xlat21;
mediump float u_xlat16_27;
float u_xlat28;
float u_xlat29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat10.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat10.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat28 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat28 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat4.x = sin(u_xlat0.x);
    u_xlat5 = cos(u_xlat0.x);
    u_xlat6 = sin(u_xlat0.y);
    u_xlat7 = cos(u_xlat0.y);
    u_xlat28 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat4.x = sin(u_xlat0.z);
    u_xlat5 = cos(u_xlat0.z);
    u_xlat6 = sin(u_xlat0.w);
    u_xlat7 = cos(u_xlat0.w);
    u_xlat29 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat29 * 0.5;
    u_xlat29 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat29 = max(u_xlat29, 0.0);
    u_xlat29 = log2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Fw;
    u_xlat29 = exp2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat21.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat21.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat12.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat12.xyz = (u_xlatb4.y) ? u_xlat12.xyz : _Sanshe2_color.xyz;
    u_xlat12.xyz = vec3(u_xlat29) * u_xlat12.xyz;
    u_xlat13.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat13.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat4.xyz + u_xlat12.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat28 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28);
    u_xlat28 = _Time.y * _Em_Speed;
    u_xlat28 = sin(u_xlat28);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat28)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
float u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
vec3 u_xlat12;
vec3 u_xlat13;
vec2 u_xlat21;
mediump float u_xlat16_27;
float u_xlat28;
float u_xlat29;
bool u_xlatb29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat10.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat10.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat28 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat28 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat4.x = sin(u_xlat0.x);
    u_xlat5 = cos(u_xlat0.x);
    u_xlat6 = sin(u_xlat0.y);
    u_xlat7 = cos(u_xlat0.y);
    u_xlat28 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat4.x = sin(u_xlat0.z);
    u_xlat5 = cos(u_xlat0.z);
    u_xlat6 = sin(u_xlat0.w);
    u_xlat7 = cos(u_xlat0.w);
    u_xlat29 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat29 * 0.5;
    u_xlat29 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat29 = max(u_xlat29, 0.0);
    u_xlat29 = log2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Fw;
    u_xlat29 = exp2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat21.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat21.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat12.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat12.xyz = (u_xlatb4.y) ? u_xlat12.xyz : _Sanshe2_color.xyz;
    u_xlat12.xyz = vec3(u_xlat29) * u_xlat12.xyz;
    u_xlat13.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat13.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat4.xyz + u_xlat12.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat28 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_Use_2U==1.0);
#else
    u_xlatb29 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb29)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat21.xy = vec2(u_xlat28) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat21.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat28 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28);
    u_xlat28 = _Time.y * _Em_Speed;
    u_xlat28 = sin(u_xlat28);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat28)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(5) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
float u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
vec3 u_xlat12;
vec3 u_xlat13;
vec2 u_xlat21;
mediump float u_xlat16_27;
float u_xlat28;
float u_xlat29;
bool u_xlatb29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat10.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_Normal, u_xlat10.xy).xyz;
    u_xlat16_1.xyz = texture(_EmissionTex, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat28 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat28 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat4.x = sin(u_xlat0.x);
    u_xlat5 = cos(u_xlat0.x);
    u_xlat6 = sin(u_xlat0.y);
    u_xlat7 = cos(u_xlat0.y);
    u_xlat28 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat4.x = sin(u_xlat0.z);
    u_xlat5 = cos(u_xlat0.z);
    u_xlat6 = sin(u_xlat0.w);
    u_xlat7 = cos(u_xlat0.w);
    u_xlat29 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat29 * 0.5;
    u_xlat29 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat29 = max(u_xlat29, 0.0);
    u_xlat29 = log2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Fw;
    u_xlat29 = exp2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat21.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat21.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat12.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat12.xyz = (u_xlatb4.y) ? u_xlat12.xyz : _Sanshe2_color.xyz;
    u_xlat12.xyz = vec3(u_xlat29) * u_xlat12.xyz;
    u_xlat13.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat13.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat4.xyz + u_xlat12.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat28 = _Time.y + _TimeEditor.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_Use_2U==1.0);
#else
    u_xlatb29 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb29)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat21.xy = vec2(u_xlat28) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat21.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat16_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat28 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28);
    u_xlat28 = _Time.y * _Em_Speed;
    u_xlat28 = sin(u_xlat28);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat28)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
bvec2 u_xlatb4;
float u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
vec3 u_xlat12;
vec3 u_xlat13;
vec2 u_xlat21;
mediump float u_xlat16_27;
float u_xlat28;
float u_xlat29;
bool u_xlatb29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat10.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat10.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat28 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat28 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat4.x = sin(u_xlat0.x);
    u_xlat5 = cos(u_xlat0.x);
    u_xlat6 = sin(u_xlat0.y);
    u_xlat7 = cos(u_xlat0.y);
    u_xlat28 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat4.x = sin(u_xlat0.z);
    u_xlat5 = cos(u_xlat0.z);
    u_xlat6 = sin(u_xlat0.w);
    u_xlat7 = cos(u_xlat0.w);
    u_xlat29 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat29 * 0.5;
    u_xlat29 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat29 = max(u_xlat29, 0.0);
    u_xlat29 = log2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Fw;
    u_xlat29 = exp2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat21.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat21.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat12.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat12.xyz = (u_xlatb4.y) ? u_xlat12.xyz : _Sanshe2_color.xyz;
    u_xlat12.xyz = vec3(u_xlat29) * u_xlat12.xyz;
    u_xlat13.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat13.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat4.xyz + u_xlat12.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat28 = _Time.y + _TimeEditor.y;
    u_xlatb29 = _Use_2U==1.0;
    u_xlat3.xy = (bool(u_xlatb29)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat21.xy = vec2(u_xlat28) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat21.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat10_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat28 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28);
    u_xlat28 = _Time.y * _Em_Speed;
    u_xlat28 = sin(u_xlat28);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat28)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _isGradient;
uniform 	float _isGradient2;
uniform 	vec4 _Sanshe_color_low;
uniform 	vec4 _Sanshe2_color_low;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe2_GradientCenter;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe2_GradientRange;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _TimeEditor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
bvec2 u_xlatb4;
float u_xlat5;
float u_xlat6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
vec3 u_xlat12;
vec3 u_xlat13;
vec2 u_xlat21;
mediump float u_xlat16_27;
float u_xlat28;
float u_xlat29;
bool u_xlatb29;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_27 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_0.xyz = vec3(u_xlat16_27) * u_xlat16_0.xyz;
    u_xlat1.x = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = max(u_xlat1.x, 0.100000001);
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.25 + -9.99999975e-06;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat10.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vec3(0.0399999991, 0.0399999991, 0.0399999991) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat10.xy).xyz;
    u_xlat10_1.xyz = texture2D(_EmissionTex, u_xlat10.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat4.xyz, 8.0);
    u_xlat28 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat28 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * 0.959999979 + 1.6e-05;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat2.xyz;
    u_xlat0 = (-vec4(_Sanshe_X, _Sanshe_Y, _Sanshe2_X, _Sanshe2_Y)) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat4.x = sin(u_xlat0.x);
    u_xlat5 = cos(u_xlat0.x);
    u_xlat6 = sin(u_xlat0.y);
    u_xlat7 = cos(u_xlat0.y);
    u_xlat28 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat28 * 0.5;
    u_xlat28 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = log2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Fw;
    u_xlat28 = exp2(u_xlat28);
    u_xlat28 = u_xlat28 * _Sanshe_Power;
    u_xlat4.x = sin(u_xlat0.z);
    u_xlat5 = cos(u_xlat0.z);
    u_xlat6 = sin(u_xlat0.w);
    u_xlat7 = cos(u_xlat0.w);
    u_xlat29 = u_xlat5 + u_xlat7;
    u_xlat4.y = u_xlat6;
    u_xlat4.z = u_xlat29 * 0.5;
    u_xlat29 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat29 = max(u_xlat29, 0.0);
    u_xlat29 = log2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Fw;
    u_xlat29 = exp2(u_xlat29);
    u_xlat29 = u_xlat29 * _Sanshe2_Power;
    u_xlat3.xy = vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange) * vec2(0.5, 0.5) + vs_TEXCOORD2.yy;
    u_xlat21.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].yy + vec2(_Sanshe_GradientCenter, _Sanshe2_GradientCenter);
    u_xlat3.xy = (-u_xlat21.xy) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy / vec2(_Sanshe_GradientRange, _Sanshe2_GradientRange);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xyz = (-_Sanshe2_color_low.xyz) + _Sanshe2_color.xyz;
    u_xlat12.xyz = u_xlat3.yyy * u_xlat4.xyz + _Sanshe2_color_low.xyz;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_isGradient, _isGradient2, _isGradient, _isGradient)).xy;
    u_xlat12.xyz = (u_xlatb4.y) ? u_xlat12.xyz : _Sanshe2_color.xyz;
    u_xlat12.xyz = vec3(u_xlat29) * u_xlat12.xyz;
    u_xlat13.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz + _Sanshe_color_low.xyz;
    u_xlat4.xyz = (u_xlatb4.x) ? u_xlat13.xyz : _Sanshe_color.xyz;
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat4.xyz + u_xlat12.xyz;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat28 = _Time.y + _TimeEditor.y;
    u_xlatb29 = _Use_2U==1.0;
    u_xlat3.xy = (bool(u_xlatb29)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat21.xy = vec2(u_xlat28) * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xy = u_xlat21.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat10_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_LG_Intensity);
    u_xlat3.xyz = u_xlat10_0.www * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat28 = max(_Em_Intensity, 0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28);
    u_xlat28 = _Time.y * _Em_Speed;
    u_xlat28 = sin(u_xlat28);
    u_xlat1.xyz = (-u_xlat1.xyz) * abs(vec3(u_xlat28)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_8.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
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
Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EMISSION_ON" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EMISSION_ON" "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ON" "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ON" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EMISSION_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EMISSION_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_Directional_Sanshe" "_EMISSION_ON" "_LG_ON" "_SANSHE2" }
""
}
}
}
}
}