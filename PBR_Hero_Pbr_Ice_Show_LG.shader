//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PBR/Hero_Pbr_Ice_Show_LG" {
Properties {

[Header(MainColor_______________________________________________________)] [Space(20)] _AlbedoMap ("漫反射", 2D) = "white" { }

_BaseColor ("漫反射颜色调整", Color) = (1.36262,1.26,1.5,1)

_NormalMap ("法线", 2D) = "bump" { }

[Header(InSideColor_______________________________________________________)] [Space(20)] [Toggle] _Albedo2UV2 ("内部细节用2U", Float) = 0.0

_Albedo2Map ("晶体内部细节", 2D) = "white" { }

_BaseColor2 ("内部颜色调整", Color) = (1.1647,1.164,1.16,1)

_MaskTex ("菲涅尔mask影响内部细节的范围", 2D) = "white" { }

_MaskRange ("菲涅尔mask的调整(XY)", Vector) = (0,0.11,0,0)

_FresnelRange ("菲涅尔范围", Range(0, 2)) = 1.1100000143051147

_FresnelPow ("菲涅尔对比", Float) = 4.46999979019165

[Header(SpecularColor_______________________________________________________)] [Space(20)] _SpecularMap ("高光颜色", 2D) = "white" { }

_SpColor ("高光颜色", Color) = (1.019,1.21087,1.396,1)

_SpeCapTex ("matcap高光遮罩", 2D) = "white" { }

[Header(RefractionColor_______________________________________________________)] [Space(10)] _RfCapTex ("matcap折射贴图", 2D) = "white" { }

_RfColor ("折射颜色", Color) = (1,1,1,1)

_EnvIntensity ("折射影响的总体控制", Color) = (1,1,1,1)

[Header(Shadow_________________________________________________________________)] _ShadowStrength ("ShadowStrength", Range(0, 1)) = 0.7200000286102295

_SPShadowColor ("SPShadowColor", Color) = (0.772059,0.915111,1,1)

[Header(Emission_______________________________________________________________)] [Toggle(_EMISSION_ON)] _EMISSION_ON ("自发光开关", Float) = 0.0

_EmissionTex ("自发光贴图(RGB)", 2D) = "black" { }

_Em_Intensity ("自发光强度", Float) = 1.0

_Em_Speed ("自发光呼吸速度", Float) = 0.0

[Header(LiuGuang_______________________________________________________________)] [Space(10)] [Toggle] _Use_2U ("使用2U", Float) = 0.0

_LG_Mask ("流光遮罩(RGB色)", 2D) = "white" { }

_LG_Tex ("流光纹理", 2D) = "black" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Intensity ("流光强度", Float) = 1.0

_U_LG ("U向流动速度", Float) = 0.0

_V_LG ("V向流动速度", Float) = 0.0

_LG_Fresnel ("流光菲涅尔遮罩范围", Range(0.01, 10)) = 0.009999999776482582

}
SubShader {
 LOD 100
 Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 43735
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
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
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_1.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat16_21 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat16_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb7 = 0.0<_Albedo2UV2;
#endif
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_3.xyz = texture(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _BaseColor2.xyz;
    u_xlat16_5.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat16_3.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb7 = _ShadowStrength!=1.0;
#endif
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat16_1.w;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
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
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_1.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat16_21 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat16_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb7 = 0.0<_Albedo2UV2;
#endif
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_3.xyz = texture(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _BaseColor2.xyz;
    u_xlat16_5.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat16_3.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb7 = _ShadowStrength!=1.0;
#endif
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat16_1.w;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat10_1.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat10_21 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat10_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_Albedo2UV2;
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_3.xyz = texture2D(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _BaseColor2.xyz;
    u_xlat10_5.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat10_3.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlatb7 = _ShadowStrength!=1.0;
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat10_2.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat10_1.w;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat10_1.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat10_21 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat10_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_Albedo2UV2;
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_3.xyz = texture2D(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _BaseColor2.xyz;
    u_xlat10_5.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat10_3.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlatb7 = _ShadowStrength!=1.0;
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat10_2.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat10_1.w;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD3.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(10) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_1.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat16_21 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat16_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb7 = 0.0<_Albedo2UV2;
#endif
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_3.xyz = texture(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _BaseColor2.xyz;
    u_xlat16_5.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat16_3.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
    u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
    u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat7.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat21 = (-_LightShadowData.x) + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat21 + _LightShadowData.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb7 = _ShadowStrength!=1.0;
#endif
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat16_1.w;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD3.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(10) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_1.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat16_21 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat16_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb7 = 0.0<_Albedo2UV2;
#endif
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_3.xyz = texture(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _BaseColor2.xyz;
    u_xlat16_5.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat16_3.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
    u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
    u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat7.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat21 = (-_LightShadowData.x) + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat21 + _LightShadowData.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb7 = _ShadowStrength!=1.0;
#endif
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat16_1.w;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD3.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat10_1.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat10_21 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat10_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_Albedo2UV2;
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_3.xyz = texture2D(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _BaseColor2.xyz;
    u_xlat10_5.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat10_3.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
    u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
    u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
    u_xlat7.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat21 = (-_LightShadowData.x) + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat21 + _LightShadowData.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlatb7 = _ShadowStrength!=1.0;
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat10_2.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat10_1.w;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD3.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat10_1.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat10_21 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat10_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_Albedo2UV2;
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_3.xyz = texture2D(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _BaseColor2.xyz;
    u_xlat10_5.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat10_3.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
    u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
    u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
    u_xlat7.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat21 = (-_LightShadowData.x) + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat21 + _LightShadowData.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlatb7 = _ShadowStrength!=1.0;
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat10_2.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat10_1.w;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_EMISSION_ON" }
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
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_1.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat16_21 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat16_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb7 = 0.0<_Albedo2UV2;
#endif
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_3.xyz = texture(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _BaseColor2.xyz;
    u_xlat16_5.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat16_3.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb7 = _ShadowStrength!=1.0;
#endif
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat16_1.w;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat14 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat14 = _Time.y * _Em_Speed;
    u_xlat14 = sin(u_xlat14);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat14)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_EMISSION_ON" }
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
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_1.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat16_21 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat16_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb7 = 0.0<_Albedo2UV2;
#endif
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_3.xyz = texture(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _BaseColor2.xyz;
    u_xlat16_5.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat16_3.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb7 = _ShadowStrength!=1.0;
#endif
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat16_1.w;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat14 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat14 = _Time.y * _Em_Speed;
    u_xlat14 = sin(u_xlat14);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat14)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat10_1.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat10_21 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat10_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_Albedo2UV2;
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_3.xyz = texture2D(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _BaseColor2.xyz;
    u_xlat10_5.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat10_3.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlatb7 = _ShadowStrength!=1.0;
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat10_2.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat10_1.w;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat14 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat14 = _Time.y * _Em_Speed;
    u_xlat14 = sin(u_xlat14);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat14)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat10_1.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat10_21 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat10_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_Albedo2UV2;
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_3.xyz = texture2D(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _BaseColor2.xyz;
    u_xlat10_5.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat10_3.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlatb7 = _ShadowStrength!=1.0;
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat10_2.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat10_1.w;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat14 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat14 = _Time.y * _Em_Speed;
    u_xlat14 = sin(u_xlat14);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat14)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_EMISSION_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD3.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(10) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(11) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_1.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat16_21 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat16_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb7 = 0.0<_Albedo2UV2;
#endif
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_3.xyz = texture(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _BaseColor2.xyz;
    u_xlat16_5.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat16_3.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
    u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
    u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat7.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat21 = (-_LightShadowData.x) + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat21 + _LightShadowData.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb7 = _ShadowStrength!=1.0;
#endif
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat16_1.w;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat14 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat14 = _Time.y * _Em_Speed;
    u_xlat14 = sin(u_xlat14);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat14)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_EMISSION_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD3.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(10) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(11) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_1.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat16_21 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat16_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb7 = 0.0<_Albedo2UV2;
#endif
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_3.xyz = texture(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _BaseColor2.xyz;
    u_xlat16_5.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat16_3.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
    u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
    u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat7.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat21 = (-_LightShadowData.x) + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat21 + _LightShadowData.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb7 = _ShadowStrength!=1.0;
#endif
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat16_1.w;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat14 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat14 = _Time.y * _Em_Speed;
    u_xlat14 = sin(u_xlat14);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat14)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD3.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat10_1.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat10_21 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat10_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_Albedo2UV2;
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_3.xyz = texture2D(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _BaseColor2.xyz;
    u_xlat10_5.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat10_3.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
    u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
    u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
    u_xlat7.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat21 = (-_LightShadowData.x) + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat21 + _LightShadowData.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlatb7 = _ShadowStrength!=1.0;
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat10_2.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat10_1.w;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat14 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat14 = _Time.y * _Em_Speed;
    u_xlat14 = sin(u_xlat14);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat14)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
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
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD1 = u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD3.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat10_1.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat10_21 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat10_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_Albedo2UV2;
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_3.xyz = texture2D(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _BaseColor2.xyz;
    u_xlat10_5.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat10_3.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
    u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
    u_xlat5.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
    u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
    u_xlat7.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat21 = (-_LightShadowData.x) + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat21 + _LightShadowData.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlatb7 = _ShadowStrength!=1.0;
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat10_2.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat10_1.w;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat14 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat14 = _Time.y * _Em_Speed;
    u_xlat14 = sin(u_xlat14);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat14)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
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
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_1.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat16_21 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat16_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb7 = 0.0<_Albedo2UV2;
#endif
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_3.xyz = texture(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _BaseColor2.xyz;
    u_xlat16_5.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat16_3.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb7 = _ShadowStrength!=1.0;
#endif
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat16_1.w;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
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
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_1.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat16_21 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat16_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb7 = 0.0<_Albedo2UV2;
#endif
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_3.xyz = texture(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _BaseColor2.xyz;
    u_xlat16_5.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat16_3.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb7 = _ShadowStrength!=1.0;
#endif
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat16_1.w;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat10_1.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat10_21 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat10_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_Albedo2UV2;
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_3.xyz = texture2D(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _BaseColor2.xyz;
    u_xlat10_5.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat10_3.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlatb7 = _ShadowStrength!=1.0;
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat10_2.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat10_1.w;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat10_1.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat10_21 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat10_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_Albedo2UV2;
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_3.xyz = texture2D(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _BaseColor2.xyz;
    u_xlat10_5.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat10_3.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlatb7 = _ShadowStrength!=1.0;
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat10_2.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat10_1.w;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
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
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(10) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_29;
vec2 u_xlat45;
mediump vec2 u_xlat16_51;
mediump vec2 u_xlat16_52;
mediump vec2 u_xlat16_53;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_58;
float u_xlat66;
mediump float u_xlat10_66;
bool u_xlatb66;
float u_xlat67;
mediump float u_xlat10_67;
bool u_xlatb67;
mediump float u_xlat16_73;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat0.xyz = vec3(u_xlat66) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb66 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat66 = (u_xlatb66) ? 1.0 : -1.0;
    u_xlat66 = u_xlat66 * vs_TEXCOORD3.w;
    u_xlat1.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat1.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
    u_xlat16_2.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat2.xyz = vec3(u_xlat66) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = u_xlat2.yyy * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.zzz * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb66 = _ShadowBias.z!=0.0;
#endif
    u_xlat67 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat2.xyz = vec3(u_xlat67) * _WorldSpaceLightPos0.xyz;
    u_xlat67 = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat67 = (-u_xlat67) * u_xlat67 + 1.0;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) * vec3(u_xlat67) + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = (bool(u_xlatb66)) ? u_xlat2.xyz : vs_TEXCOORD1.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat6;
    u_xlat4 = u_xlat2.yyyy * u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat5 * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = u_xlat6 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat66) + u_xlat2.z;
    u_xlat67 = max((-u_xlat2.w), u_xlat66);
    u_xlat67 = (-u_xlat66) + u_xlat67;
    u_xlat2.z = _ShadowBias.y * u_xlat67 + u_xlat66;
    u_xlat2.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_softShadowQuality==1.0);
#else
    u_xlatb66 = _softShadowQuality==1.0;
#endif
    if(u_xlatb66){
        u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat3.z = 0.0;
        u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
        vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_29.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb66 = !!(_softShadowQuality==2.0);
#else
        u_xlatb66 = _softShadowQuality==2.0;
#endif
        if(u_xlatb66){
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_52.xy = u_xlat16_4.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_9.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_53.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_10.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_53.xy;
            u_xlat16_8.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_3.yw;
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_4.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_53.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_3.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_4.z = u_xlat16_6.x;
            u_xlat16_4.w = u_xlat16_8.x;
            u_xlat16_5.z = u_xlat16_9.x;
            u_xlat16_5.w = u_xlat16_52.x;
            u_xlat16_3 = u_xlat16_4.zwxz + u_xlat16_5.zwxz;
            u_xlat16_6.z = u_xlat16_4.y;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_9.z = u_xlat16_5.y;
            u_xlat16_9.w = u_xlat16_52.y;
            u_xlat16_8.xyz = u_xlat16_6.zyw + u_xlat16_9.zyw;
            u_xlat16_10.xyz = u_xlat16_5.xzw / u_xlat16_3.zwy;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_9.xyz = u_xlat16_9.zyw / u_xlat16_8.xyz;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_4.xyz = u_xlat16_10.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_5.xyz = u_xlat16_9.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_4.w = u_xlat16_5.x;
            u_xlat16_6 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.ywxw;
            u_xlat16_9.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.zw;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_4.yw = u_xlat16_5.yz;
            u_xlat16_10 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_5 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.wywz;
            u_xlat16_4 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xwzw;
            u_xlat16_11 = u_xlat16_3.zwyz * u_xlat16_8.xxxy;
            u_xlat16_12 = u_xlat16_3 * u_xlat16_8.yyzz;
            u_xlat16_51.x = u_xlat16_3.y * u_xlat16_8.z;
            vec3 txVec4 = vec3(u_xlat16_6.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_6.zw,u_xlat2.w);
            u_xlat10_67 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_73 = u_xlat10_67 * u_xlat16_11.y;
            u_xlat16_73 = u_xlat16_11.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec6 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_73 = u_xlat16_11.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec7 = vec3(u_xlat16_5.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_73 = u_xlat16_11.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec8 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_73 = u_xlat16_12.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec9 = vec3(u_xlat16_10.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_73 = u_xlat16_12.y * u_xlat10_66 + u_xlat16_73;
            vec3 txVec10 = vec3(u_xlat16_5.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_73 = u_xlat16_12.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec11 = vec3(u_xlat16_4.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_73 = u_xlat16_12.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec12 = vec3(u_xlat16_4.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_29.x = u_xlat16_51.x * u_xlat10_66 + u_xlat16_73;
        } else {
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_5.yw = u_xlat16_4.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_52.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_9.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_53.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_9.xy;
            u_xlat16_53.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.zw = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_3.yw;
            u_xlat16_9 = u_xlat16_9 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_3.z = u_xlat16_9.z * 0.0816320032;
            u_xlat16_4.xy = u_xlat16_52.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_52.xy = u_xlat16_9.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_4.z = u_xlat16_9.w * 0.0816320032;
            u_xlat16_3.x = u_xlat16_4.y;
            u_xlat16_3.yw = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_52.x;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_6;
            u_xlat16_4.yw = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_52.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 / u_xlat16_3;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5 / u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_5 = u_xlat16_5.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_8.xzw = u_xlat16_6.yzw;
            u_xlat16_8.y = u_xlat16_5.x;
            u_xlat16_9 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_10.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.y = u_xlat16_8.y;
            u_xlat16_8.y = u_xlat16_5.z;
            u_xlat16_11 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_54.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.z = u_xlat16_8.y;
            u_xlat16_12 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyxz;
            u_xlat16_8.y = u_xlat16_5.w;
            u_xlat16_13 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_14.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_58.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xw;
            u_xlat16_5.xzw = u_xlat16_8.xzw;
            u_xlat16_8 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_15.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.wy;
            u_xlat16_5.x = u_xlat16_6.x;
            u_xlat16_51.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xy;
            u_xlat16_5 = u_xlat16_3 * u_xlat16_4.xxxx;
            u_xlat16_6 = u_xlat16_3 * u_xlat16_4.yyyy;
            u_xlat16_16 = u_xlat16_3 * u_xlat16_4.zzzz;
            u_xlat16_3 = u_xlat16_3 * u_xlat16_4.wwww;
            vec3 txVec13 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_67 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_9.x = u_xlat10_67 * u_xlat16_5.y;
            u_xlat16_9.x = u_xlat16_5.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec15 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_9.x = u_xlat16_5.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec16 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_9.x = u_xlat16_5.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec17 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_9.x = u_xlat16_6.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec18 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_9.x = u_xlat16_6.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec19 = vec3(u_xlat16_54.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_9.x = u_xlat16_6.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec20 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_9.x = u_xlat16_6.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec21 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_9.x = u_xlat16_16.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec22 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_9.x = u_xlat16_16.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec23 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_9.x = u_xlat16_16.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec24 = vec3(u_xlat16_58.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_9.x = u_xlat16_16.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec25 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_8.x = u_xlat16_3.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec26 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_8.x = u_xlat16_3.y * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec27 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_8.x = u_xlat16_3.z * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec28 = vec3(u_xlat16_51.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_29.x = u_xlat16_3.w * u_xlat10_66 + u_xlat16_8.x;
        }
    }
    u_xlat16_51.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_7.x = u_xlat16_29.x * u_xlat16_51.x + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb66 = _ShadowStrength!=1.0;
#endif
    u_xlat67 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = u_xlat67 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat16_7.x;
    u_xlat66 = (u_xlatb66) ? u_xlat67 : 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb67 = 0.0<_Albedo2UV2;
#endif
    u_xlat2.xy = (bool(u_xlatb67)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_17.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2.xyz = texture(_Albedo2Map, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _BaseColor2.xyz;
    u_xlat16_18.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = u_xlat16_18.xyz * _SpColor.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat19.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat4.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat19.y = dot(u_xlat4, vs_TEXCOORD1);
    u_xlat20.y = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat20.z = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat21.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat21.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat21.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat20.x = dot(u_xlat21.xyz, u_xlat1.xyz);
    u_xlat22.x = dot(u_xlat19.xxy, u_xlat19.xxy);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xy = u_xlat22.xx * u_xlat19.xy;
    u_xlat1.xy = u_xlat20.yx * u_xlat22.xy;
    u_xlat22.xy = u_xlat22.yx * u_xlat20.zy + (-u_xlat1.xy);
    u_xlat22.xy = u_xlat22.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_1.x = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat1.x = u_xlat16_1.x * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-u_xlat1.xx) + vec2(1.0, 0.5);
    u_xlat45.x = u_xlat0.x + (-_FresnelRange);
    u_xlat16_7.x = u_xlat45.x + u_xlat1.y;
    u_xlat16_7.x = u_xlat16_7.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat1.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_19.xyz = texture(_SpeCapTex, u_xlat22.xy).xyz;
    u_xlat16_29.xyz = u_xlat18.xyz * u_xlat16_19.xyz;
    u_xlat16_8.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _LightColor0.xyz;
    u_xlat17.xyz = u_xlat16_17.xyz * _BaseColor.xyz + (-u_xlat2.xyz);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat17.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = u_xlat1.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * _EnvIntensity.xyz;
    u_xlat2 = vec4(u_xlat66) + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_7.xyz = u_xlat2.yzw * u_xlat16_29.xyz;
    u_xlat2.x = u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat1.xyz * u_xlat2.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat45.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat45.xy = u_xlat45.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_2 = texture(_LG_Tex, u_xlat45.xy);
    u_xlat16_1.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Fresnel;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Intensity;
    u_xlat0.x = u_xlat16_2.w * u_xlat0.x;
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat16_2.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat22.xyz;
    u_xlat16_7.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = u_xlat0.xyz / u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
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
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(10) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_29;
vec2 u_xlat45;
mediump vec2 u_xlat16_51;
mediump vec2 u_xlat16_52;
mediump vec2 u_xlat16_53;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_58;
float u_xlat66;
mediump float u_xlat10_66;
bool u_xlatb66;
float u_xlat67;
mediump float u_xlat10_67;
bool u_xlatb67;
mediump float u_xlat16_73;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat0.xyz = vec3(u_xlat66) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb66 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat66 = (u_xlatb66) ? 1.0 : -1.0;
    u_xlat66 = u_xlat66 * vs_TEXCOORD3.w;
    u_xlat1.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat1.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
    u_xlat16_2.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat2.xyz = vec3(u_xlat66) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = u_xlat2.yyy * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.zzz * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb66 = _ShadowBias.z!=0.0;
#endif
    u_xlat67 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat2.xyz = vec3(u_xlat67) * _WorldSpaceLightPos0.xyz;
    u_xlat67 = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat67 = (-u_xlat67) * u_xlat67 + 1.0;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) * vec3(u_xlat67) + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = (bool(u_xlatb66)) ? u_xlat2.xyz : vs_TEXCOORD1.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat6;
    u_xlat4 = u_xlat2.yyyy * u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat5 * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = u_xlat6 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat66) + u_xlat2.z;
    u_xlat67 = max((-u_xlat2.w), u_xlat66);
    u_xlat67 = (-u_xlat66) + u_xlat67;
    u_xlat2.z = _ShadowBias.y * u_xlat67 + u_xlat66;
    u_xlat2.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_softShadowQuality==1.0);
#else
    u_xlatb66 = _softShadowQuality==1.0;
#endif
    if(u_xlatb66){
        u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat3.z = 0.0;
        u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
        vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_29.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb66 = !!(_softShadowQuality==2.0);
#else
        u_xlatb66 = _softShadowQuality==2.0;
#endif
        if(u_xlatb66){
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_52.xy = u_xlat16_4.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_9.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_53.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_10.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_53.xy;
            u_xlat16_8.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_3.yw;
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_4.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_53.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_3.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_4.z = u_xlat16_6.x;
            u_xlat16_4.w = u_xlat16_8.x;
            u_xlat16_5.z = u_xlat16_9.x;
            u_xlat16_5.w = u_xlat16_52.x;
            u_xlat16_3 = u_xlat16_4.zwxz + u_xlat16_5.zwxz;
            u_xlat16_6.z = u_xlat16_4.y;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_9.z = u_xlat16_5.y;
            u_xlat16_9.w = u_xlat16_52.y;
            u_xlat16_8.xyz = u_xlat16_6.zyw + u_xlat16_9.zyw;
            u_xlat16_10.xyz = u_xlat16_5.xzw / u_xlat16_3.zwy;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_9.xyz = u_xlat16_9.zyw / u_xlat16_8.xyz;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_4.xyz = u_xlat16_10.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_5.xyz = u_xlat16_9.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_4.w = u_xlat16_5.x;
            u_xlat16_6 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.ywxw;
            u_xlat16_9.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.zw;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_4.yw = u_xlat16_5.yz;
            u_xlat16_10 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_5 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.wywz;
            u_xlat16_4 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xwzw;
            u_xlat16_11 = u_xlat16_3.zwyz * u_xlat16_8.xxxy;
            u_xlat16_12 = u_xlat16_3 * u_xlat16_8.yyzz;
            u_xlat16_51.x = u_xlat16_3.y * u_xlat16_8.z;
            vec3 txVec4 = vec3(u_xlat16_6.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_6.zw,u_xlat2.w);
            u_xlat10_67 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_73 = u_xlat10_67 * u_xlat16_11.y;
            u_xlat16_73 = u_xlat16_11.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec6 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_73 = u_xlat16_11.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec7 = vec3(u_xlat16_5.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_73 = u_xlat16_11.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec8 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_73 = u_xlat16_12.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec9 = vec3(u_xlat16_10.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_73 = u_xlat16_12.y * u_xlat10_66 + u_xlat16_73;
            vec3 txVec10 = vec3(u_xlat16_5.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_73 = u_xlat16_12.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec11 = vec3(u_xlat16_4.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_73 = u_xlat16_12.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec12 = vec3(u_xlat16_4.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_29.x = u_xlat16_51.x * u_xlat10_66 + u_xlat16_73;
        } else {
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_5.yw = u_xlat16_4.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_52.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_9.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_53.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_9.xy;
            u_xlat16_53.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.zw = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_3.yw;
            u_xlat16_9 = u_xlat16_9 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_3.z = u_xlat16_9.z * 0.0816320032;
            u_xlat16_4.xy = u_xlat16_52.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_52.xy = u_xlat16_9.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_4.z = u_xlat16_9.w * 0.0816320032;
            u_xlat16_3.x = u_xlat16_4.y;
            u_xlat16_3.yw = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_52.x;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_6;
            u_xlat16_4.yw = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_52.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 / u_xlat16_3;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5 / u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_5 = u_xlat16_5.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_8.xzw = u_xlat16_6.yzw;
            u_xlat16_8.y = u_xlat16_5.x;
            u_xlat16_9 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_10.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.y = u_xlat16_8.y;
            u_xlat16_8.y = u_xlat16_5.z;
            u_xlat16_11 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_54.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.z = u_xlat16_8.y;
            u_xlat16_12 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyxz;
            u_xlat16_8.y = u_xlat16_5.w;
            u_xlat16_13 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_14.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_58.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xw;
            u_xlat16_5.xzw = u_xlat16_8.xzw;
            u_xlat16_8 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_15.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.wy;
            u_xlat16_5.x = u_xlat16_6.x;
            u_xlat16_51.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xy;
            u_xlat16_5 = u_xlat16_3 * u_xlat16_4.xxxx;
            u_xlat16_6 = u_xlat16_3 * u_xlat16_4.yyyy;
            u_xlat16_16 = u_xlat16_3 * u_xlat16_4.zzzz;
            u_xlat16_3 = u_xlat16_3 * u_xlat16_4.wwww;
            vec3 txVec13 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_67 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_9.x = u_xlat10_67 * u_xlat16_5.y;
            u_xlat16_9.x = u_xlat16_5.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec15 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_9.x = u_xlat16_5.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec16 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_9.x = u_xlat16_5.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec17 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_9.x = u_xlat16_6.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec18 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_9.x = u_xlat16_6.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec19 = vec3(u_xlat16_54.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_9.x = u_xlat16_6.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec20 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_9.x = u_xlat16_6.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec21 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_9.x = u_xlat16_16.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec22 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_9.x = u_xlat16_16.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec23 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_9.x = u_xlat16_16.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec24 = vec3(u_xlat16_58.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_9.x = u_xlat16_16.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec25 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_8.x = u_xlat16_3.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec26 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_8.x = u_xlat16_3.y * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec27 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_8.x = u_xlat16_3.z * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec28 = vec3(u_xlat16_51.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_29.x = u_xlat16_3.w * u_xlat10_66 + u_xlat16_8.x;
        }
    }
    u_xlat16_51.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_7.x = u_xlat16_29.x * u_xlat16_51.x + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb66 = _ShadowStrength!=1.0;
#endif
    u_xlat67 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = u_xlat67 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat16_7.x;
    u_xlat66 = (u_xlatb66) ? u_xlat67 : 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb67 = 0.0<_Albedo2UV2;
#endif
    u_xlat2.xy = (bool(u_xlatb67)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_17.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2.xyz = texture(_Albedo2Map, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _BaseColor2.xyz;
    u_xlat16_18.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = u_xlat16_18.xyz * _SpColor.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat19.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat4.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat19.y = dot(u_xlat4, vs_TEXCOORD1);
    u_xlat20.y = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat20.z = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat21.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat21.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat21.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat20.x = dot(u_xlat21.xyz, u_xlat1.xyz);
    u_xlat22.x = dot(u_xlat19.xxy, u_xlat19.xxy);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xy = u_xlat22.xx * u_xlat19.xy;
    u_xlat1.xy = u_xlat20.yx * u_xlat22.xy;
    u_xlat22.xy = u_xlat22.yx * u_xlat20.zy + (-u_xlat1.xy);
    u_xlat22.xy = u_xlat22.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_1.x = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat1.x = u_xlat16_1.x * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-u_xlat1.xx) + vec2(1.0, 0.5);
    u_xlat45.x = u_xlat0.x + (-_FresnelRange);
    u_xlat16_7.x = u_xlat45.x + u_xlat1.y;
    u_xlat16_7.x = u_xlat16_7.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat1.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_19.xyz = texture(_SpeCapTex, u_xlat22.xy).xyz;
    u_xlat16_29.xyz = u_xlat18.xyz * u_xlat16_19.xyz;
    u_xlat16_8.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _LightColor0.xyz;
    u_xlat17.xyz = u_xlat16_17.xyz * _BaseColor.xyz + (-u_xlat2.xyz);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat17.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = u_xlat1.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * _EnvIntensity.xyz;
    u_xlat2 = vec4(u_xlat66) + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_7.xyz = u_xlat2.yzw * u_xlat16_29.xyz;
    u_xlat2.x = u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat1.xyz * u_xlat2.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat45.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat45.xy = u_xlat45.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_2 = texture(_LG_Tex, u_xlat45.xy);
    u_xlat16_1.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Fresnel;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Intensity;
    u_xlat0.x = u_xlat16_2.w * u_xlat0.x;
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat16_2.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat22.xyz;
    u_xlat16_7.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = u_xlat0.xyz / u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
lowp vec3 u_xlat10_17;
vec3 u_xlat18;
lowp vec3 u_xlat10_18;
vec2 u_xlat19;
lowp vec3 u_xlat10_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_29;
vec2 u_xlat45;
mediump vec2 u_xlat16_51;
mediump vec2 u_xlat16_52;
mediump vec2 u_xlat16_53;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_58;
float u_xlat66;
lowp float u_xlat10_66;
bool u_xlatb66;
float u_xlat67;
lowp float u_xlat10_67;
bool u_xlatb67;
mediump float u_xlat16_73;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat0.xyz = vec3(u_xlat66) * u_xlat0.xyz;
    u_xlatb66 = unity_WorldTransformParams.w>=0.0;
    u_xlat66 = (u_xlatb66) ? 1.0 : -1.0;
    u_xlat66 = u_xlat66 * vs_TEXCOORD3.w;
    u_xlat1.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat1.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
    u_xlat10_2.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat2.xyz = vec3(u_xlat66) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = u_xlat2.yyy * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.zzz * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
    u_xlatb66 = _ShadowBias.z!=0.0;
    u_xlat67 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat2.xyz = vec3(u_xlat67) * _WorldSpaceLightPos0.xyz;
    u_xlat67 = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat67 = (-u_xlat67) * u_xlat67 + 1.0;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) * vec3(u_xlat67) + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = (bool(u_xlatb66)) ? u_xlat2.xyz : vs_TEXCOORD1.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat6;
    u_xlat4 = u_xlat2.yyyy * u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat5 * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = u_xlat6 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat2.w;
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
    u_xlat66 = (-u_xlat66) + u_xlat2.z;
    u_xlat67 = max((-u_xlat2.w), u_xlat66);
    u_xlat67 = (-u_xlat66) + u_xlat67;
    u_xlat2.z = _ShadowBias.y * u_xlat67 + u_xlat66;
    u_xlat2.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlatb66 = _softShadowQuality==1.0;
    if(u_xlatb66){
        u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat3.z = 0.0;
        u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
        vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_29.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb66 = _softShadowQuality==2.0;
        if(u_xlatb66){
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_52.xy = u_xlat16_4.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_9.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_53.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_10.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_53.xy;
            u_xlat16_8.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_3.yw;
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_4.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_53.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_3.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_4.z = u_xlat16_6.x;
            u_xlat16_4.w = u_xlat16_8.x;
            u_xlat16_5.z = u_xlat16_9.x;
            u_xlat16_5.w = u_xlat16_52.x;
            u_xlat16_3 = u_xlat16_4.zwxz + u_xlat16_5.zwxz;
            u_xlat16_6.z = u_xlat16_4.y;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_9.z = u_xlat16_5.y;
            u_xlat16_9.w = u_xlat16_52.y;
            u_xlat16_8.xyz = u_xlat16_6.zyw + u_xlat16_9.zyw;
            u_xlat16_10.xyz = u_xlat16_5.xzw / u_xlat16_3.zwy;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_9.xyz = u_xlat16_9.zyw / u_xlat16_8.xyz;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_4.xyz = u_xlat16_10.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_5.xyz = u_xlat16_9.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_4.w = u_xlat16_5.x;
            u_xlat16_6 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.ywxw;
            u_xlat16_9.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.zw;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_4.yw = u_xlat16_5.yz;
            u_xlat16_10 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_5 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.wywz;
            u_xlat16_4 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xwzw;
            u_xlat16_11 = u_xlat16_3.zwyz * u_xlat16_8.xxxy;
            u_xlat16_12 = u_xlat16_3 * u_xlat16_8.yyzz;
            u_xlat16_51.x = u_xlat16_3.y * u_xlat16_8.z;
            vec3 txVec4 = vec3(u_xlat16_6.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_6.zw,u_xlat2.w);
            u_xlat10_67 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_73 = u_xlat10_67 * u_xlat16_11.y;
            u_xlat16_73 = u_xlat16_11.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec6 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_73 = u_xlat16_11.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec7 = vec3(u_xlat16_5.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_73 = u_xlat16_11.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec8 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_73 = u_xlat16_12.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec9 = vec3(u_xlat16_10.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_73 = u_xlat16_12.y * u_xlat10_66 + u_xlat16_73;
            vec3 txVec10 = vec3(u_xlat16_5.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_73 = u_xlat16_12.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec11 = vec3(u_xlat16_4.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_73 = u_xlat16_12.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec12 = vec3(u_xlat16_4.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_29.x = u_xlat16_51.x * u_xlat10_66 + u_xlat16_73;
        } else {
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_5.yw = u_xlat16_4.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_52.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_9.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_53.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_9.xy;
            u_xlat16_53.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.zw = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_3.yw;
            u_xlat16_9 = u_xlat16_9 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_3.z = u_xlat16_9.z * 0.0816320032;
            u_xlat16_4.xy = u_xlat16_52.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_52.xy = u_xlat16_9.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_4.z = u_xlat16_9.w * 0.0816320032;
            u_xlat16_3.x = u_xlat16_4.y;
            u_xlat16_3.yw = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_52.x;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_6;
            u_xlat16_4.yw = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_52.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 / u_xlat16_3;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5 / u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_5 = u_xlat16_5.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_8.xzw = u_xlat16_6.yzw;
            u_xlat16_8.y = u_xlat16_5.x;
            u_xlat16_9 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_10.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.y = u_xlat16_8.y;
            u_xlat16_8.y = u_xlat16_5.z;
            u_xlat16_11 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_54.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.z = u_xlat16_8.y;
            u_xlat16_12 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyxz;
            u_xlat16_8.y = u_xlat16_5.w;
            u_xlat16_13 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_14.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_58.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xw;
            u_xlat16_5.xzw = u_xlat16_8.xzw;
            u_xlat16_8 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_15.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.wy;
            u_xlat16_5.x = u_xlat16_6.x;
            u_xlat16_51.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xy;
            u_xlat16_5 = u_xlat16_3 * u_xlat16_4.xxxx;
            u_xlat16_6 = u_xlat16_3 * u_xlat16_4.yyyy;
            u_xlat16_16 = u_xlat16_3 * u_xlat16_4.zzzz;
            u_xlat16_3 = u_xlat16_3 * u_xlat16_4.wwww;
            vec3 txVec13 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_67 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_9.x = u_xlat10_67 * u_xlat16_5.y;
            u_xlat16_9.x = u_xlat16_5.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec15 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_9.x = u_xlat16_5.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec16 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_9.x = u_xlat16_5.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec17 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_9.x = u_xlat16_6.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec18 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_9.x = u_xlat16_6.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec19 = vec3(u_xlat16_54.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_9.x = u_xlat16_6.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec20 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_9.x = u_xlat16_6.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec21 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_9.x = u_xlat16_16.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec22 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_9.x = u_xlat16_16.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec23 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_9.x = u_xlat16_16.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec24 = vec3(u_xlat16_58.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_9.x = u_xlat16_16.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec25 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_8.x = u_xlat16_3.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec26 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_8.x = u_xlat16_3.y * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec27 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_8.x = u_xlat16_3.z * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec28 = vec3(u_xlat16_51.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_29.x = u_xlat16_3.w * u_xlat10_66 + u_xlat16_8.x;
        }
    }
    u_xlat16_51.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_7.x = u_xlat16_29.x * u_xlat16_51.x + u_xlat16_7.x;
    u_xlatb66 = _ShadowStrength!=1.0;
    u_xlat67 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = u_xlat67 + _ShadowStrength;
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
    u_xlat67 = u_xlat67 * u_xlat16_7.x;
    u_xlat66 = (u_xlatb66) ? u_xlat67 : 1.0;
    u_xlatb67 = 0.0<_Albedo2UV2;
    u_xlat2.xy = (bool(u_xlatb67)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_17.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Albedo2Map, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _BaseColor2.xyz;
    u_xlat10_18.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = u_xlat10_18.xyz * _SpColor.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat19.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat4.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat19.y = dot(u_xlat4, vs_TEXCOORD1);
    u_xlat20.y = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat20.z = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat21.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat21.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat21.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat20.x = dot(u_xlat21.xyz, u_xlat1.xyz);
    u_xlat22.x = dot(u_xlat19.xxy, u_xlat19.xxy);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xy = u_xlat22.xx * u_xlat19.xy;
    u_xlat1.xy = u_xlat20.yx * u_xlat22.xy;
    u_xlat22.xy = u_xlat22.yx * u_xlat20.zy + (-u_xlat1.xy);
    u_xlat22.xy = u_xlat22.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_1.x = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat1.x = u_xlat10_1.x * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-u_xlat1.xx) + vec2(1.0, 0.5);
    u_xlat45.x = u_xlat0.x + (-_FresnelRange);
    u_xlat16_7.x = u_xlat45.x + u_xlat1.y;
    u_xlat16_7.x = u_xlat16_7.x * _FresnelPow;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat1.x + 1.0;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_19.xyz = texture2D(_SpeCapTex, u_xlat22.xy).xyz;
    u_xlat16_29.xyz = u_xlat18.xyz * u_xlat10_19.xyz;
    u_xlat16_8.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _LightColor0.xyz;
    u_xlat17.xyz = u_xlat10_17.xyz * _BaseColor.xyz + (-u_xlat2.xyz);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat17.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = u_xlat1.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * _EnvIntensity.xyz;
    u_xlat2 = vec4(u_xlat66) + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_7.xyz = u_xlat2.yzw * u_xlat16_29.xyz;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat22.xyz = u_xlat1.xyz * u_xlat2.xxx + u_xlat16_7.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat45.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat45.xy = u_xlat45.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_2 = texture2D(_LG_Tex, u_xlat45.xy);
    u_xlat10_1.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Fresnel;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Intensity;
    u_xlat0.x = u_xlat10_2.w * u_xlat0.x;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat10_2.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat22.xyz;
    u_xlat16_7.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = u_xlat0.xyz / u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
lowp vec3 u_xlat10_17;
vec3 u_xlat18;
lowp vec3 u_xlat10_18;
vec2 u_xlat19;
lowp vec3 u_xlat10_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_29;
vec2 u_xlat45;
mediump vec2 u_xlat16_51;
mediump vec2 u_xlat16_52;
mediump vec2 u_xlat16_53;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_58;
float u_xlat66;
lowp float u_xlat10_66;
bool u_xlatb66;
float u_xlat67;
lowp float u_xlat10_67;
bool u_xlatb67;
mediump float u_xlat16_73;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat0.xyz = vec3(u_xlat66) * u_xlat0.xyz;
    u_xlatb66 = unity_WorldTransformParams.w>=0.0;
    u_xlat66 = (u_xlatb66) ? 1.0 : -1.0;
    u_xlat66 = u_xlat66 * vs_TEXCOORD3.w;
    u_xlat1.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat1.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
    u_xlat10_2.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat2.xyz = vec3(u_xlat66) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = u_xlat2.yyy * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.zzz * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
    u_xlatb66 = _ShadowBias.z!=0.0;
    u_xlat67 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat2.xyz = vec3(u_xlat67) * _WorldSpaceLightPos0.xyz;
    u_xlat67 = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat67 = (-u_xlat67) * u_xlat67 + 1.0;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) * vec3(u_xlat67) + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = (bool(u_xlatb66)) ? u_xlat2.xyz : vs_TEXCOORD1.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat6;
    u_xlat4 = u_xlat2.yyyy * u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat5 * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = u_xlat6 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat2.w;
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
    u_xlat66 = (-u_xlat66) + u_xlat2.z;
    u_xlat67 = max((-u_xlat2.w), u_xlat66);
    u_xlat67 = (-u_xlat66) + u_xlat67;
    u_xlat2.z = _ShadowBias.y * u_xlat67 + u_xlat66;
    u_xlat2.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlatb66 = _softShadowQuality==1.0;
    if(u_xlatb66){
        u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat3.z = 0.0;
        u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
        vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_29.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb66 = _softShadowQuality==2.0;
        if(u_xlatb66){
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_52.xy = u_xlat16_4.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_9.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_53.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_10.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_53.xy;
            u_xlat16_8.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_3.yw;
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_4.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_53.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_3.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_4.z = u_xlat16_6.x;
            u_xlat16_4.w = u_xlat16_8.x;
            u_xlat16_5.z = u_xlat16_9.x;
            u_xlat16_5.w = u_xlat16_52.x;
            u_xlat16_3 = u_xlat16_4.zwxz + u_xlat16_5.zwxz;
            u_xlat16_6.z = u_xlat16_4.y;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_9.z = u_xlat16_5.y;
            u_xlat16_9.w = u_xlat16_52.y;
            u_xlat16_8.xyz = u_xlat16_6.zyw + u_xlat16_9.zyw;
            u_xlat16_10.xyz = u_xlat16_5.xzw / u_xlat16_3.zwy;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_9.xyz = u_xlat16_9.zyw / u_xlat16_8.xyz;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_4.xyz = u_xlat16_10.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_5.xyz = u_xlat16_9.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_4.w = u_xlat16_5.x;
            u_xlat16_6 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.ywxw;
            u_xlat16_9.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.zw;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_4.yw = u_xlat16_5.yz;
            u_xlat16_10 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_5 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.wywz;
            u_xlat16_4 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xwzw;
            u_xlat16_11 = u_xlat16_3.zwyz * u_xlat16_8.xxxy;
            u_xlat16_12 = u_xlat16_3 * u_xlat16_8.yyzz;
            u_xlat16_51.x = u_xlat16_3.y * u_xlat16_8.z;
            vec3 txVec4 = vec3(u_xlat16_6.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_6.zw,u_xlat2.w);
            u_xlat10_67 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_73 = u_xlat10_67 * u_xlat16_11.y;
            u_xlat16_73 = u_xlat16_11.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec6 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_73 = u_xlat16_11.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec7 = vec3(u_xlat16_5.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_73 = u_xlat16_11.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec8 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_73 = u_xlat16_12.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec9 = vec3(u_xlat16_10.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_73 = u_xlat16_12.y * u_xlat10_66 + u_xlat16_73;
            vec3 txVec10 = vec3(u_xlat16_5.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_73 = u_xlat16_12.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec11 = vec3(u_xlat16_4.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_73 = u_xlat16_12.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec12 = vec3(u_xlat16_4.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_29.x = u_xlat16_51.x * u_xlat10_66 + u_xlat16_73;
        } else {
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_5.yw = u_xlat16_4.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_52.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_9.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_53.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_9.xy;
            u_xlat16_53.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.zw = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_3.yw;
            u_xlat16_9 = u_xlat16_9 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_3.z = u_xlat16_9.z * 0.0816320032;
            u_xlat16_4.xy = u_xlat16_52.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_52.xy = u_xlat16_9.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_4.z = u_xlat16_9.w * 0.0816320032;
            u_xlat16_3.x = u_xlat16_4.y;
            u_xlat16_3.yw = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_52.x;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_6;
            u_xlat16_4.yw = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_52.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 / u_xlat16_3;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5 / u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_5 = u_xlat16_5.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_8.xzw = u_xlat16_6.yzw;
            u_xlat16_8.y = u_xlat16_5.x;
            u_xlat16_9 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_10.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.y = u_xlat16_8.y;
            u_xlat16_8.y = u_xlat16_5.z;
            u_xlat16_11 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_54.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.z = u_xlat16_8.y;
            u_xlat16_12 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyxz;
            u_xlat16_8.y = u_xlat16_5.w;
            u_xlat16_13 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_14.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_58.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xw;
            u_xlat16_5.xzw = u_xlat16_8.xzw;
            u_xlat16_8 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_15.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.wy;
            u_xlat16_5.x = u_xlat16_6.x;
            u_xlat16_51.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xy;
            u_xlat16_5 = u_xlat16_3 * u_xlat16_4.xxxx;
            u_xlat16_6 = u_xlat16_3 * u_xlat16_4.yyyy;
            u_xlat16_16 = u_xlat16_3 * u_xlat16_4.zzzz;
            u_xlat16_3 = u_xlat16_3 * u_xlat16_4.wwww;
            vec3 txVec13 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_67 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_9.x = u_xlat10_67 * u_xlat16_5.y;
            u_xlat16_9.x = u_xlat16_5.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec15 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_9.x = u_xlat16_5.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec16 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_9.x = u_xlat16_5.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec17 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_9.x = u_xlat16_6.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec18 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_9.x = u_xlat16_6.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec19 = vec3(u_xlat16_54.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_9.x = u_xlat16_6.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec20 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_9.x = u_xlat16_6.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec21 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_9.x = u_xlat16_16.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec22 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_9.x = u_xlat16_16.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec23 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_9.x = u_xlat16_16.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec24 = vec3(u_xlat16_58.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_9.x = u_xlat16_16.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec25 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_8.x = u_xlat16_3.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec26 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_8.x = u_xlat16_3.y * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec27 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_8.x = u_xlat16_3.z * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec28 = vec3(u_xlat16_51.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_29.x = u_xlat16_3.w * u_xlat10_66 + u_xlat16_8.x;
        }
    }
    u_xlat16_51.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_7.x = u_xlat16_29.x * u_xlat16_51.x + u_xlat16_7.x;
    u_xlatb66 = _ShadowStrength!=1.0;
    u_xlat67 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = u_xlat67 + _ShadowStrength;
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
    u_xlat67 = u_xlat67 * u_xlat16_7.x;
    u_xlat66 = (u_xlatb66) ? u_xlat67 : 1.0;
    u_xlatb67 = 0.0<_Albedo2UV2;
    u_xlat2.xy = (bool(u_xlatb67)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_17.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Albedo2Map, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _BaseColor2.xyz;
    u_xlat10_18.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = u_xlat10_18.xyz * _SpColor.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat19.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat4.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat19.y = dot(u_xlat4, vs_TEXCOORD1);
    u_xlat20.y = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat20.z = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat21.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat21.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat21.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat20.x = dot(u_xlat21.xyz, u_xlat1.xyz);
    u_xlat22.x = dot(u_xlat19.xxy, u_xlat19.xxy);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xy = u_xlat22.xx * u_xlat19.xy;
    u_xlat1.xy = u_xlat20.yx * u_xlat22.xy;
    u_xlat22.xy = u_xlat22.yx * u_xlat20.zy + (-u_xlat1.xy);
    u_xlat22.xy = u_xlat22.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_1.x = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat1.x = u_xlat10_1.x * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-u_xlat1.xx) + vec2(1.0, 0.5);
    u_xlat45.x = u_xlat0.x + (-_FresnelRange);
    u_xlat16_7.x = u_xlat45.x + u_xlat1.y;
    u_xlat16_7.x = u_xlat16_7.x * _FresnelPow;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat1.x + 1.0;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_19.xyz = texture2D(_SpeCapTex, u_xlat22.xy).xyz;
    u_xlat16_29.xyz = u_xlat18.xyz * u_xlat10_19.xyz;
    u_xlat16_8.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _LightColor0.xyz;
    u_xlat17.xyz = u_xlat10_17.xyz * _BaseColor.xyz + (-u_xlat2.xyz);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat17.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = u_xlat1.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * _EnvIntensity.xyz;
    u_xlat2 = vec4(u_xlat66) + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_7.xyz = u_xlat2.yzw * u_xlat16_29.xyz;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat22.xyz = u_xlat1.xyz * u_xlat2.xxx + u_xlat16_7.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat45.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat45.xy = u_xlat45.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_2 = texture2D(_LG_Tex, u_xlat45.xy);
    u_xlat10_1.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Fresnel;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Intensity;
    u_xlat0.x = u_xlat10_2.w * u_xlat0.x;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat10_2.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat22.xyz;
    u_xlat16_7.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = u_xlat0.xyz / u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_EMISSION_ON" }
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
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_1.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat16_21 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat16_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb7 = 0.0<_Albedo2UV2;
#endif
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_3.xyz = texture(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _BaseColor2.xyz;
    u_xlat16_5.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat16_3.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb7 = _ShadowStrength!=1.0;
#endif
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat16_1.w;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat14 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat14 = _Time.y * _Em_Speed;
    u_xlat14 = sin(u_xlat14);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat14)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_EMISSION_ON" }
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
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_1.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat16_21 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat16_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb7 = 0.0<_Albedo2UV2;
#endif
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_3.xyz = texture(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _BaseColor2.xyz;
    u_xlat16_5.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat16_3.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb7 = _ShadowStrength!=1.0;
#endif
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat16_1.w;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat14 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14);
    u_xlat14 = _Time.y * _Em_Speed;
    u_xlat14 = sin(u_xlat14);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat14)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat10_1.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat10_21 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat10_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_Albedo2UV2;
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_3.xyz = texture2D(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _BaseColor2.xyz;
    u_xlat10_5.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat10_3.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlatb7 = _ShadowStrength!=1.0;
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat10_2.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat10_1.w;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat14 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat14 = _Time.y * _Em_Speed;
    u_xlat14 = sin(u_xlat14);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat14)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat14;
vec2 u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat7.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat7.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat10_1.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat2.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat2.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat21 = dot(u_xlat2.xxy, u_xlat2.xxy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat1.xw = u_xlat1.yx * u_xlat2.xy;
    u_xlat1.xy = u_xlat2.yx * u_xlat1.zy + (-u_xlat1.xw);
    u_xlat1.xy = u_xlat1.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_RfCapTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_SpeCapTex, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _RfColor.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = u_xlat0.x + _ShadowStrength;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat21 + (-_FresnelRange);
    u_xlat14 = log2(u_xlat21);
    u_xlat14 = u_xlat14 * _LG_Fresnel;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _LG_Intensity;
    u_xlat10_21 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat21 = u_xlat10_21 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat3.xy = (-vec2(u_xlat21)) + vec2(1.0, 0.5);
    u_xlat16_4.x = u_xlat7.x + u_xlat3.y;
    u_xlat7.x = u_xlat3.x * vs_TEXCOORD0.w;
    u_xlat16_4.x = u_xlat16_4.x * _FresnelPow;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_4.x) * u_xlat7.x + 1.0;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlatb7 = 0.0<_Albedo2UV2;
    u_xlat7.xz = (bool(u_xlatb7)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat7.xz = u_xlat7.xz * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_3.xyz = texture2D(_Albedo2Map, u_xlat7.xz).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _BaseColor2.xyz;
    u_xlat10_5.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * _BaseColor.xyz + (-u_xlat3.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * _EnvIntensity.xyz;
    u_xlat10_3.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _SpColor.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightColor0.xyz;
    u_xlatb7 = _ShadowStrength!=1.0;
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : 1.0;
    u_xlat1 = u_xlat0.xxxx + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_4.xyz = u_xlat1.yzw * u_xlat16_4.xyz;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xyw = u_xlat2.xyz * u_xlat1.xxx + u_xlat16_4.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat15.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat10_2.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat15.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat1.xy);
    u_xlat14 = u_xlat14 * u_xlat10_1.w;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat14 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat14);
    u_xlat14 = _Time.y * _Em_Speed;
    u_xlat14 = sin(u_xlat14);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat14)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_EMISSION_ON" }
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
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(10) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(11) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_29;
vec2 u_xlat45;
mediump vec2 u_xlat16_51;
mediump vec2 u_xlat16_52;
mediump vec2 u_xlat16_53;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_58;
float u_xlat66;
mediump float u_xlat10_66;
bool u_xlatb66;
float u_xlat67;
mediump float u_xlat10_67;
bool u_xlatb67;
mediump float u_xlat16_73;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat0.xyz = vec3(u_xlat66) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb66 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat66 = (u_xlatb66) ? 1.0 : -1.0;
    u_xlat66 = u_xlat66 * vs_TEXCOORD3.w;
    u_xlat1.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat1.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
    u_xlat16_2.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat2.xyz = vec3(u_xlat66) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = u_xlat2.yyy * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.zzz * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb66 = _ShadowBias.z!=0.0;
#endif
    u_xlat67 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat2.xyz = vec3(u_xlat67) * _WorldSpaceLightPos0.xyz;
    u_xlat67 = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat67 = (-u_xlat67) * u_xlat67 + 1.0;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) * vec3(u_xlat67) + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = (bool(u_xlatb66)) ? u_xlat2.xyz : vs_TEXCOORD1.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat6;
    u_xlat4 = u_xlat2.yyyy * u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat5 * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = u_xlat6 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat66) + u_xlat2.z;
    u_xlat67 = max((-u_xlat2.w), u_xlat66);
    u_xlat67 = (-u_xlat66) + u_xlat67;
    u_xlat2.z = _ShadowBias.y * u_xlat67 + u_xlat66;
    u_xlat2.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_softShadowQuality==1.0);
#else
    u_xlatb66 = _softShadowQuality==1.0;
#endif
    if(u_xlatb66){
        u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat3.z = 0.0;
        u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
        vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_29.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb66 = !!(_softShadowQuality==2.0);
#else
        u_xlatb66 = _softShadowQuality==2.0;
#endif
        if(u_xlatb66){
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_52.xy = u_xlat16_4.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_9.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_53.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_10.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_53.xy;
            u_xlat16_8.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_3.yw;
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_4.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_53.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_3.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_4.z = u_xlat16_6.x;
            u_xlat16_4.w = u_xlat16_8.x;
            u_xlat16_5.z = u_xlat16_9.x;
            u_xlat16_5.w = u_xlat16_52.x;
            u_xlat16_3 = u_xlat16_4.zwxz + u_xlat16_5.zwxz;
            u_xlat16_6.z = u_xlat16_4.y;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_9.z = u_xlat16_5.y;
            u_xlat16_9.w = u_xlat16_52.y;
            u_xlat16_8.xyz = u_xlat16_6.zyw + u_xlat16_9.zyw;
            u_xlat16_10.xyz = u_xlat16_5.xzw / u_xlat16_3.zwy;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_9.xyz = u_xlat16_9.zyw / u_xlat16_8.xyz;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_4.xyz = u_xlat16_10.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_5.xyz = u_xlat16_9.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_4.w = u_xlat16_5.x;
            u_xlat16_6 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.ywxw;
            u_xlat16_9.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.zw;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_4.yw = u_xlat16_5.yz;
            u_xlat16_10 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_5 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.wywz;
            u_xlat16_4 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xwzw;
            u_xlat16_11 = u_xlat16_3.zwyz * u_xlat16_8.xxxy;
            u_xlat16_12 = u_xlat16_3 * u_xlat16_8.yyzz;
            u_xlat16_51.x = u_xlat16_3.y * u_xlat16_8.z;
            vec3 txVec4 = vec3(u_xlat16_6.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_6.zw,u_xlat2.w);
            u_xlat10_67 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_73 = u_xlat10_67 * u_xlat16_11.y;
            u_xlat16_73 = u_xlat16_11.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec6 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_73 = u_xlat16_11.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec7 = vec3(u_xlat16_5.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_73 = u_xlat16_11.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec8 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_73 = u_xlat16_12.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec9 = vec3(u_xlat16_10.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_73 = u_xlat16_12.y * u_xlat10_66 + u_xlat16_73;
            vec3 txVec10 = vec3(u_xlat16_5.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_73 = u_xlat16_12.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec11 = vec3(u_xlat16_4.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_73 = u_xlat16_12.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec12 = vec3(u_xlat16_4.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_29.x = u_xlat16_51.x * u_xlat10_66 + u_xlat16_73;
        } else {
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_5.yw = u_xlat16_4.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_52.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_9.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_53.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_9.xy;
            u_xlat16_53.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.zw = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_3.yw;
            u_xlat16_9 = u_xlat16_9 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_3.z = u_xlat16_9.z * 0.0816320032;
            u_xlat16_4.xy = u_xlat16_52.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_52.xy = u_xlat16_9.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_4.z = u_xlat16_9.w * 0.0816320032;
            u_xlat16_3.x = u_xlat16_4.y;
            u_xlat16_3.yw = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_52.x;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_6;
            u_xlat16_4.yw = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_52.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 / u_xlat16_3;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5 / u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_5 = u_xlat16_5.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_8.xzw = u_xlat16_6.yzw;
            u_xlat16_8.y = u_xlat16_5.x;
            u_xlat16_9 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_10.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.y = u_xlat16_8.y;
            u_xlat16_8.y = u_xlat16_5.z;
            u_xlat16_11 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_54.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.z = u_xlat16_8.y;
            u_xlat16_12 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyxz;
            u_xlat16_8.y = u_xlat16_5.w;
            u_xlat16_13 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_14.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_58.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xw;
            u_xlat16_5.xzw = u_xlat16_8.xzw;
            u_xlat16_8 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_15.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.wy;
            u_xlat16_5.x = u_xlat16_6.x;
            u_xlat16_51.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xy;
            u_xlat16_5 = u_xlat16_3 * u_xlat16_4.xxxx;
            u_xlat16_6 = u_xlat16_3 * u_xlat16_4.yyyy;
            u_xlat16_16 = u_xlat16_3 * u_xlat16_4.zzzz;
            u_xlat16_3 = u_xlat16_3 * u_xlat16_4.wwww;
            vec3 txVec13 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_67 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_9.x = u_xlat10_67 * u_xlat16_5.y;
            u_xlat16_9.x = u_xlat16_5.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec15 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_9.x = u_xlat16_5.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec16 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_9.x = u_xlat16_5.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec17 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_9.x = u_xlat16_6.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec18 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_9.x = u_xlat16_6.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec19 = vec3(u_xlat16_54.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_9.x = u_xlat16_6.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec20 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_9.x = u_xlat16_6.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec21 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_9.x = u_xlat16_16.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec22 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_9.x = u_xlat16_16.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec23 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_9.x = u_xlat16_16.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec24 = vec3(u_xlat16_58.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_9.x = u_xlat16_16.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec25 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_8.x = u_xlat16_3.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec26 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_8.x = u_xlat16_3.y * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec27 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_8.x = u_xlat16_3.z * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec28 = vec3(u_xlat16_51.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_29.x = u_xlat16_3.w * u_xlat10_66 + u_xlat16_8.x;
        }
    }
    u_xlat16_51.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_7.x = u_xlat16_29.x * u_xlat16_51.x + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb66 = _ShadowStrength!=1.0;
#endif
    u_xlat67 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = u_xlat67 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat16_7.x;
    u_xlat66 = (u_xlatb66) ? u_xlat67 : 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb67 = 0.0<_Albedo2UV2;
#endif
    u_xlat2.xy = (bool(u_xlatb67)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_17.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2.xyz = texture(_Albedo2Map, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _BaseColor2.xyz;
    u_xlat16_18.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = u_xlat16_18.xyz * _SpColor.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat19.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat4.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat19.y = dot(u_xlat4, vs_TEXCOORD1);
    u_xlat20.y = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat20.z = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat21.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat21.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat21.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat20.x = dot(u_xlat21.xyz, u_xlat1.xyz);
    u_xlat22.x = dot(u_xlat19.xxy, u_xlat19.xxy);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xy = u_xlat22.xx * u_xlat19.xy;
    u_xlat1.xy = u_xlat20.yx * u_xlat22.xy;
    u_xlat22.xy = u_xlat22.yx * u_xlat20.zy + (-u_xlat1.xy);
    u_xlat22.xy = u_xlat22.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_1.x = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat1.x = u_xlat16_1.x * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-u_xlat1.xx) + vec2(1.0, 0.5);
    u_xlat45.x = u_xlat0.x + (-_FresnelRange);
    u_xlat16_7.x = u_xlat45.x + u_xlat1.y;
    u_xlat16_7.x = u_xlat16_7.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat1.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_19.xyz = texture(_SpeCapTex, u_xlat22.xy).xyz;
    u_xlat16_29.xyz = u_xlat18.xyz * u_xlat16_19.xyz;
    u_xlat16_8.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _LightColor0.xyz;
    u_xlat17.xyz = u_xlat16_17.xyz * _BaseColor.xyz + (-u_xlat2.xyz);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat17.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = u_xlat1.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * _EnvIntensity.xyz;
    u_xlat2 = vec4(u_xlat66) + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_7.xyz = u_xlat2.yzw * u_xlat16_29.xyz;
    u_xlat2.x = u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat1.xyz * u_xlat2.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat45.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat45.xy = u_xlat45.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_2 = texture(_LG_Tex, u_xlat45.xy);
    u_xlat16_1.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Fresnel;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Intensity;
    u_xlat0.x = u_xlat16_2.w * u_xlat0.x;
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat16_2.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat0.x = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat0.xxx;
    u_xlat0.x = _Time.y * _Em_Speed;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(u_xlat0.xxx) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat22.xyz + u_xlat1.xyz;
    u_xlat16_7.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = u_xlat0.xyz / u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_EMISSION_ON" }
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
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _SpeCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(10) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(11) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_29;
vec2 u_xlat45;
mediump vec2 u_xlat16_51;
mediump vec2 u_xlat16_52;
mediump vec2 u_xlat16_53;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_58;
float u_xlat66;
mediump float u_xlat10_66;
bool u_xlatb66;
float u_xlat67;
mediump float u_xlat10_67;
bool u_xlatb67;
mediump float u_xlat16_73;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat0.xyz = vec3(u_xlat66) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb66 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat66 = (u_xlatb66) ? 1.0 : -1.0;
    u_xlat66 = u_xlat66 * vs_TEXCOORD3.w;
    u_xlat1.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat1.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
    u_xlat16_2.xyz = texture(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat2.xyz = vec3(u_xlat66) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = u_xlat2.yyy * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.zzz * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb66 = _ShadowBias.z!=0.0;
#endif
    u_xlat67 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat2.xyz = vec3(u_xlat67) * _WorldSpaceLightPos0.xyz;
    u_xlat67 = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat67 = (-u_xlat67) * u_xlat67 + 1.0;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) * vec3(u_xlat67) + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = (bool(u_xlatb66)) ? u_xlat2.xyz : vs_TEXCOORD1.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat6;
    u_xlat4 = u_xlat2.yyyy * u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat5 * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = u_xlat6 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat66) + u_xlat2.z;
    u_xlat67 = max((-u_xlat2.w), u_xlat66);
    u_xlat67 = (-u_xlat66) + u_xlat67;
    u_xlat2.z = _ShadowBias.y * u_xlat67 + u_xlat66;
    u_xlat2.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_softShadowQuality==1.0);
#else
    u_xlatb66 = _softShadowQuality==1.0;
#endif
    if(u_xlatb66){
        u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat3.z = 0.0;
        u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
        vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_29.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb66 = !!(_softShadowQuality==2.0);
#else
        u_xlatb66 = _softShadowQuality==2.0;
#endif
        if(u_xlatb66){
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_52.xy = u_xlat16_4.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_9.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_53.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_10.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_53.xy;
            u_xlat16_8.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_3.yw;
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_4.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_53.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_3.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_4.z = u_xlat16_6.x;
            u_xlat16_4.w = u_xlat16_8.x;
            u_xlat16_5.z = u_xlat16_9.x;
            u_xlat16_5.w = u_xlat16_52.x;
            u_xlat16_3 = u_xlat16_4.zwxz + u_xlat16_5.zwxz;
            u_xlat16_6.z = u_xlat16_4.y;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_9.z = u_xlat16_5.y;
            u_xlat16_9.w = u_xlat16_52.y;
            u_xlat16_8.xyz = u_xlat16_6.zyw + u_xlat16_9.zyw;
            u_xlat16_10.xyz = u_xlat16_5.xzw / u_xlat16_3.zwy;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_9.xyz = u_xlat16_9.zyw / u_xlat16_8.xyz;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_4.xyz = u_xlat16_10.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_5.xyz = u_xlat16_9.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_4.w = u_xlat16_5.x;
            u_xlat16_6 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.ywxw;
            u_xlat16_9.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.zw;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_4.yw = u_xlat16_5.yz;
            u_xlat16_10 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_5 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.wywz;
            u_xlat16_4 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xwzw;
            u_xlat16_11 = u_xlat16_3.zwyz * u_xlat16_8.xxxy;
            u_xlat16_12 = u_xlat16_3 * u_xlat16_8.yyzz;
            u_xlat16_51.x = u_xlat16_3.y * u_xlat16_8.z;
            vec3 txVec4 = vec3(u_xlat16_6.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_6.zw,u_xlat2.w);
            u_xlat10_67 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_73 = u_xlat10_67 * u_xlat16_11.y;
            u_xlat16_73 = u_xlat16_11.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec6 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_73 = u_xlat16_11.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec7 = vec3(u_xlat16_5.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_73 = u_xlat16_11.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec8 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_73 = u_xlat16_12.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec9 = vec3(u_xlat16_10.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_73 = u_xlat16_12.y * u_xlat10_66 + u_xlat16_73;
            vec3 txVec10 = vec3(u_xlat16_5.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_73 = u_xlat16_12.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec11 = vec3(u_xlat16_4.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_73 = u_xlat16_12.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec12 = vec3(u_xlat16_4.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_29.x = u_xlat16_51.x * u_xlat10_66 + u_xlat16_73;
        } else {
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_5.yw = u_xlat16_4.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_52.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_9.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_53.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_9.xy;
            u_xlat16_53.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.zw = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_3.yw;
            u_xlat16_9 = u_xlat16_9 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_3.z = u_xlat16_9.z * 0.0816320032;
            u_xlat16_4.xy = u_xlat16_52.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_52.xy = u_xlat16_9.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_4.z = u_xlat16_9.w * 0.0816320032;
            u_xlat16_3.x = u_xlat16_4.y;
            u_xlat16_3.yw = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_52.x;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_6;
            u_xlat16_4.yw = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_52.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 / u_xlat16_3;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5 / u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_5 = u_xlat16_5.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_8.xzw = u_xlat16_6.yzw;
            u_xlat16_8.y = u_xlat16_5.x;
            u_xlat16_9 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_10.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.y = u_xlat16_8.y;
            u_xlat16_8.y = u_xlat16_5.z;
            u_xlat16_11 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_54.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.z = u_xlat16_8.y;
            u_xlat16_12 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyxz;
            u_xlat16_8.y = u_xlat16_5.w;
            u_xlat16_13 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_14.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_58.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xw;
            u_xlat16_5.xzw = u_xlat16_8.xzw;
            u_xlat16_8 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_15.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.wy;
            u_xlat16_5.x = u_xlat16_6.x;
            u_xlat16_51.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xy;
            u_xlat16_5 = u_xlat16_3 * u_xlat16_4.xxxx;
            u_xlat16_6 = u_xlat16_3 * u_xlat16_4.yyyy;
            u_xlat16_16 = u_xlat16_3 * u_xlat16_4.zzzz;
            u_xlat16_3 = u_xlat16_3 * u_xlat16_4.wwww;
            vec3 txVec13 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_67 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_9.x = u_xlat10_67 * u_xlat16_5.y;
            u_xlat16_9.x = u_xlat16_5.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec15 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_9.x = u_xlat16_5.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec16 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_9.x = u_xlat16_5.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec17 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_9.x = u_xlat16_6.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec18 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_9.x = u_xlat16_6.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec19 = vec3(u_xlat16_54.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_9.x = u_xlat16_6.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec20 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_9.x = u_xlat16_6.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec21 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_9.x = u_xlat16_16.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec22 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_9.x = u_xlat16_16.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec23 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_9.x = u_xlat16_16.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec24 = vec3(u_xlat16_58.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_9.x = u_xlat16_16.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec25 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_8.x = u_xlat16_3.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec26 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_8.x = u_xlat16_3.y * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec27 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_8.x = u_xlat16_3.z * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec28 = vec3(u_xlat16_51.xy,u_xlat2.w);
            u_xlat10_66 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_29.x = u_xlat16_3.w * u_xlat10_66 + u_xlat16_8.x;
        }
    }
    u_xlat16_51.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_7.x = u_xlat16_29.x * u_xlat16_51.x + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb66 = _ShadowStrength!=1.0;
#endif
    u_xlat67 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = u_xlat67 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat16_7.x;
    u_xlat66 = (u_xlatb66) ? u_xlat67 : 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0<_Albedo2UV2);
#else
    u_xlatb67 = 0.0<_Albedo2UV2;
#endif
    u_xlat2.xy = (bool(u_xlatb67)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat16_17.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2.xyz = texture(_Albedo2Map, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _BaseColor2.xyz;
    u_xlat16_18.xyz = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = u_xlat16_18.xyz * _SpColor.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat19.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat4.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat19.y = dot(u_xlat4, vs_TEXCOORD1);
    u_xlat20.y = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat20.z = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat21.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat21.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat21.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat20.x = dot(u_xlat21.xyz, u_xlat1.xyz);
    u_xlat22.x = dot(u_xlat19.xxy, u_xlat19.xxy);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xy = u_xlat22.xx * u_xlat19.xy;
    u_xlat1.xy = u_xlat20.yx * u_xlat22.xy;
    u_xlat22.xy = u_xlat22.yx * u_xlat20.zy + (-u_xlat1.xy);
    u_xlat22.xy = u_xlat22.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_1.x = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat1.x = u_xlat16_1.x * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-u_xlat1.xx) + vec2(1.0, 0.5);
    u_xlat45.x = u_xlat0.x + (-_FresnelRange);
    u_xlat16_7.x = u_xlat45.x + u_xlat1.y;
    u_xlat16_7.x = u_xlat16_7.x * _FresnelPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat1.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_19.xyz = texture(_SpeCapTex, u_xlat22.xy).xyz;
    u_xlat16_29.xyz = u_xlat18.xyz * u_xlat16_19.xyz;
    u_xlat16_8.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _LightColor0.xyz;
    u_xlat17.xyz = u_xlat16_17.xyz * _BaseColor.xyz + (-u_xlat2.xyz);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat17.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = u_xlat1.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * _EnvIntensity.xyz;
    u_xlat2 = vec4(u_xlat66) + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_7.xyz = u_xlat2.yzw * u_xlat16_29.xyz;
    u_xlat2.x = u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat1.xyz * u_xlat2.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat45.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat45.xy = u_xlat45.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_2 = texture(_LG_Tex, u_xlat45.xy);
    u_xlat16_1.xyz = texture(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Fresnel;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Intensity;
    u_xlat0.x = u_xlat16_2.w * u_xlat0.x;
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat16_2.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat0.x = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat0.xxx;
    u_xlat0.x = _Time.y * _Em_Speed;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(u_xlat0.xxx) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat22.xyz + u_xlat1.xyz;
    u_xlat16_7.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = u_xlat0.xyz / u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
lowp vec3 u_xlat10_17;
vec3 u_xlat18;
lowp vec3 u_xlat10_18;
vec2 u_xlat19;
lowp vec3 u_xlat10_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_29;
vec2 u_xlat45;
mediump vec2 u_xlat16_51;
mediump vec2 u_xlat16_52;
mediump vec2 u_xlat16_53;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_58;
float u_xlat66;
lowp float u_xlat10_66;
bool u_xlatb66;
float u_xlat67;
lowp float u_xlat10_67;
bool u_xlatb67;
mediump float u_xlat16_73;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat0.xyz = vec3(u_xlat66) * u_xlat0.xyz;
    u_xlatb66 = unity_WorldTransformParams.w>=0.0;
    u_xlat66 = (u_xlatb66) ? 1.0 : -1.0;
    u_xlat66 = u_xlat66 * vs_TEXCOORD3.w;
    u_xlat1.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat1.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
    u_xlat10_2.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat2.xyz = vec3(u_xlat66) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = u_xlat2.yyy * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.zzz * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
    u_xlatb66 = _ShadowBias.z!=0.0;
    u_xlat67 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat2.xyz = vec3(u_xlat67) * _WorldSpaceLightPos0.xyz;
    u_xlat67 = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat67 = (-u_xlat67) * u_xlat67 + 1.0;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) * vec3(u_xlat67) + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = (bool(u_xlatb66)) ? u_xlat2.xyz : vs_TEXCOORD1.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat6;
    u_xlat4 = u_xlat2.yyyy * u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat5 * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = u_xlat6 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat2.w;
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
    u_xlat66 = (-u_xlat66) + u_xlat2.z;
    u_xlat67 = max((-u_xlat2.w), u_xlat66);
    u_xlat67 = (-u_xlat66) + u_xlat67;
    u_xlat2.z = _ShadowBias.y * u_xlat67 + u_xlat66;
    u_xlat2.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlatb66 = _softShadowQuality==1.0;
    if(u_xlatb66){
        u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat3.z = 0.0;
        u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
        vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_29.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb66 = _softShadowQuality==2.0;
        if(u_xlatb66){
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_52.xy = u_xlat16_4.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_9.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_53.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_10.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_53.xy;
            u_xlat16_8.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_3.yw;
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_4.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_53.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_3.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_4.z = u_xlat16_6.x;
            u_xlat16_4.w = u_xlat16_8.x;
            u_xlat16_5.z = u_xlat16_9.x;
            u_xlat16_5.w = u_xlat16_52.x;
            u_xlat16_3 = u_xlat16_4.zwxz + u_xlat16_5.zwxz;
            u_xlat16_6.z = u_xlat16_4.y;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_9.z = u_xlat16_5.y;
            u_xlat16_9.w = u_xlat16_52.y;
            u_xlat16_8.xyz = u_xlat16_6.zyw + u_xlat16_9.zyw;
            u_xlat16_10.xyz = u_xlat16_5.xzw / u_xlat16_3.zwy;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_9.xyz = u_xlat16_9.zyw / u_xlat16_8.xyz;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_4.xyz = u_xlat16_10.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_5.xyz = u_xlat16_9.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_4.w = u_xlat16_5.x;
            u_xlat16_6 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.ywxw;
            u_xlat16_9.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.zw;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_4.yw = u_xlat16_5.yz;
            u_xlat16_10 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_5 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.wywz;
            u_xlat16_4 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xwzw;
            u_xlat16_11 = u_xlat16_3.zwyz * u_xlat16_8.xxxy;
            u_xlat16_12 = u_xlat16_3 * u_xlat16_8.yyzz;
            u_xlat16_51.x = u_xlat16_3.y * u_xlat16_8.z;
            vec3 txVec4 = vec3(u_xlat16_6.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_6.zw,u_xlat2.w);
            u_xlat10_67 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_73 = u_xlat10_67 * u_xlat16_11.y;
            u_xlat16_73 = u_xlat16_11.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec6 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_73 = u_xlat16_11.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec7 = vec3(u_xlat16_5.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_73 = u_xlat16_11.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec8 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_73 = u_xlat16_12.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec9 = vec3(u_xlat16_10.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_73 = u_xlat16_12.y * u_xlat10_66 + u_xlat16_73;
            vec3 txVec10 = vec3(u_xlat16_5.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_73 = u_xlat16_12.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec11 = vec3(u_xlat16_4.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_73 = u_xlat16_12.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec12 = vec3(u_xlat16_4.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_29.x = u_xlat16_51.x * u_xlat10_66 + u_xlat16_73;
        } else {
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_5.yw = u_xlat16_4.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_52.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_9.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_53.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_9.xy;
            u_xlat16_53.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.zw = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_3.yw;
            u_xlat16_9 = u_xlat16_9 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_3.z = u_xlat16_9.z * 0.0816320032;
            u_xlat16_4.xy = u_xlat16_52.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_52.xy = u_xlat16_9.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_4.z = u_xlat16_9.w * 0.0816320032;
            u_xlat16_3.x = u_xlat16_4.y;
            u_xlat16_3.yw = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_52.x;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_6;
            u_xlat16_4.yw = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_52.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 / u_xlat16_3;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5 / u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_5 = u_xlat16_5.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_8.xzw = u_xlat16_6.yzw;
            u_xlat16_8.y = u_xlat16_5.x;
            u_xlat16_9 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_10.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.y = u_xlat16_8.y;
            u_xlat16_8.y = u_xlat16_5.z;
            u_xlat16_11 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_54.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.z = u_xlat16_8.y;
            u_xlat16_12 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyxz;
            u_xlat16_8.y = u_xlat16_5.w;
            u_xlat16_13 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_14.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_58.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xw;
            u_xlat16_5.xzw = u_xlat16_8.xzw;
            u_xlat16_8 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_15.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.wy;
            u_xlat16_5.x = u_xlat16_6.x;
            u_xlat16_51.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xy;
            u_xlat16_5 = u_xlat16_3 * u_xlat16_4.xxxx;
            u_xlat16_6 = u_xlat16_3 * u_xlat16_4.yyyy;
            u_xlat16_16 = u_xlat16_3 * u_xlat16_4.zzzz;
            u_xlat16_3 = u_xlat16_3 * u_xlat16_4.wwww;
            vec3 txVec13 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_67 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_9.x = u_xlat10_67 * u_xlat16_5.y;
            u_xlat16_9.x = u_xlat16_5.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec15 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_9.x = u_xlat16_5.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec16 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_9.x = u_xlat16_5.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec17 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_9.x = u_xlat16_6.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec18 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_9.x = u_xlat16_6.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec19 = vec3(u_xlat16_54.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_9.x = u_xlat16_6.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec20 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_9.x = u_xlat16_6.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec21 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_9.x = u_xlat16_16.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec22 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_9.x = u_xlat16_16.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec23 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_9.x = u_xlat16_16.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec24 = vec3(u_xlat16_58.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_9.x = u_xlat16_16.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec25 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_8.x = u_xlat16_3.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec26 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_8.x = u_xlat16_3.y * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec27 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_8.x = u_xlat16_3.z * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec28 = vec3(u_xlat16_51.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_29.x = u_xlat16_3.w * u_xlat10_66 + u_xlat16_8.x;
        }
    }
    u_xlat16_51.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_7.x = u_xlat16_29.x * u_xlat16_51.x + u_xlat16_7.x;
    u_xlatb66 = _ShadowStrength!=1.0;
    u_xlat67 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = u_xlat67 + _ShadowStrength;
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
    u_xlat67 = u_xlat67 * u_xlat16_7.x;
    u_xlat66 = (u_xlatb66) ? u_xlat67 : 1.0;
    u_xlatb67 = 0.0<_Albedo2UV2;
    u_xlat2.xy = (bool(u_xlatb67)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_17.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Albedo2Map, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _BaseColor2.xyz;
    u_xlat10_18.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = u_xlat10_18.xyz * _SpColor.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat19.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat4.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat19.y = dot(u_xlat4, vs_TEXCOORD1);
    u_xlat20.y = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat20.z = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat21.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat21.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat21.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat20.x = dot(u_xlat21.xyz, u_xlat1.xyz);
    u_xlat22.x = dot(u_xlat19.xxy, u_xlat19.xxy);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xy = u_xlat22.xx * u_xlat19.xy;
    u_xlat1.xy = u_xlat20.yx * u_xlat22.xy;
    u_xlat22.xy = u_xlat22.yx * u_xlat20.zy + (-u_xlat1.xy);
    u_xlat22.xy = u_xlat22.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_1.x = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat1.x = u_xlat10_1.x * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-u_xlat1.xx) + vec2(1.0, 0.5);
    u_xlat45.x = u_xlat0.x + (-_FresnelRange);
    u_xlat16_7.x = u_xlat45.x + u_xlat1.y;
    u_xlat16_7.x = u_xlat16_7.x * _FresnelPow;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat1.x + 1.0;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_19.xyz = texture2D(_SpeCapTex, u_xlat22.xy).xyz;
    u_xlat16_29.xyz = u_xlat18.xyz * u_xlat10_19.xyz;
    u_xlat16_8.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _LightColor0.xyz;
    u_xlat17.xyz = u_xlat10_17.xyz * _BaseColor.xyz + (-u_xlat2.xyz);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat17.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = u_xlat1.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * _EnvIntensity.xyz;
    u_xlat2 = vec4(u_xlat66) + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_7.xyz = u_xlat2.yzw * u_xlat16_29.xyz;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat22.xyz = u_xlat1.xyz * u_xlat2.xxx + u_xlat16_7.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat45.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat45.xy = u_xlat45.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_2 = texture2D(_LG_Tex, u_xlat45.xy);
    u_xlat10_1.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Fresnel;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Intensity;
    u_xlat0.x = u_xlat10_2.w * u_xlat0.x;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat10_2.xyz * u_xlat1.xyz;
    u_xlat10_2.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat0.x = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat0.xxx;
    u_xlat0.x = _Time.y * _Em_Speed;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(u_xlat0.xxx) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat22.xyz + u_xlat1.xyz;
    u_xlat16_7.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = u_xlat0.xyz / u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_COLOR0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3.w = in_TANGENT0.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD4.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _BaseColor;
uniform 	vec4 _BaseColor2;
uniform 	vec4 _RfColor;
uniform 	vec4 _SpColor;
uniform 	float _FresnelRange;
uniform 	float _FresnelPow;
uniform 	vec2 _MaskRange;
uniform 	vec4 _EnvIntensity;
uniform 	float _ShadowStrength;
uniform 	vec3 _SPShadowColor;
uniform 	vec4 _Albedo2Map_ST;
uniform 	float _Albedo2UV2;
uniform 	float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _SpeCapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
lowp vec3 u_xlat10_17;
vec3 u_xlat18;
lowp vec3 u_xlat10_18;
vec2 u_xlat19;
lowp vec3 u_xlat10_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_29;
vec2 u_xlat45;
mediump vec2 u_xlat16_51;
mediump vec2 u_xlat16_52;
mediump vec2 u_xlat16_53;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_58;
float u_xlat66;
lowp float u_xlat10_66;
bool u_xlatb66;
float u_xlat67;
lowp float u_xlat10_67;
bool u_xlatb67;
mediump float u_xlat16_73;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat66 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat0.xyz = vec3(u_xlat66) * u_xlat0.xyz;
    u_xlatb66 = unity_WorldTransformParams.w>=0.0;
    u_xlat66 = (u_xlatb66) ? 1.0 : -1.0;
    u_xlat66 = u_xlat66 * vs_TEXCOORD3.w;
    u_xlat1.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat1.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
    u_xlat10_2.xyz = texture2D(_NormalMap, vs_TEXCOORD2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat66 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat2.xyz = vec3(u_xlat66) * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat2.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = u_xlat2.yyy * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat2.zzz * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat66 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat1.xyz = vec3(u_xlat66) * u_xlat1.xyz;
    u_xlatb66 = _ShadowBias.z!=0.0;
    u_xlat67 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat2.xyz = vec3(u_xlat67) * _WorldSpaceLightPos0.xyz;
    u_xlat67 = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat67 = (-u_xlat67) * u_xlat67 + 1.0;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 * _ShadowBias.z;
    u_xlat2.xyz = (-vs_TEXCOORD4.xyz) * vec3(u_xlat67) + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = (bool(u_xlatb66)) ? u_xlat2.xyz : vs_TEXCOORD1.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat6;
    u_xlat4 = u_xlat2.yyyy * u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat4;
    u_xlat2 = u_xlat5 * u_xlat2.zzzz + u_xlat3;
    u_xlat2 = u_xlat6 + u_xlat2;
    u_xlat66 = _ShadowBias.x / u_xlat2.w;
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
    u_xlat66 = (-u_xlat66) + u_xlat2.z;
    u_xlat67 = max((-u_xlat2.w), u_xlat66);
    u_xlat67 = (-u_xlat66) + u_xlat67;
    u_xlat2.z = _ShadowBias.y * u_xlat67 + u_xlat66;
    u_xlat2.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlatb66 = _softShadowQuality==1.0;
    if(u_xlatb66){
        u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat3.z = 0.0;
        u_xlat3.xyz = u_xlat2.xyw + u_xlat3.xyz;
        vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat2.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_29.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb66 = _softShadowQuality==2.0;
        if(u_xlatb66){
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_52.xy = u_xlat16_4.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_9.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_53.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_10.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_53.xy;
            u_xlat16_8.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_3.yw;
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_4.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_53.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_3.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_4.z = u_xlat16_6.x;
            u_xlat16_4.w = u_xlat16_8.x;
            u_xlat16_5.z = u_xlat16_9.x;
            u_xlat16_5.w = u_xlat16_52.x;
            u_xlat16_3 = u_xlat16_4.zwxz + u_xlat16_5.zwxz;
            u_xlat16_6.z = u_xlat16_4.y;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_9.z = u_xlat16_5.y;
            u_xlat16_9.w = u_xlat16_52.y;
            u_xlat16_8.xyz = u_xlat16_6.zyw + u_xlat16_9.zyw;
            u_xlat16_10.xyz = u_xlat16_5.xzw / u_xlat16_3.zwy;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_9.xyz = u_xlat16_9.zyw / u_xlat16_8.xyz;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_4.xyz = u_xlat16_10.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_5.xyz = u_xlat16_9.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_4.w = u_xlat16_5.x;
            u_xlat16_6 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.ywxw;
            u_xlat16_9.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.zw;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_4.yw = u_xlat16_5.yz;
            u_xlat16_10 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_5 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.wywz;
            u_xlat16_4 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xwzw;
            u_xlat16_11 = u_xlat16_3.zwyz * u_xlat16_8.xxxy;
            u_xlat16_12 = u_xlat16_3 * u_xlat16_8.yyzz;
            u_xlat16_51.x = u_xlat16_3.y * u_xlat16_8.z;
            vec3 txVec4 = vec3(u_xlat16_6.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_6.zw,u_xlat2.w);
            u_xlat10_67 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_73 = u_xlat10_67 * u_xlat16_11.y;
            u_xlat16_73 = u_xlat16_11.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec6 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_73 = u_xlat16_11.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec7 = vec3(u_xlat16_5.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_73 = u_xlat16_11.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec8 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_73 = u_xlat16_12.x * u_xlat10_66 + u_xlat16_73;
            vec3 txVec9 = vec3(u_xlat16_10.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_73 = u_xlat16_12.y * u_xlat10_66 + u_xlat16_73;
            vec3 txVec10 = vec3(u_xlat16_5.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_73 = u_xlat16_12.z * u_xlat10_66 + u_xlat16_73;
            vec3 txVec11 = vec3(u_xlat16_4.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_73 = u_xlat16_12.w * u_xlat10_66 + u_xlat16_73;
            vec3 txVec12 = vec3(u_xlat16_4.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_29.x = u_xlat16_51.x * u_xlat10_66 + u_xlat16_73;
        } else {
            u_xlat16_51.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_51.xy = floor(u_xlat16_51.xy);
            u_xlat16_8.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_51.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_5.yw = u_xlat16_4.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_52.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_9.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_53.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_9.xy;
            u_xlat16_53.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.zw = (-u_xlat16_53.xy) * u_xlat16_53.xy + u_xlat16_3.yw;
            u_xlat16_9 = u_xlat16_9 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_3.z = u_xlat16_9.z * 0.0816320032;
            u_xlat16_4.xy = u_xlat16_52.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_52.xy = u_xlat16_9.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_4.z = u_xlat16_9.w * 0.0816320032;
            u_xlat16_3.x = u_xlat16_4.y;
            u_xlat16_3.yw = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_52.x;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_6;
            u_xlat16_4.yw = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_52.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 / u_xlat16_3;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5 / u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_5 = u_xlat16_5.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_8.xzw = u_xlat16_6.yzw;
            u_xlat16_8.y = u_xlat16_5.x;
            u_xlat16_9 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_10.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.y = u_xlat16_8.y;
            u_xlat16_8.y = u_xlat16_5.z;
            u_xlat16_11 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_54.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.z = u_xlat16_8.y;
            u_xlat16_12 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyxz;
            u_xlat16_8.y = u_xlat16_5.w;
            u_xlat16_13 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_14.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_58.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xw;
            u_xlat16_5.xzw = u_xlat16_8.xzw;
            u_xlat16_8 = u_xlat16_51.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_15.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.wy;
            u_xlat16_5.x = u_xlat16_6.x;
            u_xlat16_51.xy = u_xlat16_51.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xy;
            u_xlat16_5 = u_xlat16_3 * u_xlat16_4.xxxx;
            u_xlat16_6 = u_xlat16_3 * u_xlat16_4.yyyy;
            u_xlat16_16 = u_xlat16_3 * u_xlat16_4.zzzz;
            u_xlat16_3 = u_xlat16_3 * u_xlat16_4.wwww;
            vec3 txVec13 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_67 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_9.x = u_xlat10_67 * u_xlat16_5.y;
            u_xlat16_9.x = u_xlat16_5.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec15 = vec3(u_xlat16_10.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_9.x = u_xlat16_5.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec16 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_9.x = u_xlat16_5.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec17 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_9.x = u_xlat16_6.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec18 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_9.x = u_xlat16_6.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec19 = vec3(u_xlat16_54.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_9.x = u_xlat16_6.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec20 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_9.x = u_xlat16_6.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec21 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_9.x = u_xlat16_16.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec22 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_9.x = u_xlat16_16.y * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec23 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_9.x = u_xlat16_16.z * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec24 = vec3(u_xlat16_58.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_9.x = u_xlat16_16.w * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec25 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_8.x = u_xlat16_3.x * u_xlat10_66 + u_xlat16_9.x;
            vec3 txVec26 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_8.x = u_xlat16_3.y * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec27 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_8.x = u_xlat16_3.z * u_xlat10_66 + u_xlat16_8.x;
            vec3 txVec28 = vec3(u_xlat16_51.xy,u_xlat2.w);
            u_xlat10_66 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_29.x = u_xlat16_3.w * u_xlat10_66 + u_xlat16_8.x;
        }
    }
    u_xlat16_51.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_7.x = u_xlat16_29.x * u_xlat16_51.x + u_xlat16_7.x;
    u_xlatb66 = _ShadowStrength!=1.0;
    u_xlat67 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat67 = u_xlat67 + _ShadowStrength;
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
    u_xlat67 = u_xlat67 * u_xlat16_7.x;
    u_xlat66 = (u_xlatb66) ? u_xlat67 : 1.0;
    u_xlatb67 = 0.0<_Albedo2UV2;
    u_xlat2.xy = (bool(u_xlatb67)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat2.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat10_17.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_Albedo2Map, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _BaseColor2.xyz;
    u_xlat10_18.xyz = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = u_xlat10_18.xyz * _SpColor.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat3.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat19.x = dot(u_xlat3, vs_TEXCOORD1);
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat4.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat19.y = dot(u_xlat4, vs_TEXCOORD1);
    u_xlat20.y = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat20.z = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat21.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat21.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat21.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat20.x = dot(u_xlat21.xyz, u_xlat1.xyz);
    u_xlat22.x = dot(u_xlat19.xxy, u_xlat19.xxy);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat22.xy = u_xlat22.xx * u_xlat19.xy;
    u_xlat1.xy = u_xlat20.yx * u_xlat22.xy;
    u_xlat22.xy = u_xlat22.yx * u_xlat20.zy + (-u_xlat1.xy);
    u_xlat22.xy = u_xlat22.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_1.x = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat1.x = u_xlat10_1.x * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-u_xlat1.xx) + vec2(1.0, 0.5);
    u_xlat45.x = u_xlat0.x + (-_FresnelRange);
    u_xlat16_7.x = u_xlat45.x + u_xlat1.y;
    u_xlat16_7.x = u_xlat16_7.x * _FresnelPow;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_7.x = (-u_xlat16_7.x) * u_xlat1.x + 1.0;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_19.xyz = texture2D(_SpeCapTex, u_xlat22.xy).xyz;
    u_xlat16_29.xyz = u_xlat18.xyz * u_xlat10_19.xyz;
    u_xlat16_8.xyz = u_xlat16_29.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_8.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _LightColor0.xyz;
    u_xlat17.xyz = u_xlat10_17.xyz * _BaseColor.xyz + (-u_xlat2.xyz);
    u_xlat16_8.xyz = u_xlat16_7.xxx * u_xlat17.xyz + u_xlat2.xyz;
    u_xlat16_8.xyz = u_xlat1.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * _EnvIntensity.xyz;
    u_xlat2 = vec4(u_xlat66) + vec4(_ShadowStrength, _SPShadowColor.x, _SPShadowColor.y, _SPShadowColor.z);
    u_xlat16_7.xyz = u_xlat2.yzw * u_xlat16_29.xyz;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat22.xyz = u_xlat1.xyz * u_xlat2.xxx + u_xlat16_7.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat45.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat45.xy = u_xlat45.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_2 = texture2D(_LG_Tex, u_xlat45.xy);
    u_xlat10_1.xyz = texture2D(_LG_Mask, u_xlat1.xy).xyz;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Fresnel;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LG_Intensity;
    u_xlat0.x = u_xlat10_2.w * u_xlat0.x;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat10_2.xyz * u_xlat1.xyz;
    u_xlat10_2.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
    u_xlat0.x = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat0.xxx;
    u_xlat0.x = _Time.y * _Em_Speed;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(u_xlat0.xxx) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat22.xyz + u_xlat1.xyz;
    u_xlat16_7.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_7.xyz = u_xlat0.xyz / u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_EMISSION_ON" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  LOD 100
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 119597
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