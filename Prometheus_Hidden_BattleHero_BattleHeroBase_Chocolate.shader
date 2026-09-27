//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Prometheus/Hidden/BattleHero/BattleHeroBase_Chocolate" {
Properties {

}
SubShader {
 Pass {
 Name "FORWARDBASE_CHOCOLATE"
 ZWrite Off
  GpuProgramID 25729
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_6;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_6 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_6) * u_xlat16_2.xz;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Chocolate_Mask;
UNITY_LOCATION(4) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(5) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump float vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_30;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_9.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_9.xy = u_xlat16_1.ww * u_xlat16_9.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_9.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_9.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_9.x = max(u_xlat16_2.z, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_28 = texture(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_27 = u_xlat16_28 * _Chocolate_Blend;
    u_xlat16_30 = (-u_xlat16_1.x) + _Chocolate_Pow;
    u_xlat16_9.z = u_xlat16_27 * u_xlat16_30 + u_xlat16_1.x;
    u_xlat16_9.xz = u_xlat16_9.xz * u_xlat16_9.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1 = u_xlat16_9.z * u_xlat16_9.z + -1.0;
    u_xlat1 = u_xlat16_0.x * u_xlat1 + 1.00100005;
    u_xlat4 = u_xlat16_9.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_9.z * u_xlat4;
    u_xlat1 = u_xlat4 / u_xlat1;
    u_xlat16_5.xyz = vec3(u_xlat1) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_9.yyy + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_9.xxx;
    u_xlat16_7.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_8.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_8.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = (-u_xlat16_7.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_0.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_27 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_3.xyz = vec3(u_xlat16_27) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_0.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_1.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    }
    SV_Target0.w = u_xlat16_2.w * _Link;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_6;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_6 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_6) * u_xlat16_2.xz;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Chocolate_Mask;
UNITY_LOCATION(4) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(5) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump float vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_30;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_9.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_9.xy = u_xlat16_1.ww * u_xlat16_9.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_9.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_9.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_9.x = max(u_xlat16_2.z, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_28 = texture(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_27 = u_xlat16_28 * _Chocolate_Blend;
    u_xlat16_30 = (-u_xlat16_1.x) + _Chocolate_Pow;
    u_xlat16_9.z = u_xlat16_27 * u_xlat16_30 + u_xlat16_1.x;
    u_xlat16_9.xz = u_xlat16_9.xz * u_xlat16_9.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1 = u_xlat16_9.z * u_xlat16_9.z + -1.0;
    u_xlat1 = u_xlat16_0.x * u_xlat1 + 1.00100005;
    u_xlat4 = u_xlat16_9.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_9.z * u_xlat4;
    u_xlat1 = u_xlat4 / u_xlat1;
    u_xlat16_5.xyz = vec3(u_xlat1) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_9.yyy + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_9.xxx;
    u_xlat16_7.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_8.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_8.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = (-u_xlat16_7.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_0.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_27 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_3.xyz = vec3(u_xlat16_27) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_0.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_1.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    }
    SV_Target0.w = u_xlat16_2.w * _Link;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_6;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_6 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_6) * u_xlat16_2.xz;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpecularTex;
uniform lowp sampler2D _Chocolate_Mask;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
float u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_27;
lowp float u_xlat10_28;
mediump float u_xlat16_30;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_9.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_9.xy = u_xlat10_1.ww * u_xlat16_9.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_9.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_9.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_9.x = max(u_xlat10_2.z, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    u_xlat10_28 = texture2D(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_27 = u_xlat10_28 * _Chocolate_Blend;
    u_xlat16_30 = (-u_xlat10_1.x) + _Chocolate_Pow;
    u_xlat16_9.z = u_xlat16_27 * u_xlat16_30 + u_xlat10_1.x;
    u_xlat16_9.xz = u_xlat16_9.xz * u_xlat16_9.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1 = u_xlat16_9.z * u_xlat16_9.z + -1.0;
    u_xlat1 = u_xlat16_0.x * u_xlat1 + 1.00100005;
    u_xlat4 = u_xlat16_9.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_9.z * u_xlat4;
    u_xlat1 = u_xlat4 / u_xlat1;
    u_xlat16_5.xyz = vec3(u_xlat1) * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat10_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat10_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_9.yyy + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_9.xxx;
    u_xlat16_7.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_8.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_8.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = (-u_xlat16_7.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat10_28) * u_xlat16_0.xyz + u_xlat16_7.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_27 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_3.xyz = vec3(u_xlat16_27) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_3.xyz = u_xlat10_1.xxx * u_xlat16_3.xyz + u_xlat16_0.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat10_1.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    SV_Target0.w = u_xlat10_2.w * _Link;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_6;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_6 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_6) * u_xlat16_2.xz;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpecularTex;
uniform lowp sampler2D _Chocolate_Mask;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
float u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_27;
lowp float u_xlat10_28;
mediump float u_xlat16_30;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_9.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_9.xy = u_xlat10_1.ww * u_xlat16_9.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_9.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_9.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_9.x = max(u_xlat10_2.z, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    u_xlat10_28 = texture2D(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_27 = u_xlat10_28 * _Chocolate_Blend;
    u_xlat16_30 = (-u_xlat10_1.x) + _Chocolate_Pow;
    u_xlat16_9.z = u_xlat16_27 * u_xlat16_30 + u_xlat10_1.x;
    u_xlat16_9.xz = u_xlat16_9.xz * u_xlat16_9.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1 = u_xlat16_9.z * u_xlat16_9.z + -1.0;
    u_xlat1 = u_xlat16_0.x * u_xlat1 + 1.00100005;
    u_xlat4 = u_xlat16_9.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_9.z * u_xlat4;
    u_xlat1 = u_xlat4 / u_xlat1;
    u_xlat16_5.xyz = vec3(u_xlat1) * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat10_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat10_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_9.yyy + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_9.xxx;
    u_xlat16_7.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_8.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_8.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = (-u_xlat16_7.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat10_28) * u_xlat16_0.xyz + u_xlat16_7.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_27 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_3.xyz = vec3(u_xlat16_27) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_3.xyz = u_xlat10_1.xxx * u_xlat16_3.xyz + u_xlat16_0.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat10_1.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    SV_Target0.w = u_xlat10_2.w * _Link;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EFF_FLU_ON" }
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _RimColor;
uniform 	mediump vec4 _Glint_Color;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _EFF_LEILA;
uniform 	mediump float _FluAnimMapParaIntensity;
uniform 	mediump vec3 _FluAnimMapColor;
uniform 	mediump float _EFF_SD;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump float _Flu_Intensity_HelpBox;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Chocolate_Mask;
UNITY_LOCATION(4) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(5) uniform mediump sampler2D _Crystal_CustomColorMask;
UNITY_LOCATION(6) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _FluAnimMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump float vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec2 u_xlat16_11;
vec3 u_xlat12;
mediump float u_xlat16_15;
mediump float u_xlat16_30;
float u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
mediump float u_xlat16_33;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_10.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_10.xy = u_xlat16_1.ww * u_xlat16_10.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_10.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_10.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_10.x = max(u_xlat16_2.z, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_31 = texture(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_30 = u_xlat16_31 * _Chocolate_Blend;
    u_xlat16_33 = (-u_xlat16_1.x) + _Chocolate_Pow;
    u_xlat16_10.z = u_xlat16_30 * u_xlat16_33 + u_xlat16_1.x;
    u_xlat16_10.xz = u_xlat16_10.xz * u_xlat16_10.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_10.z * u_xlat16_10.z + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat4 = u_xlat16_10.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_10.z * u_xlat4;
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_10.yyy + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_10.xxx;
    u_xlat16_8.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_7.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_9.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = (-u_xlat16_8.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat16_31) * u_xlat16_0.xyz + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_30 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_5.xyz = vec3(u_xlat16_30) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + u_xlat16_0.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_5.xyz = u_xlat16_1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Flu_UV==2.0);
#else
    u_xlatb1 = _Flu_UV==2.0;
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_1.x = texture(_Flu_Mask, u_xlat1.xy).x;
    u_xlat16_11.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb31 = _Flu_Intensity==0.0;
#endif
    u_xlat16_30 = (u_xlatb31) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_30) * vs_TEXCOORD6.xy;
    u_xlat16_2.xyz = texture(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * _Flu_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_30 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_30 = u_xlat16_30 * _FluAlpha;
    u_xlat16_30 = u_xlat16_2.w * _Link + u_xlat16_30;
    u_xlat16_33 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _RimPower;
    u_xlat16_33 = exp2(u_xlat16_33);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_UseRimRange>=0.5);
#else
    u_xlatb1 = _UseRimRange>=0.5;
#endif
    u_xlat16_5.x = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_15 = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat31 = (-u_xlat16_5.x) + u_xlat16_15;
    u_xlat12.x = u_xlat16_33 + (-u_xlat16_5.x);
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
    u_xlat16_33 = (u_xlatb1) ? u_xlat31 : u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _RimIntensity;
    u_xlat16_33 = u_xlat16_11.x * u_xlat16_33;
    u_xlat16_5.x = float(1.0) / _RimOffset;
    u_xlat16_5.x = u_xlat16_33 * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_15 = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_15 * u_xlat16_5.x + (-u_xlat16_33);
    u_xlat16_4.x = _RimAlpha * u_xlat16_5.x + u_xlat16_33;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_5.x = u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat12.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = _RimColor.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.yzw = _RimColor.xyz * u_xlat12.xyz + (-u_xlat16_0.xyz);
    u_xlat16_4.yzw = _RimColor.xyz;
    u_xlat16_4 = (bool(u_xlatb1)) ? u_xlat16_5 : u_xlat16_4;
    u_xlat16_0.xyz = u_xlat16_4.yzw * u_xlat16_4.xxx + u_xlat16_0.xyz;
    u_xlat16_30 = _RimAlpha * u_xlat16_4.x + u_xlat16_30;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_11.x = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_33 = u_xlat16_11.x * u_xlat16_1.x;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Power;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Intensity;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * _Glint_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_11.yyy * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_SD);
#else
    u_xlatb1 = 0.5<_EFF_SD;
#endif
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_33 = u_xlat16_11.y * u_xlat16_33;
    SV_Target0.w = _Glint_Alpha * u_xlat16_33 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_LEILA);
#else
    u_xlatb1 = 0.5<_EFF_LEILA;
#endif
    if(u_xlatb1){
        u_xlat16_1.x = texture(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_30 = u_xlat16_2.x * _FluAnimMapParaIntensity;
        u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
        u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
        u_xlat16_0.xyz = u_xlat16_3.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_FLU_ON" }
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _RimColor;
uniform 	mediump vec4 _Glint_Color;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _EFF_LEILA;
uniform 	mediump float _FluAnimMapParaIntensity;
uniform 	mediump vec3 _FluAnimMapColor;
uniform 	mediump float _EFF_SD;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump float _Flu_Intensity_HelpBox;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Chocolate_Mask;
UNITY_LOCATION(4) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(5) uniform mediump sampler2D _Crystal_CustomColorMask;
UNITY_LOCATION(6) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _FluAnimMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump float vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec2 u_xlat16_11;
vec3 u_xlat12;
mediump float u_xlat16_15;
mediump float u_xlat16_30;
float u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
mediump float u_xlat16_33;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_10.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_10.xy = u_xlat16_1.ww * u_xlat16_10.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_10.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_10.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_10.x = max(u_xlat16_2.z, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_31 = texture(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_30 = u_xlat16_31 * _Chocolate_Blend;
    u_xlat16_33 = (-u_xlat16_1.x) + _Chocolate_Pow;
    u_xlat16_10.z = u_xlat16_30 * u_xlat16_33 + u_xlat16_1.x;
    u_xlat16_10.xz = u_xlat16_10.xz * u_xlat16_10.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_10.z * u_xlat16_10.z + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat4 = u_xlat16_10.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_10.z * u_xlat4;
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_10.yyy + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_10.xxx;
    u_xlat16_8.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_7.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_9.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = (-u_xlat16_8.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat16_31) * u_xlat16_0.xyz + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_30 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_5.xyz = vec3(u_xlat16_30) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + u_xlat16_0.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_5.xyz = u_xlat16_1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Flu_UV==2.0);
#else
    u_xlatb1 = _Flu_UV==2.0;
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_1.x = texture(_Flu_Mask, u_xlat1.xy).x;
    u_xlat16_11.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb31 = _Flu_Intensity==0.0;
#endif
    u_xlat16_30 = (u_xlatb31) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_30) * vs_TEXCOORD6.xy;
    u_xlat16_2.xyz = texture(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * _Flu_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_30 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_30 = u_xlat16_30 * _FluAlpha;
    u_xlat16_30 = u_xlat16_2.w * _Link + u_xlat16_30;
    u_xlat16_33 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _RimPower;
    u_xlat16_33 = exp2(u_xlat16_33);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_UseRimRange>=0.5);
#else
    u_xlatb1 = _UseRimRange>=0.5;
#endif
    u_xlat16_5.x = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_15 = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat31 = (-u_xlat16_5.x) + u_xlat16_15;
    u_xlat12.x = u_xlat16_33 + (-u_xlat16_5.x);
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
    u_xlat16_33 = (u_xlatb1) ? u_xlat31 : u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _RimIntensity;
    u_xlat16_33 = u_xlat16_11.x * u_xlat16_33;
    u_xlat16_5.x = float(1.0) / _RimOffset;
    u_xlat16_5.x = u_xlat16_33 * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_15 = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_15 * u_xlat16_5.x + (-u_xlat16_33);
    u_xlat16_4.x = _RimAlpha * u_xlat16_5.x + u_xlat16_33;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_5.x = u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat12.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = _RimColor.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.yzw = _RimColor.xyz * u_xlat12.xyz + (-u_xlat16_0.xyz);
    u_xlat16_4.yzw = _RimColor.xyz;
    u_xlat16_4 = (bool(u_xlatb1)) ? u_xlat16_5 : u_xlat16_4;
    u_xlat16_0.xyz = u_xlat16_4.yzw * u_xlat16_4.xxx + u_xlat16_0.xyz;
    u_xlat16_30 = _RimAlpha * u_xlat16_4.x + u_xlat16_30;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_11.x = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_33 = u_xlat16_11.x * u_xlat16_1.x;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Power;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Intensity;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * _Glint_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_11.yyy * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_SD);
#else
    u_xlatb1 = 0.5<_EFF_SD;
#endif
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_33 = u_xlat16_11.y * u_xlat16_33;
    SV_Target0.w = _Glint_Alpha * u_xlat16_33 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_LEILA);
#else
    u_xlatb1 = 0.5<_EFF_LEILA;
#endif
    if(u_xlatb1){
        u_xlat16_1.x = texture(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_30 = u_xlat16_2.x * _FluAnimMapParaIntensity;
        u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
        u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
        u_xlat16_0.xyz = u_xlat16_3.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_FLU_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _RimColor;
uniform 	mediump vec4 _Glint_Color;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _EFF_LEILA;
uniform 	mediump float _FluAnimMapParaIntensity;
uniform 	mediump vec3 _FluAnimMapColor;
uniform 	mediump float _EFF_SD;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump float _Flu_Intensity_HelpBox;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpecularTex;
uniform lowp sampler2D _Chocolate_Mask;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _FluAnimMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
lowp vec2 u_xlat10_11;
vec3 u_xlat12;
mediump float u_xlat16_15;
mediump float u_xlat16_30;
float u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
mediump float u_xlat16_33;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_10.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_10.xy = u_xlat10_1.ww * u_xlat16_10.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_10.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_10.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_10.x = max(u_xlat10_2.z, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat10_31 = texture2D(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_30 = u_xlat10_31 * _Chocolate_Blend;
    u_xlat16_33 = (-u_xlat10_1.x) + _Chocolate_Pow;
    u_xlat16_10.z = u_xlat16_30 * u_xlat16_33 + u_xlat10_1.x;
    u_xlat16_10.xz = u_xlat16_10.xz * u_xlat16_10.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_10.z * u_xlat16_10.z + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat4 = u_xlat16_10.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_10.z * u_xlat4;
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat10_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat10_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_10.yyy + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_10.xxx;
    u_xlat16_8.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_7.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_9.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = (-u_xlat16_8.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat10_31) * u_xlat16_0.xyz + u_xlat16_8.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_30 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_5.xyz = vec3(u_xlat16_30) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_5.xyz = u_xlat10_1.xxx * u_xlat16_5.xyz + u_xlat16_0.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_5.xyz = u_xlat10_1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    u_xlatb1 = _Flu_UV==2.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_1.x = texture2D(_Flu_Mask, u_xlat1.xy).x;
    u_xlat10_11.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlatb31 = _Flu_Intensity==0.0;
    u_xlat16_30 = (u_xlatb31) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_30) * vs_TEXCOORD6.xy;
    u_xlat10_2.xyz = texture2D(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * _Flu_Color.xyz;
    u_xlat16_5.xyz = u_xlat10_1.xxx * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_30 = u_xlat10_1.x * u_xlat10_2.x;
    u_xlat16_30 = u_xlat16_30 * _FluAlpha;
    u_xlat16_30 = u_xlat10_2.w * _Link + u_xlat16_30;
    u_xlat16_33 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _RimPower;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlatb1 = _UseRimRange>=0.5;
    u_xlat16_5.x = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_15 = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
    u_xlat31 = (-u_xlat16_5.x) + u_xlat16_15;
    u_xlat12.x = u_xlat16_33 + (-u_xlat16_5.x);
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat12.x = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
    u_xlat16_33 = (u_xlatb1) ? u_xlat31 : u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _RimIntensity;
    u_xlat16_33 = u_xlat10_11.x * u_xlat16_33;
    u_xlat16_5.x = float(1.0) / _RimOffset;
    u_xlat16_5.x = u_xlat16_33 * u_xlat16_5.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_15 = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_15 * u_xlat16_5.x + (-u_xlat16_33);
    u_xlat16_4.x = _RimAlpha * u_xlat16_5.x + u_xlat16_33;
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
    u_xlat16_5.x = u_xlat16_4.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat12.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = _RimColor.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.yzw = _RimColor.xyz * u_xlat12.xyz + (-u_xlat16_0.xyz);
    u_xlat16_4.yzw = _RimColor.xyz;
    u_xlat16_4 = (bool(u_xlatb1)) ? u_xlat16_5 : u_xlat16_4;
    u_xlat16_0.xyz = u_xlat16_4.yzw * u_xlat16_4.xxx + u_xlat16_0.xyz;
    u_xlat16_30 = _RimAlpha * u_xlat16_4.x + u_xlat16_30;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_11.x = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_33 = u_xlat10_11.x * u_xlat10_1.x;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Power;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Intensity;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * _Glint_Color.xyz;
    u_xlat16_5.xyz = u_xlat10_11.yyy * u_xlat16_5.xyz;
    u_xlatb1 = 0.5<_EFF_SD;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_33 = u_xlat10_11.y * u_xlat16_33;
    SV_Target0.w = _Glint_Alpha * u_xlat16_33 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlatb1 = 0.5<_EFF_LEILA;
    if(u_xlatb1){
        u_xlat10_1.x = texture2D(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_30 = u_xlat10_2.x * _FluAnimMapParaIntensity;
        u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
        u_xlat16_3.xyz = u_xlat10_1.xxx * u_xlat16_3.xyz;
        u_xlat16_0.xyz = u_xlat16_3.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_FLU_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _RimColor;
uniform 	mediump vec4 _Glint_Color;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _EFF_LEILA;
uniform 	mediump float _FluAnimMapParaIntensity;
uniform 	mediump vec3 _FluAnimMapColor;
uniform 	mediump float _EFF_SD;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump float _Flu_Intensity_HelpBox;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpecularTex;
uniform lowp sampler2D _Chocolate_Mask;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _FluAnimMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
lowp vec2 u_xlat10_11;
vec3 u_xlat12;
mediump float u_xlat16_15;
mediump float u_xlat16_30;
float u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
mediump float u_xlat16_33;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_10.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_10.xy = u_xlat10_1.ww * u_xlat16_10.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_10.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_10.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_10.x = max(u_xlat10_2.z, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat10_31 = texture2D(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_30 = u_xlat10_31 * _Chocolate_Blend;
    u_xlat16_33 = (-u_xlat10_1.x) + _Chocolate_Pow;
    u_xlat16_10.z = u_xlat16_30 * u_xlat16_33 + u_xlat10_1.x;
    u_xlat16_10.xz = u_xlat16_10.xz * u_xlat16_10.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_10.z * u_xlat16_10.z + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat4 = u_xlat16_10.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_10.z * u_xlat4;
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat10_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat10_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_10.yyy + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_10.xxx;
    u_xlat16_8.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_7.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_9.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = (-u_xlat16_8.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat10_31) * u_xlat16_0.xyz + u_xlat16_8.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_30 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_5.xyz = vec3(u_xlat16_30) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_5.xyz = u_xlat10_1.xxx * u_xlat16_5.xyz + u_xlat16_0.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_5.xyz = u_xlat10_1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    u_xlatb1 = _Flu_UV==2.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_1.x = texture2D(_Flu_Mask, u_xlat1.xy).x;
    u_xlat10_11.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlatb31 = _Flu_Intensity==0.0;
    u_xlat16_30 = (u_xlatb31) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_30) * vs_TEXCOORD6.xy;
    u_xlat10_2.xyz = texture2D(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * _Flu_Color.xyz;
    u_xlat16_5.xyz = u_xlat10_1.xxx * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_30 = u_xlat10_1.x * u_xlat10_2.x;
    u_xlat16_30 = u_xlat16_30 * _FluAlpha;
    u_xlat16_30 = u_xlat10_2.w * _Link + u_xlat16_30;
    u_xlat16_33 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _RimPower;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlatb1 = _UseRimRange>=0.5;
    u_xlat16_5.x = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_15 = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
    u_xlat31 = (-u_xlat16_5.x) + u_xlat16_15;
    u_xlat12.x = u_xlat16_33 + (-u_xlat16_5.x);
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat12.x = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
    u_xlat16_33 = (u_xlatb1) ? u_xlat31 : u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _RimIntensity;
    u_xlat16_33 = u_xlat10_11.x * u_xlat16_33;
    u_xlat16_5.x = float(1.0) / _RimOffset;
    u_xlat16_5.x = u_xlat16_33 * u_xlat16_5.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_15 = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_15 * u_xlat16_5.x + (-u_xlat16_33);
    u_xlat16_4.x = _RimAlpha * u_xlat16_5.x + u_xlat16_33;
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
    u_xlat16_5.x = u_xlat16_4.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat12.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = _RimColor.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.yzw = _RimColor.xyz * u_xlat12.xyz + (-u_xlat16_0.xyz);
    u_xlat16_4.yzw = _RimColor.xyz;
    u_xlat16_4 = (bool(u_xlatb1)) ? u_xlat16_5 : u_xlat16_4;
    u_xlat16_0.xyz = u_xlat16_4.yzw * u_xlat16_4.xxx + u_xlat16_0.xyz;
    u_xlat16_30 = _RimAlpha * u_xlat16_4.x + u_xlat16_30;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_11.x = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_33 = u_xlat10_11.x * u_xlat10_1.x;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Power;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Intensity;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * _Glint_Color.xyz;
    u_xlat16_5.xyz = u_xlat10_11.yyy * u_xlat16_5.xyz;
    u_xlatb1 = 0.5<_EFF_SD;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_33 = u_xlat10_11.y * u_xlat16_33;
    SV_Target0.w = _Glint_Alpha * u_xlat16_33 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlatb1 = 0.5<_EFF_LEILA;
    if(u_xlatb1){
        u_xlat10_1.x = texture2D(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_30 = u_xlat10_2.x * _FluAnimMapParaIntensity;
        u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
        u_xlat16_3.xyz = u_xlat10_1.xxx * u_xlat16_3.xyz;
        u_xlat16_0.xyz = u_xlat16_3.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EFF_MAP_NEW_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0.xy = texture(_LG_Tex, u_xlat0.xy).xy;
    u_xlat16_1.x = u_xlat16_0.x * 0.100000001;
    u_xlat0.xy = u_xlat16_1.xx * u_xlat16_0.yy + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0.xyz = texture(_LG_Tex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * _LG_Color.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_LG_Pw);
    u_xlat16_10 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_10 = log2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * _Fr_Fw;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_1.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * _LG_Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Fr_Pw);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.x = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = _MainTexBrightness + -1.0;
    u_xlat16_10 = u_xlat16_0.x * u_xlat16_10 + 1.0;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10) + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_0.w * _Link;
    SV_Target0.xyz = u_xlat16_1.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_MAP_NEW_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0.xy = texture(_LG_Tex, u_xlat0.xy).xy;
    u_xlat16_1.x = u_xlat16_0.x * 0.100000001;
    u_xlat0.xy = u_xlat16_1.xx * u_xlat16_0.yy + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0.xyz = texture(_LG_Tex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * _LG_Color.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_LG_Pw);
    u_xlat16_10 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_10 = log2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * _Fr_Fw;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_1.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * _LG_Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Fr_Pw);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.x = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = _MainTexBrightness + -1.0;
    u_xlat16_10 = u_xlat16_0.x * u_xlat16_10 + 1.0;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10) + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_0.w * _Link;
    SV_Target0.xyz = u_xlat16_1.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_MAP_NEW_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0.xy = texture2D(_LG_Tex, u_xlat0.xy).xy;
    u_xlat16_1.x = u_xlat10_0.x * 0.100000001;
    u_xlat0.xy = u_xlat16_1.xx * u_xlat10_0.yy + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0.xyz = texture2D(_LG_Tex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _LG_Color.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_LG_Pw);
    u_xlat16_10 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_10 = log2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * _Fr_Fw;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_1.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * _LG_Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Fr_Pw);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat10_0.x = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = _MainTexBrightness + -1.0;
    u_xlat16_10 = u_xlat10_0.x * u_xlat16_10 + 1.0;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(u_xlat16_10) + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat10_0.w * _Link;
    SV_Target0.xyz = u_xlat16_1.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_MAP_NEW_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0.xy = texture2D(_LG_Tex, u_xlat0.xy).xy;
    u_xlat16_1.x = u_xlat10_0.x * 0.100000001;
    u_xlat0.xy = u_xlat16_1.xx * u_xlat10_0.yy + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0.xyz = texture2D(_LG_Tex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _LG_Color.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_LG_Pw);
    u_xlat16_10 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_10 = log2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * _Fr_Fw;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_1.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * _LG_Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Fr_Pw);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat10_0.x = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = _MainTexBrightness + -1.0;
    u_xlat16_10 = u_xlat10_0.x * u_xlat16_10 + 1.0;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(u_xlat16_10) + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat10_0.w * _Link;
    SV_Target0.xyz = u_xlat16_1.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" }
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_4 = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat16_0.x = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _RimPower;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat5 = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_UseRimRange>=0.5);
#else
    u_xlatb5 = _UseRimRange>=0.5;
#endif
    u_xlat16_0.x = (u_xlatb5) ? u_xlat1.x : u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _RimIntensity;
    u_xlat16_1.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_1.x;
    u_xlat16_4 = float(1.0) / _RimOffset;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_4 * -2.0 + 3.0;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_8 * u_xlat16_4 + (-u_xlat16_0.x);
    u_xlat16_0.x = _RimAlpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat16_4 = u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_4 : u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb1 = _Flu_Intensity==0.0;
#endif
    u_xlat16_4 = (u_xlatb1) ? 1.0 : _Flu_Intensity;
    u_xlat1.xz = vec2(u_xlat16_4) * vs_TEXCOORD6.xy;
    u_xlat16_1.x = texture(_Flu_Tex, u_xlat1.xz).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_Flu_UV==2.0);
#else
    u_xlatb9 = _Flu_UV==2.0;
#endif
    u_xlat9.xy = (bool(u_xlatb9)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_9 = texture(_Flu_Mask, u_xlat9.xy).x;
    u_xlat16_4 = u_xlat16_9 * u_xlat16_1.x;
    u_xlat16_4 = u_xlat16_4 * _FluAlpha;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4 = u_xlat16_2.w * _Link + u_xlat16_4;
    u_xlat16_0.x = _RimAlpha * u_xlat16_0.x + u_xlat16_4;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_9 = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_4 = u_xlat16_9 * u_xlat16_1.x;
    u_xlat16_4 = log2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Power;
    u_xlat16_4 = exp2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Intensity;
    u_xlat16_4 = u_xlat16_1.y * u_xlat16_4;
    SV_Target0.w = _Glint_Alpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xy = texture(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_0.x = u_xlat16_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_0.xx * u_xlat16_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xyz = texture(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * _LG_Color.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_LG_Pw);
    u_xlat16_12 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_12 = log2(u_xlat16_12);
    u_xlat16_12 = u_xlat16_12 * _Fr_Fw;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_12) * _LG_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Fr_Pw);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.x = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_12 = _MainTexBrightness + -1.0;
    u_xlat16_12 = u_xlat16_1.x * u_xlat16_12 + 1.0;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_12) + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" }
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_4 = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat16_0.x = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _RimPower;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat5 = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_UseRimRange>=0.5);
#else
    u_xlatb5 = _UseRimRange>=0.5;
#endif
    u_xlat16_0.x = (u_xlatb5) ? u_xlat1.x : u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _RimIntensity;
    u_xlat16_1.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_1.x;
    u_xlat16_4 = float(1.0) / _RimOffset;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_4 * -2.0 + 3.0;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_8 * u_xlat16_4 + (-u_xlat16_0.x);
    u_xlat16_0.x = _RimAlpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat16_4 = u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_4 : u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb1 = _Flu_Intensity==0.0;
#endif
    u_xlat16_4 = (u_xlatb1) ? 1.0 : _Flu_Intensity;
    u_xlat1.xz = vec2(u_xlat16_4) * vs_TEXCOORD6.xy;
    u_xlat16_1.x = texture(_Flu_Tex, u_xlat1.xz).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_Flu_UV==2.0);
#else
    u_xlatb9 = _Flu_UV==2.0;
#endif
    u_xlat9.xy = (bool(u_xlatb9)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_9 = texture(_Flu_Mask, u_xlat9.xy).x;
    u_xlat16_4 = u_xlat16_9 * u_xlat16_1.x;
    u_xlat16_4 = u_xlat16_4 * _FluAlpha;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4 = u_xlat16_2.w * _Link + u_xlat16_4;
    u_xlat16_0.x = _RimAlpha * u_xlat16_0.x + u_xlat16_4;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_9 = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_4 = u_xlat16_9 * u_xlat16_1.x;
    u_xlat16_4 = log2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Power;
    u_xlat16_4 = exp2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Intensity;
    u_xlat16_4 = u_xlat16_1.y * u_xlat16_4;
    SV_Target0.w = _Glint_Alpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xy = texture(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_0.x = u_xlat16_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_0.xx * u_xlat16_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xyz = texture(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * _LG_Color.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_LG_Pw);
    u_xlat16_12 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_12 = log2(u_xlat16_12);
    u_xlat16_12 = u_xlat16_12 * _Fr_Fw;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_12) * _LG_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Fr_Pw);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.x = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_12 = _MainTexBrightness + -1.0;
    u_xlat16_12 = u_xlat16_1.x * u_xlat16_12 + 1.0;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_12) + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_8;
vec2 u_xlat9;
lowp float u_xlat10_9;
bool u_xlatb9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_4 = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
    u_xlat1.x = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat16_0.x = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _RimPower;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat5 = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat5 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlatb5 = _UseRimRange>=0.5;
    u_xlat16_0.x = (u_xlatb5) ? u_xlat1.x : u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _RimIntensity;
    u_xlat10_1.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat10_1.x;
    u_xlat16_4 = float(1.0) / _RimOffset;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_0.x;
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
    u_xlat16_8 = u_xlat16_4 * -2.0 + 3.0;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_8 * u_xlat16_4 + (-u_xlat16_0.x);
    u_xlat16_0.x = _RimAlpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat16_4 = u_xlat16_0.x;
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_4 : u_xlat16_0.x;
    u_xlatb1 = _Flu_Intensity==0.0;
    u_xlat16_4 = (u_xlatb1) ? 1.0 : _Flu_Intensity;
    u_xlat1.xz = vec2(u_xlat16_4) * vs_TEXCOORD6.xy;
    u_xlat10_1.x = texture2D(_Flu_Tex, u_xlat1.xz).x;
    u_xlatb9 = _Flu_UV==2.0;
    u_xlat9.xy = (bool(u_xlatb9)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_9 = texture2D(_Flu_Mask, u_xlat9.xy).x;
    u_xlat16_4 = u_xlat10_9 * u_xlat10_1.x;
    u_xlat16_4 = u_xlat16_4 * _FluAlpha;
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4 = u_xlat10_2.w * _Link + u_xlat16_4;
    u_xlat16_0.x = _RimAlpha * u_xlat16_0.x + u_xlat16_4;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_9 = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_4 = u_xlat10_9 * u_xlat10_1.x;
    u_xlat16_4 = log2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Power;
    u_xlat16_4 = exp2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Intensity;
    u_xlat16_4 = u_xlat10_1.y * u_xlat16_4;
    SV_Target0.w = _Glint_Alpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_0.x = u_xlat10_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_0.xx * u_xlat10_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xyz = texture2D(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_1.xyz * _LG_Color.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_LG_Pw);
    u_xlat16_12 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_12 = log2(u_xlat16_12);
    u_xlat16_12 = u_xlat16_12 * _Fr_Fw;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_12) * _LG_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Fr_Pw);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_3.xyz);
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat10_1.x = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_12 = _MainTexBrightness + -1.0;
    u_xlat16_12 = u_xlat10_1.x * u_xlat16_12 + 1.0;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(u_xlat16_12) + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_8;
vec2 u_xlat9;
lowp float u_xlat10_9;
bool u_xlatb9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_4 = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
    u_xlat1.x = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat16_0.x = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _RimPower;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat5 = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat5 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlatb5 = _UseRimRange>=0.5;
    u_xlat16_0.x = (u_xlatb5) ? u_xlat1.x : u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _RimIntensity;
    u_xlat10_1.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat10_1.x;
    u_xlat16_4 = float(1.0) / _RimOffset;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_0.x;
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
    u_xlat16_8 = u_xlat16_4 * -2.0 + 3.0;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_8 * u_xlat16_4 + (-u_xlat16_0.x);
    u_xlat16_0.x = _RimAlpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat16_4 = u_xlat16_0.x;
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_4 : u_xlat16_0.x;
    u_xlatb1 = _Flu_Intensity==0.0;
    u_xlat16_4 = (u_xlatb1) ? 1.0 : _Flu_Intensity;
    u_xlat1.xz = vec2(u_xlat16_4) * vs_TEXCOORD6.xy;
    u_xlat10_1.x = texture2D(_Flu_Tex, u_xlat1.xz).x;
    u_xlatb9 = _Flu_UV==2.0;
    u_xlat9.xy = (bool(u_xlatb9)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_9 = texture2D(_Flu_Mask, u_xlat9.xy).x;
    u_xlat16_4 = u_xlat10_9 * u_xlat10_1.x;
    u_xlat16_4 = u_xlat16_4 * _FluAlpha;
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4 = u_xlat10_2.w * _Link + u_xlat16_4;
    u_xlat16_0.x = _RimAlpha * u_xlat16_0.x + u_xlat16_4;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_9 = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_4 = u_xlat10_9 * u_xlat10_1.x;
    u_xlat16_4 = log2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Power;
    u_xlat16_4 = exp2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Intensity;
    u_xlat16_4 = u_xlat10_1.y * u_xlat16_4;
    SV_Target0.w = _Glint_Alpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_0.x = u_xlat10_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_0.xx * u_xlat10_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xyz = texture2D(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_1.xyz * _LG_Color.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_LG_Pw);
    u_xlat16_12 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_12 = log2(u_xlat16_12);
    u_xlat16_12 = u_xlat16_12 * _Fr_Fw;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_12) * _LG_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Fr_Pw);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_3.xyz);
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat10_1.x = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_12 = _MainTexBrightness + -1.0;
    u_xlat16_12 = u_xlat10_1.x * u_xlat16_12 + 1.0;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(u_xlat16_12) + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EFF_MAP_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_6;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_6 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_6) * u_xlat16_2.xz;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _EffMapColor;
uniform 	float _EffMapMoveSpd;
uniform 	mediump float _EffRate;
uniform 	mediump float _EffMapScale;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Chocolate_Mask;
UNITY_LOCATION(4) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(5) uniform mediump sampler2D _Crystal_CustomColorMask;
UNITY_LOCATION(6) uniform mediump sampler2D _EffMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump float vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_30;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_9.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_9.xy = u_xlat16_1.ww * u_xlat16_9.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_9.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_9.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_9.x = max(u_xlat16_2.z, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_28 = texture(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_27 = u_xlat16_28 * _Chocolate_Blend;
    u_xlat16_30 = (-u_xlat16_1.x) + _Chocolate_Pow;
    u_xlat16_9.z = u_xlat16_27 * u_xlat16_30 + u_xlat16_1.x;
    u_xlat16_9.xz = u_xlat16_9.xz * u_xlat16_9.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_9.z * u_xlat16_9.z + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat4 = u_xlat16_9.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_9.z * u_xlat4;
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_9.yyy + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_9.xxx;
    u_xlat16_7.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_8.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_8.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = (-u_xlat16_7.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_0.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_27 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_3.xyz = vec3(u_xlat16_27) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_0.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_1.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    }
    SV_Target0.w = u_xlat16_2.w * _Link;
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + _EffMapColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_MAP_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_6;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_6 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_6) * u_xlat16_2.xz;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _EffMapColor;
uniform 	float _EffMapMoveSpd;
uniform 	mediump float _EffRate;
uniform 	mediump float _EffMapScale;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Chocolate_Mask;
UNITY_LOCATION(4) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(5) uniform mediump sampler2D _Crystal_CustomColorMask;
UNITY_LOCATION(6) uniform mediump sampler2D _EffMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump float vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_30;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_9.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_9.xy = u_xlat16_1.ww * u_xlat16_9.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_9.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_9.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_9.x = max(u_xlat16_2.z, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_28 = texture(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_27 = u_xlat16_28 * _Chocolate_Blend;
    u_xlat16_30 = (-u_xlat16_1.x) + _Chocolate_Pow;
    u_xlat16_9.z = u_xlat16_27 * u_xlat16_30 + u_xlat16_1.x;
    u_xlat16_9.xz = u_xlat16_9.xz * u_xlat16_9.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_9.z * u_xlat16_9.z + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat4 = u_xlat16_9.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_9.z * u_xlat4;
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_9.yyy + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_9.xxx;
    u_xlat16_7.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_8.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_8.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = (-u_xlat16_7.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat16_28) * u_xlat16_0.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_27 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_3.xyz = vec3(u_xlat16_27) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_0.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_1.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    }
    SV_Target0.w = u_xlat16_2.w * _Link;
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + _EffMapColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_MAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_6;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_6 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_6) * u_xlat16_2.xz;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _EffMapColor;
uniform 	float _EffMapMoveSpd;
uniform 	mediump float _EffRate;
uniform 	mediump float _EffMapScale;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpecularTex;
uniform lowp sampler2D _Chocolate_Mask;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
uniform lowp sampler2D _EffMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_27;
lowp float u_xlat10_28;
mediump float u_xlat16_30;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_9.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_9.xy = u_xlat10_1.ww * u_xlat16_9.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_9.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_9.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_9.x = max(u_xlat10_2.z, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    u_xlat10_28 = texture2D(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_27 = u_xlat10_28 * _Chocolate_Blend;
    u_xlat16_30 = (-u_xlat10_1.x) + _Chocolate_Pow;
    u_xlat16_9.z = u_xlat16_27 * u_xlat16_30 + u_xlat10_1.x;
    u_xlat16_9.xz = u_xlat16_9.xz * u_xlat16_9.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_9.z * u_xlat16_9.z + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat4 = u_xlat16_9.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_9.z * u_xlat4;
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat10_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat10_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_9.yyy + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_9.xxx;
    u_xlat16_7.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_8.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_8.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = (-u_xlat16_7.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat10_28) * u_xlat16_0.xyz + u_xlat16_7.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_27 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_3.xyz = vec3(u_xlat16_27) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_3.xyz = u_xlat10_1.xxx * u_xlat16_3.xyz + u_xlat16_0.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat10_1.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    SV_Target0.w = u_xlat10_2.w * _Link;
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + _EffMapColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_MAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_6;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_6 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_6) * u_xlat16_2.xz;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _EffMapColor;
uniform 	float _EffMapMoveSpd;
uniform 	mediump float _EffRate;
uniform 	mediump float _EffMapScale;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpecularTex;
uniform lowp sampler2D _Chocolate_Mask;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
uniform lowp sampler2D _EffMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_27;
lowp float u_xlat10_28;
mediump float u_xlat16_30;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_9.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_9.xy = u_xlat10_1.ww * u_xlat16_9.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_9.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_9.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_9.x = max(u_xlat10_2.z, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    u_xlat10_28 = texture2D(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_27 = u_xlat10_28 * _Chocolate_Blend;
    u_xlat16_30 = (-u_xlat10_1.x) + _Chocolate_Pow;
    u_xlat16_9.z = u_xlat16_27 * u_xlat16_30 + u_xlat10_1.x;
    u_xlat16_9.xz = u_xlat16_9.xz * u_xlat16_9.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_9.z * u_xlat16_9.z + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat4 = u_xlat16_9.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_9.z * u_xlat4;
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat10_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat10_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_9.yyy + u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_9.xxx;
    u_xlat16_7.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_8.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_0.xzw + u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_8.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = (-u_xlat16_7.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat10_28) * u_xlat16_0.xyz + u_xlat16_7.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_27 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_3.xyz = vec3(u_xlat16_27) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_3.xyz = u_xlat10_1.xxx * u_xlat16_3.xyz + u_xlat16_0.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat10_1.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_27) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    SV_Target0.w = u_xlat10_2.w * _Link;
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + _EffMapColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_ON" }
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _EffMapColor;
uniform 	float _EffMapMoveSpd;
uniform 	mediump float _EffRate;
uniform 	mediump float _EffMapScale;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _RimColor;
uniform 	mediump vec4 _Glint_Color;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _EFF_LEILA;
uniform 	mediump float _FluAnimMapParaIntensity;
uniform 	mediump vec3 _FluAnimMapColor;
uniform 	mediump float _EFF_SD;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump float _Flu_Intensity_HelpBox;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Chocolate_Mask;
UNITY_LOCATION(4) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(5) uniform mediump sampler2D _Crystal_CustomColorMask;
UNITY_LOCATION(6) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _FluAnimMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EffMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump float vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec2 u_xlat16_11;
vec3 u_xlat12;
mediump float u_xlat16_15;
mediump float u_xlat16_30;
float u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
mediump float u_xlat16_33;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_10.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_10.xy = u_xlat16_1.ww * u_xlat16_10.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_10.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_10.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_10.x = max(u_xlat16_2.z, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_31 = texture(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_30 = u_xlat16_31 * _Chocolate_Blend;
    u_xlat16_33 = (-u_xlat16_1.x) + _Chocolate_Pow;
    u_xlat16_10.z = u_xlat16_30 * u_xlat16_33 + u_xlat16_1.x;
    u_xlat16_10.xz = u_xlat16_10.xz * u_xlat16_10.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_10.z * u_xlat16_10.z + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat4 = u_xlat16_10.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_10.z * u_xlat4;
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_10.yyy + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_10.xxx;
    u_xlat16_8.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_7.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_9.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = (-u_xlat16_8.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat16_31) * u_xlat16_0.xyz + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_30 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_5.xyz = vec3(u_xlat16_30) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + u_xlat16_0.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_5.xyz = u_xlat16_1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Flu_UV==2.0);
#else
    u_xlatb1 = _Flu_UV==2.0;
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_1.x = texture(_Flu_Mask, u_xlat1.xy).x;
    u_xlat16_11.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb31 = _Flu_Intensity==0.0;
#endif
    u_xlat16_30 = (u_xlatb31) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_30) * vs_TEXCOORD6.xy;
    u_xlat16_2.xyz = texture(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * _Flu_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_30 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_30 = u_xlat16_30 * _FluAlpha;
    u_xlat16_30 = u_xlat16_2.w * _Link + u_xlat16_30;
    u_xlat16_33 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _RimPower;
    u_xlat16_33 = exp2(u_xlat16_33);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_UseRimRange>=0.5);
#else
    u_xlatb1 = _UseRimRange>=0.5;
#endif
    u_xlat16_5.x = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_15 = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat31 = (-u_xlat16_5.x) + u_xlat16_15;
    u_xlat12.x = u_xlat16_33 + (-u_xlat16_5.x);
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
    u_xlat16_33 = (u_xlatb1) ? u_xlat31 : u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _RimIntensity;
    u_xlat16_33 = u_xlat16_11.x * u_xlat16_33;
    u_xlat16_5.x = float(1.0) / _RimOffset;
    u_xlat16_5.x = u_xlat16_33 * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_15 = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_15 * u_xlat16_5.x + (-u_xlat16_33);
    u_xlat16_4.x = _RimAlpha * u_xlat16_5.x + u_xlat16_33;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_5.x = u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat12.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = _RimColor.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.yzw = _RimColor.xyz * u_xlat12.xyz + (-u_xlat16_0.xyz);
    u_xlat16_4.yzw = _RimColor.xyz;
    u_xlat16_4 = (bool(u_xlatb1)) ? u_xlat16_5 : u_xlat16_4;
    u_xlat16_0.xyz = u_xlat16_4.yzw * u_xlat16_4.xxx + u_xlat16_0.xyz;
    u_xlat16_30 = _RimAlpha * u_xlat16_4.x + u_xlat16_30;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_11.x = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_33 = u_xlat16_11.x * u_xlat16_1.x;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Power;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Intensity;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * _Glint_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_11.yyy * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_SD);
#else
    u_xlatb1 = 0.5<_EFF_SD;
#endif
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_33 = u_xlat16_11.y * u_xlat16_33;
    SV_Target0.w = _Glint_Alpha * u_xlat16_33 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_LEILA);
#else
    u_xlatb1 = 0.5<_EFF_LEILA;
#endif
    if(u_xlatb1){
        u_xlat16_1.x = texture(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_30 = u_xlat16_2.x * _FluAnimMapParaIntensity;
        u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
        u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
        u_xlat16_0.xyz = u_xlat16_3.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
    }
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + _EffMapColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_ON" }
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _EffMapColor;
uniform 	float _EffMapMoveSpd;
uniform 	mediump float _EffRate;
uniform 	mediump float _EffMapScale;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _RimColor;
uniform 	mediump vec4 _Glint_Color;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _EFF_LEILA;
uniform 	mediump float _FluAnimMapParaIntensity;
uniform 	mediump vec3 _FluAnimMapColor;
uniform 	mediump float _EFF_SD;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump float _Flu_Intensity_HelpBox;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Chocolate_Mask;
UNITY_LOCATION(4) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(5) uniform mediump sampler2D _Crystal_CustomColorMask;
UNITY_LOCATION(6) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _FluAnimMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EffMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump float vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec2 u_xlat16_11;
vec3 u_xlat12;
mediump float u_xlat16_15;
mediump float u_xlat16_30;
float u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
mediump float u_xlat16_33;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_10.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_10.xy = u_xlat16_1.ww * u_xlat16_10.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_10.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_10.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_10.x = max(u_xlat16_2.z, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_31 = texture(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_30 = u_xlat16_31 * _Chocolate_Blend;
    u_xlat16_33 = (-u_xlat16_1.x) + _Chocolate_Pow;
    u_xlat16_10.z = u_xlat16_30 * u_xlat16_33 + u_xlat16_1.x;
    u_xlat16_10.xz = u_xlat16_10.xz * u_xlat16_10.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_10.z * u_xlat16_10.z + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat4 = u_xlat16_10.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_10.z * u_xlat4;
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_10.yyy + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_10.xxx;
    u_xlat16_8.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_7.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_9.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = (-u_xlat16_8.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat16_31) * u_xlat16_0.xyz + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_30 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_5.xyz = vec3(u_xlat16_30) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + u_xlat16_0.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_5.xyz = u_xlat16_1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Flu_UV==2.0);
#else
    u_xlatb1 = _Flu_UV==2.0;
#endif
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_1.x = texture(_Flu_Mask, u_xlat1.xy).x;
    u_xlat16_11.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb31 = _Flu_Intensity==0.0;
#endif
    u_xlat16_30 = (u_xlatb31) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_30) * vs_TEXCOORD6.xy;
    u_xlat16_2.xyz = texture(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * _Flu_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_30 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_30 = u_xlat16_30 * _FluAlpha;
    u_xlat16_30 = u_xlat16_2.w * _Link + u_xlat16_30;
    u_xlat16_33 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _RimPower;
    u_xlat16_33 = exp2(u_xlat16_33);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_UseRimRange>=0.5);
#else
    u_xlatb1 = _UseRimRange>=0.5;
#endif
    u_xlat16_5.x = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_15 = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat31 = (-u_xlat16_5.x) + u_xlat16_15;
    u_xlat12.x = u_xlat16_33 + (-u_xlat16_5.x);
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
    u_xlat16_33 = (u_xlatb1) ? u_xlat31 : u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _RimIntensity;
    u_xlat16_33 = u_xlat16_11.x * u_xlat16_33;
    u_xlat16_5.x = float(1.0) / _RimOffset;
    u_xlat16_5.x = u_xlat16_33 * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_15 = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_15 * u_xlat16_5.x + (-u_xlat16_33);
    u_xlat16_4.x = _RimAlpha * u_xlat16_5.x + u_xlat16_33;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_5.x = u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat12.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = _RimColor.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.yzw = _RimColor.xyz * u_xlat12.xyz + (-u_xlat16_0.xyz);
    u_xlat16_4.yzw = _RimColor.xyz;
    u_xlat16_4 = (bool(u_xlatb1)) ? u_xlat16_5 : u_xlat16_4;
    u_xlat16_0.xyz = u_xlat16_4.yzw * u_xlat16_4.xxx + u_xlat16_0.xyz;
    u_xlat16_30 = _RimAlpha * u_xlat16_4.x + u_xlat16_30;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_11.x = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_33 = u_xlat16_11.x * u_xlat16_1.x;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Power;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Intensity;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * _Glint_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_11.yyy * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_SD);
#else
    u_xlatb1 = 0.5<_EFF_SD;
#endif
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_33 = u_xlat16_11.y * u_xlat16_33;
    SV_Target0.w = _Glint_Alpha * u_xlat16_33 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_LEILA);
#else
    u_xlatb1 = 0.5<_EFF_LEILA;
#endif
    if(u_xlatb1){
        u_xlat16_1.x = texture(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_30 = u_xlat16_2.x * _FluAnimMapParaIntensity;
        u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
        u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
        u_xlat16_0.xyz = u_xlat16_3.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
    }
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + _EffMapColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _EffMapColor;
uniform 	float _EffMapMoveSpd;
uniform 	mediump float _EffRate;
uniform 	mediump float _EffMapScale;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _RimColor;
uniform 	mediump vec4 _Glint_Color;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _EFF_LEILA;
uniform 	mediump float _FluAnimMapParaIntensity;
uniform 	mediump vec3 _FluAnimMapColor;
uniform 	mediump float _EFF_SD;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump float _Flu_Intensity_HelpBox;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpecularTex;
uniform lowp sampler2D _Chocolate_Mask;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _FluAnimMap;
uniform lowp sampler2D _EffMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
lowp vec2 u_xlat10_11;
vec3 u_xlat12;
mediump float u_xlat16_15;
mediump float u_xlat16_30;
float u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
mediump float u_xlat16_33;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_10.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_10.xy = u_xlat10_1.ww * u_xlat16_10.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_10.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_10.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_10.x = max(u_xlat10_2.z, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat10_31 = texture2D(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_30 = u_xlat10_31 * _Chocolate_Blend;
    u_xlat16_33 = (-u_xlat10_1.x) + _Chocolate_Pow;
    u_xlat16_10.z = u_xlat16_30 * u_xlat16_33 + u_xlat10_1.x;
    u_xlat16_10.xz = u_xlat16_10.xz * u_xlat16_10.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_10.z * u_xlat16_10.z + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat4 = u_xlat16_10.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_10.z * u_xlat4;
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat10_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat10_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_10.yyy + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_10.xxx;
    u_xlat16_8.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_7.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_9.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = (-u_xlat16_8.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat10_31) * u_xlat16_0.xyz + u_xlat16_8.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_30 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_5.xyz = vec3(u_xlat16_30) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_5.xyz = u_xlat10_1.xxx * u_xlat16_5.xyz + u_xlat16_0.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_5.xyz = u_xlat10_1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    u_xlatb1 = _Flu_UV==2.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_1.x = texture2D(_Flu_Mask, u_xlat1.xy).x;
    u_xlat10_11.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlatb31 = _Flu_Intensity==0.0;
    u_xlat16_30 = (u_xlatb31) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_30) * vs_TEXCOORD6.xy;
    u_xlat10_2.xyz = texture2D(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * _Flu_Color.xyz;
    u_xlat16_5.xyz = u_xlat10_1.xxx * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_30 = u_xlat10_1.x * u_xlat10_2.x;
    u_xlat16_30 = u_xlat16_30 * _FluAlpha;
    u_xlat16_30 = u_xlat10_2.w * _Link + u_xlat16_30;
    u_xlat16_33 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _RimPower;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlatb1 = _UseRimRange>=0.5;
    u_xlat16_5.x = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_15 = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
    u_xlat31 = (-u_xlat16_5.x) + u_xlat16_15;
    u_xlat12.x = u_xlat16_33 + (-u_xlat16_5.x);
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat12.x = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
    u_xlat16_33 = (u_xlatb1) ? u_xlat31 : u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _RimIntensity;
    u_xlat16_33 = u_xlat10_11.x * u_xlat16_33;
    u_xlat16_5.x = float(1.0) / _RimOffset;
    u_xlat16_5.x = u_xlat16_33 * u_xlat16_5.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_15 = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_15 * u_xlat16_5.x + (-u_xlat16_33);
    u_xlat16_4.x = _RimAlpha * u_xlat16_5.x + u_xlat16_33;
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
    u_xlat16_5.x = u_xlat16_4.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat12.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = _RimColor.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.yzw = _RimColor.xyz * u_xlat12.xyz + (-u_xlat16_0.xyz);
    u_xlat16_4.yzw = _RimColor.xyz;
    u_xlat16_4 = (bool(u_xlatb1)) ? u_xlat16_5 : u_xlat16_4;
    u_xlat16_0.xyz = u_xlat16_4.yzw * u_xlat16_4.xxx + u_xlat16_0.xyz;
    u_xlat16_30 = _RimAlpha * u_xlat16_4.x + u_xlat16_30;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_11.x = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_33 = u_xlat10_11.x * u_xlat10_1.x;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Power;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Intensity;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * _Glint_Color.xyz;
    u_xlat16_5.xyz = u_xlat10_11.yyy * u_xlat16_5.xyz;
    u_xlatb1 = 0.5<_EFF_SD;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_33 = u_xlat10_11.y * u_xlat16_33;
    SV_Target0.w = _Glint_Alpha * u_xlat16_33 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlatb1 = 0.5<_EFF_LEILA;
    if(u_xlatb1){
        u_xlat10_1.x = texture2D(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_30 = u_xlat10_2.x * _FluAnimMapParaIntensity;
        u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
        u_xlat16_3.xyz = u_xlat10_1.xxx * u_xlat16_3.xyz;
        u_xlat16_0.xyz = u_xlat16_3.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
    }
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + _EffMapColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	mediump vec4 _EffMapColor;
uniform 	float _EffMapMoveSpd;
uniform 	mediump float _EffRate;
uniform 	mediump float _EffMapScale;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _RimColor;
uniform 	mediump vec4 _Glint_Color;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _EFF_LEILA;
uniform 	mediump float _FluAnimMapParaIntensity;
uniform 	mediump vec3 _FluAnimMapColor;
uniform 	mediump float _EFF_SD;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump vec4 _Chocolate_Color;
uniform 	mediump vec4 _Chocolate_Color_Spec;
uniform 	mediump float _Chocolate_Pow;
uniform 	mediump float _Chocolate_Blend;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _EmissiveCompensation;
uniform 	mediump float _Link;
uniform 	mediump float _Flu_Intensity_HelpBox;
uniform 	mediump vec3 _LightColor;
uniform 	mediump vec3 _EnvDiffuseLighting;
uniform 	mediump float _EmiIntensity;
uniform 	mediump float _EnvSpecularIntensity;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SpecularTex;
uniform lowp sampler2D _Chocolate_Mask;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _FluAnimMap;
uniform lowp sampler2D _EffMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
lowp vec2 u_xlat10_11;
vec3 u_xlat12;
mediump float u_xlat16_15;
mediump float u_xlat16_30;
float u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
mediump float u_xlat16_33;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_10.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_10.xy = u_xlat10_1.ww * u_xlat16_10.xy + vec2(1.0, 0.5);
    u_xlat16_3.xyz = u_xlat16_10.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_10.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_10.x = max(u_xlat10_2.z, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat10_31 = texture2D(_Chocolate_Mask, vs_TEXCOORD0.xy).x;
    u_xlat16_30 = u_xlat10_31 * _Chocolate_Blend;
    u_xlat16_33 = (-u_xlat10_1.x) + _Chocolate_Pow;
    u_xlat16_10.z = u_xlat16_30 * u_xlat16_33 + u_xlat10_1.x;
    u_xlat16_10.xz = u_xlat16_10.xz * u_xlat16_10.xz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_10.z * u_xlat16_10.z + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat4 = u_xlat16_10.z * 4.0 + 2.0;
    u_xlat4 = inversesqrt(u_xlat4);
    u_xlat4 = u_xlat16_10.z * u_xlat4;
    u_xlat1.x = u_xlat4 / u_xlat1.x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat10_1.zzz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat10_1.yyy * u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_3.xyz * u_xlat16_10.yyy + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_10.xxx;
    u_xlat16_8.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_5.xyz * _LightColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_7.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _Chocolate_Color_Spec.xyz;
    u_xlat16_9.xyz = vec3(vs_TEXCOORD9) * _Chocolate_Color.xyz;
    u_xlat16_5.xyz = u_xlat16_9.xyz * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw * _Chocolate_Color.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = (-u_xlat16_8.xyz) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = vec3(u_xlat10_31) * u_xlat16_0.xyz + u_xlat16_8.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_30 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_5.xyz = vec3(u_xlat16_30) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_5.xyz = u_xlat10_1.xxx * u_xlat16_5.xyz + u_xlat16_0.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_5.xyz = u_xlat10_1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_30) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    u_xlatb1 = _Flu_UV==2.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_1.x = texture2D(_Flu_Mask, u_xlat1.xy).x;
    u_xlat10_11.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlatb31 = _Flu_Intensity==0.0;
    u_xlat16_30 = (u_xlatb31) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_30) * vs_TEXCOORD6.xy;
    u_xlat10_2.xyz = texture2D(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * _Flu_Color.xyz;
    u_xlat16_5.xyz = u_xlat10_1.xxx * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_30 = u_xlat10_1.x * u_xlat10_2.x;
    u_xlat16_30 = u_xlat16_30 * _FluAlpha;
    u_xlat16_30 = u_xlat10_2.w * _Link + u_xlat16_30;
    u_xlat16_33 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _RimPower;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlatb1 = _UseRimRange>=0.5;
    u_xlat16_5.x = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_15 = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
    u_xlat31 = (-u_xlat16_5.x) + u_xlat16_15;
    u_xlat12.x = u_xlat16_33 + (-u_xlat16_5.x);
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat12.x = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat12.x;
    u_xlat16_33 = (u_xlatb1) ? u_xlat31 : u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _RimIntensity;
    u_xlat16_33 = u_xlat10_11.x * u_xlat16_33;
    u_xlat16_5.x = float(1.0) / _RimOffset;
    u_xlat16_5.x = u_xlat16_33 * u_xlat16_5.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_15 = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_15 * u_xlat16_5.x + (-u_xlat16_33);
    u_xlat16_4.x = _RimAlpha * u_xlat16_5.x + u_xlat16_33;
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
    u_xlat16_5.x = u_xlat16_4.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat12.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = _RimColor.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.yzw = _RimColor.xyz * u_xlat12.xyz + (-u_xlat16_0.xyz);
    u_xlat16_4.yzw = _RimColor.xyz;
    u_xlat16_4 = (bool(u_xlatb1)) ? u_xlat16_5 : u_xlat16_4;
    u_xlat16_0.xyz = u_xlat16_4.yzw * u_xlat16_4.xxx + u_xlat16_0.xyz;
    u_xlat16_30 = _RimAlpha * u_xlat16_4.x + u_xlat16_30;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_11.x = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_33 = u_xlat10_11.x * u_xlat10_1.x;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Power;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _Glint_Intensity;
    u_xlat16_5.xyz = vec3(u_xlat16_33) * _Glint_Color.xyz;
    u_xlat16_5.xyz = u_xlat10_11.yyy * u_xlat16_5.xyz;
    u_xlatb1 = 0.5<_EFF_SD;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_3.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_33 = u_xlat10_11.y * u_xlat16_33;
    SV_Target0.w = _Glint_Alpha * u_xlat16_33 + u_xlat16_30;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlatb1 = 0.5<_EFF_LEILA;
    if(u_xlatb1){
        u_xlat10_1.x = texture2D(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_30 = u_xlat10_2.x * _FluAnimMapParaIntensity;
        u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30);
        u_xlat16_3.xyz = u_xlat10_1.xxx * u_xlat16_3.xyz;
        u_xlat16_0.xyz = u_xlat16_3.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
    }
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + _EffMapColor.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0.xy = texture(_LG_Tex, u_xlat0.xy).xy;
    u_xlat16_1.x = u_xlat16_0.x * 0.100000001;
    u_xlat0.xy = u_xlat16_1.xx * u_xlat16_0.yy + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0.xyz = texture(_LG_Tex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * _LG_Color.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_LG_Pw);
    u_xlat16_10 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_10 = log2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * _Fr_Fw;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_1.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * _LG_Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Fr_Pw);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.x = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = _MainTexBrightness + -1.0;
    u_xlat16_10 = u_xlat16_0.x * u_xlat16_10 + 1.0;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10) + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_0.w * _Link;
    SV_Target0.xyz = u_xlat16_1.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0.xy = texture(_LG_Tex, u_xlat0.xy).xy;
    u_xlat16_1.x = u_xlat16_0.x * 0.100000001;
    u_xlat0.xy = u_xlat16_1.xx * u_xlat16_0.yy + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0.xyz = texture(_LG_Tex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * _LG_Color.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_LG_Pw);
    u_xlat16_10 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_10 = log2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * _Fr_Fw;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_1.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * _LG_Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Fr_Pw);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.x = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = _MainTexBrightness + -1.0;
    u_xlat16_10 = u_xlat16_0.x * u_xlat16_10 + 1.0;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10) + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_0.w * _Link;
    SV_Target0.xyz = u_xlat16_1.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0.xy = texture2D(_LG_Tex, u_xlat0.xy).xy;
    u_xlat16_1.x = u_xlat10_0.x * 0.100000001;
    u_xlat0.xy = u_xlat16_1.xx * u_xlat10_0.yy + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0.xyz = texture2D(_LG_Tex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _LG_Color.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_LG_Pw);
    u_xlat16_10 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_10 = log2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * _Fr_Fw;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_1.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * _LG_Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Fr_Pw);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat10_0.x = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = _MainTexBrightness + -1.0;
    u_xlat16_10 = u_xlat10_0.x * u_xlat16_10 + 1.0;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(u_xlat16_10) + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat10_0.w * _Link;
    SV_Target0.xyz = u_xlat16_1.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0.xy = texture2D(_LG_Tex, u_xlat0.xy).xy;
    u_xlat16_1.x = u_xlat10_0.x * 0.100000001;
    u_xlat0.xy = u_xlat16_1.xx * u_xlat10_0.yy + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0.xyz = texture2D(_LG_Tex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * _LG_Color.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_LG_Pw);
    u_xlat16_10 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_10 = log2(u_xlat16_10);
    u_xlat16_10 = u_xlat16_10 * _Fr_Fw;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_1.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * _LG_Color.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_Fr_Pw);
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, u_xlat16_2.xyz);
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat10_0.x = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = _MainTexBrightness + -1.0;
    u_xlat16_10 = u_xlat10_0.x * u_xlat16_10 + 1.0;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(u_xlat16_10) + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat10_0.w * _Link;
    SV_Target0.xyz = u_xlat16_1.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_4 = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat16_0.x = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _RimPower;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat5 = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_UseRimRange>=0.5);
#else
    u_xlatb5 = _UseRimRange>=0.5;
#endif
    u_xlat16_0.x = (u_xlatb5) ? u_xlat1.x : u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _RimIntensity;
    u_xlat16_1.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_1.x;
    u_xlat16_4 = float(1.0) / _RimOffset;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_4 * -2.0 + 3.0;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_8 * u_xlat16_4 + (-u_xlat16_0.x);
    u_xlat16_0.x = _RimAlpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat16_4 = u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_4 : u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb1 = _Flu_Intensity==0.0;
#endif
    u_xlat16_4 = (u_xlatb1) ? 1.0 : _Flu_Intensity;
    u_xlat1.xz = vec2(u_xlat16_4) * vs_TEXCOORD6.xy;
    u_xlat16_1.x = texture(_Flu_Tex, u_xlat1.xz).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_Flu_UV==2.0);
#else
    u_xlatb9 = _Flu_UV==2.0;
#endif
    u_xlat9.xy = (bool(u_xlatb9)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_9 = texture(_Flu_Mask, u_xlat9.xy).x;
    u_xlat16_4 = u_xlat16_9 * u_xlat16_1.x;
    u_xlat16_4 = u_xlat16_4 * _FluAlpha;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4 = u_xlat16_2.w * _Link + u_xlat16_4;
    u_xlat16_0.x = _RimAlpha * u_xlat16_0.x + u_xlat16_4;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_9 = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_4 = u_xlat16_9 * u_xlat16_1.x;
    u_xlat16_4 = log2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Power;
    u_xlat16_4 = exp2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Intensity;
    u_xlat16_4 = u_xlat16_1.y * u_xlat16_4;
    SV_Target0.w = _Glint_Alpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xy = texture(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_0.x = u_xlat16_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_0.xx * u_xlat16_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xyz = texture(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * _LG_Color.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_LG_Pw);
    u_xlat16_12 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_12 = log2(u_xlat16_12);
    u_xlat16_12 = u_xlat16_12 * _Fr_Fw;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_12) * _LG_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Fr_Pw);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.x = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_12 = _MainTexBrightness + -1.0;
    u_xlat16_12 = u_xlat16_1.x * u_xlat16_12 + 1.0;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_12) + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD9 = min(max(vs_TEXCOORD9, 0.0), 1.0);
#else
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
#endif
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_4 = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat16_0.x = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _RimPower;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat5 = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_UseRimRange>=0.5);
#else
    u_xlatb5 = _UseRimRange>=0.5;
#endif
    u_xlat16_0.x = (u_xlatb5) ? u_xlat1.x : u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _RimIntensity;
    u_xlat16_1.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_1.x;
    u_xlat16_4 = float(1.0) / _RimOffset;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_4 * -2.0 + 3.0;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_8 * u_xlat16_4 + (-u_xlat16_0.x);
    u_xlat16_0.x = _RimAlpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat16_4 = u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_4 : u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb1 = _Flu_Intensity==0.0;
#endif
    u_xlat16_4 = (u_xlatb1) ? 1.0 : _Flu_Intensity;
    u_xlat1.xz = vec2(u_xlat16_4) * vs_TEXCOORD6.xy;
    u_xlat16_1.x = texture(_Flu_Tex, u_xlat1.xz).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_Flu_UV==2.0);
#else
    u_xlatb9 = _Flu_UV==2.0;
#endif
    u_xlat9.xy = (bool(u_xlatb9)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_9 = texture(_Flu_Mask, u_xlat9.xy).x;
    u_xlat16_4 = u_xlat16_9 * u_xlat16_1.x;
    u_xlat16_4 = u_xlat16_4 * _FluAlpha;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4 = u_xlat16_2.w * _Link + u_xlat16_4;
    u_xlat16_0.x = _RimAlpha * u_xlat16_0.x + u_xlat16_4;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_9 = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_4 = u_xlat16_9 * u_xlat16_1.x;
    u_xlat16_4 = log2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Power;
    u_xlat16_4 = exp2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Intensity;
    u_xlat16_4 = u_xlat16_1.y * u_xlat16_4;
    SV_Target0.w = _Glint_Alpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xy = texture(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_0.x = u_xlat16_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_0.xx * u_xlat16_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xyz = texture(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * _LG_Color.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_LG_Pw);
    u_xlat16_12 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_12 = log2(u_xlat16_12);
    u_xlat16_12 = u_xlat16_12 * _Fr_Fw;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_12) * _LG_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Fr_Pw);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.x = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_12 = _MainTexBrightness + -1.0;
    u_xlat16_12 = u_xlat16_1.x * u_xlat16_12 + 1.0;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_12) + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_8;
vec2 u_xlat9;
lowp float u_xlat10_9;
bool u_xlatb9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_4 = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
    u_xlat1.x = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat16_0.x = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _RimPower;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat5 = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat5 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlatb5 = _UseRimRange>=0.5;
    u_xlat16_0.x = (u_xlatb5) ? u_xlat1.x : u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _RimIntensity;
    u_xlat10_1.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat10_1.x;
    u_xlat16_4 = float(1.0) / _RimOffset;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_0.x;
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
    u_xlat16_8 = u_xlat16_4 * -2.0 + 3.0;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_8 * u_xlat16_4 + (-u_xlat16_0.x);
    u_xlat16_0.x = _RimAlpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat16_4 = u_xlat16_0.x;
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_4 : u_xlat16_0.x;
    u_xlatb1 = _Flu_Intensity==0.0;
    u_xlat16_4 = (u_xlatb1) ? 1.0 : _Flu_Intensity;
    u_xlat1.xz = vec2(u_xlat16_4) * vs_TEXCOORD6.xy;
    u_xlat10_1.x = texture2D(_Flu_Tex, u_xlat1.xz).x;
    u_xlatb9 = _Flu_UV==2.0;
    u_xlat9.xy = (bool(u_xlatb9)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_9 = texture2D(_Flu_Mask, u_xlat9.xy).x;
    u_xlat16_4 = u_xlat10_9 * u_xlat10_1.x;
    u_xlat16_4 = u_xlat16_4 * _FluAlpha;
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4 = u_xlat10_2.w * _Link + u_xlat16_4;
    u_xlat16_0.x = _RimAlpha * u_xlat16_0.x + u_xlat16_4;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_9 = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_4 = u_xlat10_9 * u_xlat10_1.x;
    u_xlat16_4 = log2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Power;
    u_xlat16_4 = exp2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Intensity;
    u_xlat16_4 = u_xlat10_1.y * u_xlat16_4;
    SV_Target0.w = _Glint_Alpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_0.x = u_xlat10_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_0.xx * u_xlat10_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xyz = texture2D(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_1.xyz * _LG_Color.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_LG_Pw);
    u_xlat16_12 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_12 = log2(u_xlat16_12);
    u_xlat16_12 = u_xlat16_12 * _Fr_Fw;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_12) * _LG_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Fr_Pw);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_3.xyz);
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat10_1.x = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_12 = _MainTexBrightness + -1.0;
    u_xlat16_12 = u_xlat10_1.x * u_xlat16_12 + 1.0;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(u_xlat16_12) + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Glint_Tilling_Offset;
uniform 	mediump float _Flu_UV_OffsetSpeedV;
uniform 	mediump float _Flu_UV_OffsetSpeedU;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_UV;
uniform 	mediump float _Glint_Speed;
uniform 	mediump float _Chocolate_Wrap;
uniform 	mediump vec4 _HeroBattleLightDir;
uniform 	mediump float _TopHelpBox;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD9;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat16_2.x = dot(_HeroBattleLightDir.xyz, _HeroBattleLightDir.xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 6.10351563e-05);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _HeroBattleLightDir.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = u_xlat16_14;
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_14 + _Chocolate_Wrap;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_3 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_3 = max(u_xlat16_3, 6.10351563e-05);
    u_xlat16_3 = inversesqrt(u_xlat16_3);
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    vs_TEXCOORD2.w = 1.0;
    u_xlat16_2.x = _Chocolate_Wrap + 1.0;
    vs_TEXCOORD9 = u_xlat16_14 / u_xlat16_2.x;
    vs_TEXCOORD9 = clamp(vs_TEXCOORD9, 0.0, 1.0);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    u_xlat16_14 = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_3 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = u_xlat16_2.xz * vec2(u_xlat16_3);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    vs_TEXCOORD5.z = (-u_xlat16_14) + 1.0;
    vs_TEXCOORD5.x = u_xlat16_14;
    vs_TEXCOORD5.y = 0.100000001;
    u_xlatb0 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_Flu_UV, _Flu_UV, _Glint_UV, _Glint_UV));
    u_xlat0.x = (u_xlatb0.x) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.y = (u_xlatb0.y) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.z = (u_xlatb0.z) ? in_TEXCOORD0.x : in_TEXCOORD1.x;
    u_xlat0.w = (u_xlatb0.w) ? in_TEXCOORD0.y : in_TEXCOORD1.y;
    u_xlat0.xy = _Time.yy * vec2(_Flu_UV_OffsetSpeedU, _Flu_UV_OffsetSpeedV) + u_xlat0.xy;
    vs_TEXCOORD6.xy = u_xlat0.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat0.x = _Time.y * _Glint_Speed;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat1.xy = u_xlat0.zw * vec2(1.10000002, 1.10000002) + (-u_xlat0.xx);
    u_xlat0.xy = u_xlat0.zw * vec2(0.899999976, 0.899999976) + u_xlat0.xx;
    vs_TEXCOORD7.zw = u_xlat0.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
    vs_TEXCOORD7.xy = u_xlat1.xy * _Glint_Tilling_Offset.xy + _Glint_Tilling_Offset.zw;
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
uniform 	mediump vec3 _HitColFix;
uniform 	vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Pw;
uniform 	mediump float _L_V;
uniform 	mediump float _L_U;
uniform 	mediump float _Fr_Fw;
uniform 	mediump float _Fr_Pw;
uniform 	mediump float _RimPower;
uniform 	mediump float _UseRimRange;
uniform 	mediump float _RimRangeProportion;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimAlpha;
uniform 	mediump float _RimOffset;
uniform 	mediump float _Flu_Intensity;
uniform 	mediump float _FluAlpha;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Glint_Intensity;
uniform 	mediump float _Glint_Power;
uniform 	mediump float _Glint_Alpha;
uniform 	mediump float _HeroFluNewRimMode;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_8;
vec2 u_xlat9;
lowp float u_xlat10_9;
bool u_xlatb9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_4 = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
    u_xlat1.x = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat16_0.x = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _RimPower;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat5 = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat5 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat5;
    u_xlatb5 = _UseRimRange>=0.5;
    u_xlat16_0.x = (u_xlatb5) ? u_xlat1.x : u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _RimIntensity;
    u_xlat10_1.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat10_1.x;
    u_xlat16_4 = float(1.0) / _RimOffset;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_0.x;
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
    u_xlat16_8 = u_xlat16_4 * -2.0 + 3.0;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_8 * u_xlat16_4 + (-u_xlat16_0.x);
    u_xlat16_0.x = _RimAlpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat16_4 = u_xlat16_0.x;
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
    u_xlat16_0.x = (u_xlatb1) ? u_xlat16_4 : u_xlat16_0.x;
    u_xlatb1 = _Flu_Intensity==0.0;
    u_xlat16_4 = (u_xlatb1) ? 1.0 : _Flu_Intensity;
    u_xlat1.xz = vec2(u_xlat16_4) * vs_TEXCOORD6.xy;
    u_xlat10_1.x = texture2D(_Flu_Tex, u_xlat1.xz).x;
    u_xlatb9 = _Flu_UV==2.0;
    u_xlat9.xy = (bool(u_xlatb9)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_9 = texture2D(_Flu_Mask, u_xlat9.xy).x;
    u_xlat16_4 = u_xlat10_9 * u_xlat10_1.x;
    u_xlat16_4 = u_xlat16_4 * _FluAlpha;
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4 = u_xlat10_2.w * _Link + u_xlat16_4;
    u_xlat16_0.x = _RimAlpha * u_xlat16_0.x + u_xlat16_4;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_9 = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_4 = u_xlat10_9 * u_xlat10_1.x;
    u_xlat16_4 = log2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Power;
    u_xlat16_4 = exp2(u_xlat16_4);
    u_xlat16_4 = u_xlat16_4 * _Glint_Intensity;
    u_xlat16_4 = u_xlat10_1.y * u_xlat16_4;
    SV_Target0.w = _Glint_Alpha * u_xlat16_4 + u_xlat16_0.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_0.x = u_xlat10_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_0.xx * u_xlat10_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xyz = texture2D(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_1.xyz * _LG_Color.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_LG_Pw);
    u_xlat16_12 = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_12 = log2(u_xlat16_12);
    u_xlat16_12 = u_xlat16_12 * _Fr_Fw;
    u_xlat16_12 = exp2(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_12) * _LG_Color.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Fr_Pw);
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, u_xlat16_3.xyz);
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat10_1.x = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_12 = _MainTexBrightness + -1.0;
    u_xlat16_12 = u_xlat10_1.x * u_xlat16_12 + 1.0;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(u_xlat16_12) + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + _HitColFix.xyz;
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
Keywords { "_EFF_FLU_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_FLU_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_FLU_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_FLU_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EFF_MAP_NEW_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_MAP_NEW_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_MAP_NEW_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_MAP_NEW_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EFF_MAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_MAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_MAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_MAP_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_EFF_FLU_ON" "_EFF_MAP_NEW_ON" "_EFF_MAP_ON" }
""
}
}
}
}
}