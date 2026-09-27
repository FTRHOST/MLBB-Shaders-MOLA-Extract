//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Prometheus/Hidden/BattleHero/BattleHeroBase_Decal" {
Properties {

}
SubShader {
 Pass {
 Name "FORWARDBASE_DECAL"
  GpuProgramID 46674
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
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_5;
float u_xlat9;
mediump float u_xlat16_11;
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
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = max(u_xlat16_11, 6.10351563e-05);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_5 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_5) * u_xlat16_2.xz;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(9) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
vec3 u_xlat15;
ivec2 u_xlati16;
bool u_xlatb16;
bool u_xlatb28;
mediump float u_xlat16_36;
float u_xlat37;
bool u_xlatb40;
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
    u_xlat16_3 = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat15.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex1, u_xlat15.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat16_6 = texture(_DecalsTex2, u_xlat5.xy);
    u_xlat15.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat15.xy = u_xlat15.xy + u_xlat15.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat16_7 = texture(_DecalsTex3, u_xlat15.xy);
    u_xlat16_5 = texture(_DecalsTex4, u_xlat5.zw);
    u_xlat15.x = u_xlat16_3 * u_xlat16_4.w;
    u_xlat4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = u_xlat15.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat16_3 * u_xlat16_6.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat16_6.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat16_3 * u_xlat16_7.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat16_7.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat16_3 * u_xlat16_5.w;
    u_xlat5.xyz = (-u_xlat15.xyz) + u_xlat16_5.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlat4.x = max(u_xlat16_5.w, u_xlat16_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_4.w);
    u_xlat3 = u_xlat16_3 * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati16.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati16.x : u_xlati16.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5.x = !!(0.0<_UseMask4);
#else
    u_xlatb5.x = 0.0<_UseMask4;
#endif
    u_xlatb40 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb28 = u_xlatb4.z || u_xlatb40;
    u_xlatb16 = u_xlatb4.y || u_xlatb28;
    u_xlatb4.x = u_xlatb4.x || u_xlatb16;
    if(u_xlatb4.x){
        u_xlat16_4 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat15.xyz + (-u_xlat16_4.xyz);
        u_xlat15.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat16_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat16_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat15.xyz = (-u_xlat16_2.xyz) + u_xlat15.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat15.xyz + u_xlat16_2.xyz;
    u_xlat16_12.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_12.xy = u_xlat16_1.ww * u_xlat16_12.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_12.xxx * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_12.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_12.x = max(u_xlat16_2.z, u_xlat16_12.x);
    u_xlat16_12.x = (-u_xlat16_12.x) + 1.0;
    u_xlat16_36 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1 = u_xlat16_36 * u_xlat16_36 + -1.0;
    u_xlat1 = u_xlat16_0.x * u_xlat1 + 1.00100005;
    u_xlat37 = u_xlat16_36 * 4.0 + 2.0;
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat37 = u_xlat16_36 * u_xlat37;
    u_xlat1 = u_xlat37 / u_xlat1;
    u_xlat16_9.xyz = vec3(u_xlat1) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_12.yyy + u_xlat16_11.xyz;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_12.xxx;
    u_xlat16_11.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_36 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_8.xyz = vec3(u_xlat16_36) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz + u_xlat16_0.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_8.xyz = u_xlat16_1.yyy * u_xlat16_9.xyz + u_xlat16_8.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_9.xyz + u_xlat16_8.xyz;
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
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_5;
float u_xlat9;
mediump float u_xlat16_11;
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
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = max(u_xlat16_11, 6.10351563e-05);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_5 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_5) * u_xlat16_2.xz;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(9) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
vec3 u_xlat15;
ivec2 u_xlati16;
bool u_xlatb16;
bool u_xlatb28;
mediump float u_xlat16_36;
float u_xlat37;
bool u_xlatb40;
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
    u_xlat16_3 = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat15.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex1, u_xlat15.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat16_6 = texture(_DecalsTex2, u_xlat5.xy);
    u_xlat15.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat15.xy = u_xlat15.xy + u_xlat15.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat16_7 = texture(_DecalsTex3, u_xlat15.xy);
    u_xlat16_5 = texture(_DecalsTex4, u_xlat5.zw);
    u_xlat15.x = u_xlat16_3 * u_xlat16_4.w;
    u_xlat4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = u_xlat15.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat16_3 * u_xlat16_6.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat16_6.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat16_3 * u_xlat16_7.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat16_7.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat16_3 * u_xlat16_5.w;
    u_xlat5.xyz = (-u_xlat15.xyz) + u_xlat16_5.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlat4.x = max(u_xlat16_5.w, u_xlat16_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_4.w);
    u_xlat3 = u_xlat16_3 * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati16.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati16.x : u_xlati16.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5.x = !!(0.0<_UseMask4);
#else
    u_xlatb5.x = 0.0<_UseMask4;
#endif
    u_xlatb40 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb28 = u_xlatb4.z || u_xlatb40;
    u_xlatb16 = u_xlatb4.y || u_xlatb28;
    u_xlatb4.x = u_xlatb4.x || u_xlatb16;
    if(u_xlatb4.x){
        u_xlat16_4 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat15.xyz + (-u_xlat16_4.xyz);
        u_xlat15.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat16_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat16_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat15.xyz = (-u_xlat16_2.xyz) + u_xlat15.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat15.xyz + u_xlat16_2.xyz;
    u_xlat16_12.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_12.xy = u_xlat16_1.ww * u_xlat16_12.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_12.xxx * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_12.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_12.x = max(u_xlat16_2.z, u_xlat16_12.x);
    u_xlat16_12.x = (-u_xlat16_12.x) + 1.0;
    u_xlat16_36 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1 = u_xlat16_36 * u_xlat16_36 + -1.0;
    u_xlat1 = u_xlat16_0.x * u_xlat1 + 1.00100005;
    u_xlat37 = u_xlat16_36 * 4.0 + 2.0;
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat37 = u_xlat16_36 * u_xlat37;
    u_xlat1 = u_xlat37 / u_xlat1;
    u_xlat16_9.xyz = vec3(u_xlat1) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_12.yyy + u_xlat16_11.xyz;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_12.xxx;
    u_xlat16_11.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_36 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_8.xyz = vec3(u_xlat16_36) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz + u_xlat16_0.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_8.xyz = u_xlat16_1.yyy * u_xlat16_9.xyz + u_xlat16_8.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_9.xyz + u_xlat16_8.xyz;
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
varying mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_5;
float u_xlat9;
mediump float u_xlat16_11;
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
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = max(u_xlat16_11, 6.10351563e-05);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_5 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_5) * u_xlat16_2.xz;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _SpecularTex;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
float u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
vec3 u_xlat15;
ivec2 u_xlati16;
bool u_xlatb16;
bool u_xlatb28;
mediump float u_xlat16_36;
float u_xlat37;
bool u_xlatb40;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_3 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat15.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex1, u_xlat15.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat10_6 = texture2D(_DecalsTex2, u_xlat5.xy);
    u_xlat15.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat15.xy = u_xlat15.xy + u_xlat15.xy;
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
    u_xlat10_7 = texture2D(_DecalsTex3, u_xlat15.xy);
    u_xlat10_5 = texture2D(_DecalsTex4, u_xlat5.zw);
    u_xlat15.x = u_xlat10_3 * u_xlat10_4.w;
    u_xlat4.xyz = u_xlat10_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = u_xlat15.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat10_3 * u_xlat10_6.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat10_6.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_7.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat10_7.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_5.w;
    u_xlat5.xyz = (-u_xlat15.xyz) + u_xlat10_5.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlat4.x = max(u_xlat10_5.w, u_xlat10_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_4.w);
    u_xlat3 = u_xlat10_3 * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati16.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati16.x : u_xlati16.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
    u_xlatb5.x = 0.0<_UseMask4;
    u_xlatb40 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb28 = u_xlatb4.z || u_xlatb40;
    u_xlatb16 = u_xlatb4.y || u_xlatb28;
    u_xlatb4.x = u_xlatb4.x || u_xlatb16;
    if(u_xlatb4.x){
        u_xlat10_4 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat15.xyz + (-u_xlat10_4.xyz);
        u_xlat15.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat10_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat10_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat15.xyz = (-u_xlat10_2.xyz) + u_xlat15.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat15.xyz + u_xlat10_2.xyz;
    u_xlat16_12.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_12.xy = u_xlat10_1.ww * u_xlat16_12.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_12.xxx * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_12.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_12.x = max(u_xlat10_2.z, u_xlat16_12.x);
    u_xlat16_12.x = (-u_xlat16_12.x) + 1.0;
    u_xlat16_36 = u_xlat10_1.x * u_xlat10_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1 = u_xlat16_36 * u_xlat16_36 + -1.0;
    u_xlat1 = u_xlat16_0.x * u_xlat1 + 1.00100005;
    u_xlat37 = u_xlat16_36 * 4.0 + 2.0;
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat37 = u_xlat16_36 * u_xlat37;
    u_xlat1 = u_xlat37 / u_xlat1;
    u_xlat16_9.xyz = vec3(u_xlat1) * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat10_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat10_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_12.yyy + u_xlat16_11.xyz;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_12.xxx;
    u_xlat16_11.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_36 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_8.xyz = vec3(u_xlat16_36) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_8.xyz = u_xlat10_1.xxx * u_xlat16_8.xyz + u_xlat16_0.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_8.xyz = u_xlat10_1.yyy * u_xlat16_9.xyz + u_xlat16_8.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_9.xyz + u_xlat16_8.xyz;
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
varying mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_5;
float u_xlat9;
mediump float u_xlat16_11;
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
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = max(u_xlat16_11, 6.10351563e-05);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_5 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_5) * u_xlat16_2.xz;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _SpecularTex;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
float u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
vec3 u_xlat15;
ivec2 u_xlati16;
bool u_xlatb16;
bool u_xlatb28;
mediump float u_xlat16_36;
float u_xlat37;
bool u_xlatb40;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_3 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat15.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex1, u_xlat15.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat10_6 = texture2D(_DecalsTex2, u_xlat5.xy);
    u_xlat15.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat15.xy = u_xlat15.xy + u_xlat15.xy;
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
    u_xlat10_7 = texture2D(_DecalsTex3, u_xlat15.xy);
    u_xlat10_5 = texture2D(_DecalsTex4, u_xlat5.zw);
    u_xlat15.x = u_xlat10_3 * u_xlat10_4.w;
    u_xlat4.xyz = u_xlat10_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = u_xlat15.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat10_3 * u_xlat10_6.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat10_6.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_7.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat10_7.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_5.w;
    u_xlat5.xyz = (-u_xlat15.xyz) + u_xlat10_5.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlat4.x = max(u_xlat10_5.w, u_xlat10_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_4.w);
    u_xlat3 = u_xlat10_3 * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati16.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati16.x : u_xlati16.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
    u_xlatb5.x = 0.0<_UseMask4;
    u_xlatb40 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb28 = u_xlatb4.z || u_xlatb40;
    u_xlatb16 = u_xlatb4.y || u_xlatb28;
    u_xlatb4.x = u_xlatb4.x || u_xlatb16;
    if(u_xlatb4.x){
        u_xlat10_4 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat15.xyz + (-u_xlat10_4.xyz);
        u_xlat15.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat10_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat10_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat15.xyz = (-u_xlat10_2.xyz) + u_xlat15.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat15.xyz + u_xlat10_2.xyz;
    u_xlat16_12.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_12.xy = u_xlat10_1.ww * u_xlat16_12.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_12.xxx * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_12.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_12.x = max(u_xlat10_2.z, u_xlat16_12.x);
    u_xlat16_12.x = (-u_xlat16_12.x) + 1.0;
    u_xlat16_36 = u_xlat10_1.x * u_xlat10_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1 = u_xlat16_36 * u_xlat16_36 + -1.0;
    u_xlat1 = u_xlat16_0.x * u_xlat1 + 1.00100005;
    u_xlat37 = u_xlat16_36 * 4.0 + 2.0;
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat37 = u_xlat16_36 * u_xlat37;
    u_xlat1 = u_xlat37 / u_xlat1;
    u_xlat16_9.xyz = vec3(u_xlat1) * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat10_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat10_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_12.yyy + u_xlat16_11.xyz;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_12.xxx;
    u_xlat16_11.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_36 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_8.xyz = vec3(u_xlat16_36) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_8.xyz = u_xlat10_1.xxx * u_xlat16_8.xyz + u_xlat16_0.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_8.xyz = u_xlat10_1.yyy * u_xlat16_9.xyz + u_xlat16_8.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_9.xyz + u_xlat16_8.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(9) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
UNITY_LOCATION(11) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(12) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(13) uniform mediump sampler2D _FluAnimMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
ivec2 u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
bool u_xlatb30;
mediump float u_xlat16_39;
float u_xlat40;
bool u_xlatb40;
bool u_xlatb43;
mediump float u_xlat16_47;
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
    u_xlat16_3.x = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex1, u_xlat16.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat16_6 = texture(_DecalsTex2, u_xlat5.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_7 = texture(_DecalsTex3, u_xlat16.xy);
    u_xlat16_5 = texture(_DecalsTex4, u_xlat5.zw);
    u_xlat16.x = u_xlat16_3.x * u_xlat16_4.w;
    u_xlat4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16.xyz = u_xlat16.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat16_3.x * u_xlat16_6.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat16_6.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat16_3.x * u_xlat16_7.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat16_7.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat16_3.x * u_xlat16_5.w;
    u_xlat5.xyz = (-u_xlat16.xyz) + u_xlat16_5.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat16.xyz;
    u_xlat4.x = max(u_xlat16_5.w, u_xlat16_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_4.w);
    u_xlat3 = u_xlat16_3.x * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati17.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati17.x : u_xlati17.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5.x = !!(0.0<_UseMask4);
#else
    u_xlatb5.x = 0.0<_UseMask4;
#endif
    u_xlatb43 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb30 = u_xlatb4.z || u_xlatb43;
    u_xlatb17 = u_xlatb4.y || u_xlatb30;
    u_xlatb4.x = u_xlatb4.x || u_xlatb17;
    if(u_xlatb4.x){
        u_xlat16_4 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat16.xyz + (-u_xlat16_4.xyz);
        u_xlat16.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat16_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat16_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat16.xyz = (-u_xlat16_2.xyz) + u_xlat16.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat16.xyz + u_xlat16_2.xyz;
    u_xlat16_13.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_13.xy = u_xlat16_1.ww * u_xlat16_13.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_13.xxx * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_13.x = max(u_xlat16_2.z, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    u_xlat16_39 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_39 * u_xlat16_39 + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat40 = u_xlat16_39 * 4.0 + 2.0;
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat40 = u_xlat16_39 * u_xlat40;
    u_xlat1.x = u_xlat40 / u_xlat1.x;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_13.yyy + u_xlat16_11.xyz;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_11.xyz = u_xlat16_8.xyz * u_xlat16_13.xxx;
    u_xlat16_12.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_39 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_9.xyz = vec3(u_xlat16_39) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz + u_xlat16_0.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat16_1.yyy * u_xlat16_10.xyz + u_xlat16_9.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_10.xyz + u_xlat16_9.xyz;
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
    u_xlat16_14.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb40 = _Flu_Intensity==0.0;
#endif
    u_xlat16_39 = (u_xlatb40) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_39) * vs_TEXCOORD6.xy;
    u_xlat16_2.xyz = texture(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_2.xyz * _Flu_Color.xyz;
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_9.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_39 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_39 = u_xlat16_39 * _FluAlpha;
    u_xlat16_39 = u_xlat16_2.w * _Link + u_xlat16_39;
    u_xlat16_47 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _RimPower;
    u_xlat16_47 = exp2(u_xlat16_47);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_UseRimRange>=0.5);
#else
    u_xlatb1 = _UseRimRange>=0.5;
#endif
    u_xlat16_9.x = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_22 = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_9.x) + u_xlat16_22;
    u_xlat15.x = u_xlat16_47 + (-u_xlat16_9.x);
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat16_47 = (u_xlatb1) ? u_xlat40 : u_xlat16_47;
    u_xlat16_47 = u_xlat16_47 * _RimIntensity;
    u_xlat16_47 = u_xlat16_14.x * u_xlat16_47;
    u_xlat16_9.x = float(1.0) / _RimOffset;
    u_xlat16_9.x = u_xlat16_47 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_22 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_22 * u_xlat16_9.x + (-u_xlat16_47);
    u_xlat16_3.x = _RimAlpha * u_xlat16_9.x + u_xlat16_47;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_4.x = u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat15.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat15.xyz = _RimColor.xyz * u_xlat15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.yzw = _RimColor.xyz * u_xlat15.xyz + (-u_xlat16_0.xyz);
    u_xlat16_3.yzw = _RimColor.xyz;
    u_xlat16_3 = (bool(u_xlatb1)) ? u_xlat16_4 : u_xlat16_3;
    u_xlat16_0.xyz = u_xlat16_3.yzw * u_xlat16_3.xxx + u_xlat16_0.xyz;
    u_xlat16_39 = _RimAlpha * u_xlat16_3.x + u_xlat16_39;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_14.x = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_47 = u_xlat16_14.x * u_xlat16_1.x;
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Power;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Intensity;
    u_xlat16_9.xyz = vec3(u_xlat16_47) * _Glint_Color.xyz;
    u_xlat16_9.xyz = u_xlat16_14.yyy * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_SD);
#else
    u_xlatb1 = 0.5<_EFF_SD;
#endif
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_8.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = (bool(u_xlatb1)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_47 = u_xlat16_14.y * u_xlat16_47;
    SV_Target0.w = _Glint_Alpha * u_xlat16_47 + u_xlat16_39;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_LEILA);
#else
    u_xlatb1 = 0.5<_EFF_LEILA;
#endif
    if(u_xlatb1){
        u_xlat16_1.x = texture(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_39 = u_xlat16_2.x * _FluAnimMapParaIntensity;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_39);
        u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz;
        u_xlat16_0.xyz = u_xlat16_8.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(9) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
UNITY_LOCATION(11) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(12) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(13) uniform mediump sampler2D _FluAnimMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
ivec2 u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
bool u_xlatb30;
mediump float u_xlat16_39;
float u_xlat40;
bool u_xlatb40;
bool u_xlatb43;
mediump float u_xlat16_47;
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
    u_xlat16_3.x = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex1, u_xlat16.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat16_6 = texture(_DecalsTex2, u_xlat5.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_7 = texture(_DecalsTex3, u_xlat16.xy);
    u_xlat16_5 = texture(_DecalsTex4, u_xlat5.zw);
    u_xlat16.x = u_xlat16_3.x * u_xlat16_4.w;
    u_xlat4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16.xyz = u_xlat16.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat16_3.x * u_xlat16_6.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat16_6.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat16_3.x * u_xlat16_7.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat16_7.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat16_3.x * u_xlat16_5.w;
    u_xlat5.xyz = (-u_xlat16.xyz) + u_xlat16_5.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat16.xyz;
    u_xlat4.x = max(u_xlat16_5.w, u_xlat16_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_4.w);
    u_xlat3 = u_xlat16_3.x * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati17.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati17.x : u_xlati17.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5.x = !!(0.0<_UseMask4);
#else
    u_xlatb5.x = 0.0<_UseMask4;
#endif
    u_xlatb43 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb30 = u_xlatb4.z || u_xlatb43;
    u_xlatb17 = u_xlatb4.y || u_xlatb30;
    u_xlatb4.x = u_xlatb4.x || u_xlatb17;
    if(u_xlatb4.x){
        u_xlat16_4 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat16.xyz + (-u_xlat16_4.xyz);
        u_xlat16.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat16_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat16_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat16.xyz = (-u_xlat16_2.xyz) + u_xlat16.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat16.xyz + u_xlat16_2.xyz;
    u_xlat16_13.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_13.xy = u_xlat16_1.ww * u_xlat16_13.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_13.xxx * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_13.x = max(u_xlat16_2.z, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    u_xlat16_39 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_39 * u_xlat16_39 + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat40 = u_xlat16_39 * 4.0 + 2.0;
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat40 = u_xlat16_39 * u_xlat40;
    u_xlat1.x = u_xlat40 / u_xlat1.x;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_13.yyy + u_xlat16_11.xyz;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_11.xyz = u_xlat16_8.xyz * u_xlat16_13.xxx;
    u_xlat16_12.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_39 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_9.xyz = vec3(u_xlat16_39) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz + u_xlat16_0.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat16_1.yyy * u_xlat16_10.xyz + u_xlat16_9.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_10.xyz + u_xlat16_9.xyz;
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
    u_xlat16_14.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb40 = _Flu_Intensity==0.0;
#endif
    u_xlat16_39 = (u_xlatb40) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_39) * vs_TEXCOORD6.xy;
    u_xlat16_2.xyz = texture(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_2.xyz * _Flu_Color.xyz;
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_9.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_39 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_39 = u_xlat16_39 * _FluAlpha;
    u_xlat16_39 = u_xlat16_2.w * _Link + u_xlat16_39;
    u_xlat16_47 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _RimPower;
    u_xlat16_47 = exp2(u_xlat16_47);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_UseRimRange>=0.5);
#else
    u_xlatb1 = _UseRimRange>=0.5;
#endif
    u_xlat16_9.x = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_22 = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_9.x) + u_xlat16_22;
    u_xlat15.x = u_xlat16_47 + (-u_xlat16_9.x);
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat16_47 = (u_xlatb1) ? u_xlat40 : u_xlat16_47;
    u_xlat16_47 = u_xlat16_47 * _RimIntensity;
    u_xlat16_47 = u_xlat16_14.x * u_xlat16_47;
    u_xlat16_9.x = float(1.0) / _RimOffset;
    u_xlat16_9.x = u_xlat16_47 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_22 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_22 * u_xlat16_9.x + (-u_xlat16_47);
    u_xlat16_3.x = _RimAlpha * u_xlat16_9.x + u_xlat16_47;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_4.x = u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat15.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat15.xyz = _RimColor.xyz * u_xlat15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.yzw = _RimColor.xyz * u_xlat15.xyz + (-u_xlat16_0.xyz);
    u_xlat16_3.yzw = _RimColor.xyz;
    u_xlat16_3 = (bool(u_xlatb1)) ? u_xlat16_4 : u_xlat16_3;
    u_xlat16_0.xyz = u_xlat16_3.yzw * u_xlat16_3.xxx + u_xlat16_0.xyz;
    u_xlat16_39 = _RimAlpha * u_xlat16_3.x + u_xlat16_39;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_14.x = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_47 = u_xlat16_14.x * u_xlat16_1.x;
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Power;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Intensity;
    u_xlat16_9.xyz = vec3(u_xlat16_47) * _Glint_Color.xyz;
    u_xlat16_9.xyz = u_xlat16_14.yyy * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_SD);
#else
    u_xlatb1 = 0.5<_EFF_SD;
#endif
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_8.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = (bool(u_xlatb1)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_47 = u_xlat16_14.y * u_xlat16_47;
    SV_Target0.w = _Glint_Alpha * u_xlat16_47 + u_xlat16_39;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_LEILA);
#else
    u_xlatb1 = 0.5<_EFF_LEILA;
#endif
    if(u_xlatb1){
        u_xlat16_1.x = texture(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_39 = u_xlat16_2.x * _FluAnimMapParaIntensity;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_39);
        u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz;
        u_xlat16_0.xyz = u_xlat16_8.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _SpecularTex;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _FluAnimMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
lowp float u_xlat10_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec2 u_xlat16_13;
lowp vec2 u_xlat10_14;
vec3 u_xlat15;
vec3 u_xlat16;
ivec2 u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
bool u_xlatb30;
mediump float u_xlat16_39;
float u_xlat40;
bool u_xlatb40;
bool u_xlatb43;
mediump float u_xlat16_47;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_3 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex1, u_xlat16.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat10_6 = texture2D(_DecalsTex2, u_xlat5.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_7 = texture2D(_DecalsTex3, u_xlat16.xy);
    u_xlat10_5 = texture2D(_DecalsTex4, u_xlat5.zw);
    u_xlat16.x = u_xlat10_3 * u_xlat10_4.w;
    u_xlat4.xyz = u_xlat10_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16.xyz = u_xlat16.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat10_3 * u_xlat10_6.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat10_6.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_7.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat10_7.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_5.w;
    u_xlat5.xyz = (-u_xlat16.xyz) + u_xlat10_5.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat16.xyz;
    u_xlat4.x = max(u_xlat10_5.w, u_xlat10_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_4.w);
    u_xlat3 = u_xlat10_3 * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati17.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati17.x : u_xlati17.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
    u_xlatb5.x = 0.0<_UseMask4;
    u_xlatb43 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb30 = u_xlatb4.z || u_xlatb43;
    u_xlatb17 = u_xlatb4.y || u_xlatb30;
    u_xlatb4.x = u_xlatb4.x || u_xlatb17;
    if(u_xlatb4.x){
        u_xlat10_4 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat16.xyz + (-u_xlat10_4.xyz);
        u_xlat16.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat10_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat10_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat16.xyz = (-u_xlat10_2.xyz) + u_xlat16.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat16.xyz + u_xlat10_2.xyz;
    u_xlat16_13.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_13.xy = u_xlat10_1.ww * u_xlat16_13.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_13.xxx * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_13.x = max(u_xlat10_2.z, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    u_xlat16_39 = u_xlat10_1.x * u_xlat10_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_39 * u_xlat16_39 + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat40 = u_xlat16_39 * 4.0 + 2.0;
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat40 = u_xlat16_39 * u_xlat40;
    u_xlat1.x = u_xlat40 / u_xlat1.x;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat10_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat10_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_13.yyy + u_xlat16_11.xyz;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_11.xyz = u_xlat16_8.xyz * u_xlat16_13.xxx;
    u_xlat16_12.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_9.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_39 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_9.xyz = vec3(u_xlat16_39) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_9.xyz = u_xlat10_1.xxx * u_xlat16_9.xyz + u_xlat16_0.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat10_1.yyy * u_xlat16_10.xyz + u_xlat16_9.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_10.xyz + u_xlat16_9.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    u_xlatb1 = _Flu_UV==2.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_1.x = texture2D(_Flu_Mask, u_xlat1.xy).x;
    u_xlat10_14.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlatb40 = _Flu_Intensity==0.0;
    u_xlat16_39 = (u_xlatb40) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_39) * vs_TEXCOORD6.xy;
    u_xlat10_2.xyz = texture2D(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_9.xyz = u_xlat10_2.xyz * _Flu_Color.xyz;
    u_xlat16_9.xyz = u_xlat10_1.xxx * u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_9.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_39 = u_xlat10_1.x * u_xlat10_2.x;
    u_xlat16_39 = u_xlat16_39 * _FluAlpha;
    u_xlat16_39 = u_xlat10_2.w * _Link + u_xlat16_39;
    u_xlat16_47 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _RimPower;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlatb1 = _UseRimRange>=0.5;
    u_xlat16_9.x = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
    u_xlat16_22 = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat40 = (-u_xlat16_9.x) + u_xlat16_22;
    u_xlat15.x = u_xlat16_47 + (-u_xlat16_9.x);
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat15.x = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat16_47 = (u_xlatb1) ? u_xlat40 : u_xlat16_47;
    u_xlat16_47 = u_xlat16_47 * _RimIntensity;
    u_xlat16_47 = u_xlat10_14.x * u_xlat16_47;
    u_xlat16_9.x = float(1.0) / _RimOffset;
    u_xlat16_9.x = u_xlat16_47 * u_xlat16_9.x;
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
    u_xlat16_22 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_22 * u_xlat16_9.x + (-u_xlat16_47);
    u_xlat16_3.x = _RimAlpha * u_xlat16_9.x + u_xlat16_47;
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
    u_xlat16_4.x = u_xlat16_3.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat15.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat15.xyz = _RimColor.xyz * u_xlat15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.yzw = _RimColor.xyz * u_xlat15.xyz + (-u_xlat16_0.xyz);
    u_xlat16_3.yzw = _RimColor.xyz;
    u_xlat16_3 = (bool(u_xlatb1)) ? u_xlat16_4 : u_xlat16_3;
    u_xlat16_0.xyz = u_xlat16_3.yzw * u_xlat16_3.xxx + u_xlat16_0.xyz;
    u_xlat16_39 = _RimAlpha * u_xlat16_3.x + u_xlat16_39;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_14.x = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_47 = u_xlat10_14.x * u_xlat10_1.x;
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Power;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Intensity;
    u_xlat16_9.xyz = vec3(u_xlat16_47) * _Glint_Color.xyz;
    u_xlat16_9.xyz = u_xlat10_14.yyy * u_xlat16_9.xyz;
    u_xlatb1 = 0.5<_EFF_SD;
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_8.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = (bool(u_xlatb1)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_47 = u_xlat10_14.y * u_xlat16_47;
    SV_Target0.w = _Glint_Alpha * u_xlat16_47 + u_xlat16_39;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_9.xyz;
    u_xlatb1 = 0.5<_EFF_LEILA;
    if(u_xlatb1){
        u_xlat10_1.x = texture2D(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_39 = u_xlat10_2.x * _FluAnimMapParaIntensity;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_39);
        u_xlat16_8.xyz = u_xlat10_1.xxx * u_xlat16_8.xyz;
        u_xlat16_0.xyz = u_xlat16_8.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _SpecularTex;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _FluAnimMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
lowp float u_xlat10_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec2 u_xlat16_13;
lowp vec2 u_xlat10_14;
vec3 u_xlat15;
vec3 u_xlat16;
ivec2 u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
bool u_xlatb30;
mediump float u_xlat16_39;
float u_xlat40;
bool u_xlatb40;
bool u_xlatb43;
mediump float u_xlat16_47;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_3 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex1, u_xlat16.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat10_6 = texture2D(_DecalsTex2, u_xlat5.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_7 = texture2D(_DecalsTex3, u_xlat16.xy);
    u_xlat10_5 = texture2D(_DecalsTex4, u_xlat5.zw);
    u_xlat16.x = u_xlat10_3 * u_xlat10_4.w;
    u_xlat4.xyz = u_xlat10_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16.xyz = u_xlat16.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat10_3 * u_xlat10_6.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat10_6.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_7.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat10_7.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_5.w;
    u_xlat5.xyz = (-u_xlat16.xyz) + u_xlat10_5.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat16.xyz;
    u_xlat4.x = max(u_xlat10_5.w, u_xlat10_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_4.w);
    u_xlat3 = u_xlat10_3 * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati17.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati17.x : u_xlati17.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
    u_xlatb5.x = 0.0<_UseMask4;
    u_xlatb43 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb30 = u_xlatb4.z || u_xlatb43;
    u_xlatb17 = u_xlatb4.y || u_xlatb30;
    u_xlatb4.x = u_xlatb4.x || u_xlatb17;
    if(u_xlatb4.x){
        u_xlat10_4 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat16.xyz + (-u_xlat10_4.xyz);
        u_xlat16.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat10_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat10_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat16.xyz = (-u_xlat10_2.xyz) + u_xlat16.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat16.xyz + u_xlat10_2.xyz;
    u_xlat16_13.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_13.xy = u_xlat10_1.ww * u_xlat16_13.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_13.xxx * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_13.x = max(u_xlat10_2.z, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    u_xlat16_39 = u_xlat10_1.x * u_xlat10_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_39 * u_xlat16_39 + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat40 = u_xlat16_39 * 4.0 + 2.0;
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat40 = u_xlat16_39 * u_xlat40;
    u_xlat1.x = u_xlat40 / u_xlat1.x;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat10_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat10_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_13.yyy + u_xlat16_11.xyz;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_11.xyz = u_xlat16_8.xyz * u_xlat16_13.xxx;
    u_xlat16_12.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_9.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_39 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_9.xyz = vec3(u_xlat16_39) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_9.xyz = u_xlat10_1.xxx * u_xlat16_9.xyz + u_xlat16_0.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat10_1.yyy * u_xlat16_10.xyz + u_xlat16_9.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_10.xyz + u_xlat16_9.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    u_xlatb1 = _Flu_UV==2.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_1.x = texture2D(_Flu_Mask, u_xlat1.xy).x;
    u_xlat10_14.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlatb40 = _Flu_Intensity==0.0;
    u_xlat16_39 = (u_xlatb40) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_39) * vs_TEXCOORD6.xy;
    u_xlat10_2.xyz = texture2D(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_9.xyz = u_xlat10_2.xyz * _Flu_Color.xyz;
    u_xlat16_9.xyz = u_xlat10_1.xxx * u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_9.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_39 = u_xlat10_1.x * u_xlat10_2.x;
    u_xlat16_39 = u_xlat16_39 * _FluAlpha;
    u_xlat16_39 = u_xlat10_2.w * _Link + u_xlat16_39;
    u_xlat16_47 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _RimPower;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlatb1 = _UseRimRange>=0.5;
    u_xlat16_9.x = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
    u_xlat16_22 = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat40 = (-u_xlat16_9.x) + u_xlat16_22;
    u_xlat15.x = u_xlat16_47 + (-u_xlat16_9.x);
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat15.x = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat16_47 = (u_xlatb1) ? u_xlat40 : u_xlat16_47;
    u_xlat16_47 = u_xlat16_47 * _RimIntensity;
    u_xlat16_47 = u_xlat10_14.x * u_xlat16_47;
    u_xlat16_9.x = float(1.0) / _RimOffset;
    u_xlat16_9.x = u_xlat16_47 * u_xlat16_9.x;
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
    u_xlat16_22 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_22 * u_xlat16_9.x + (-u_xlat16_47);
    u_xlat16_3.x = _RimAlpha * u_xlat16_9.x + u_xlat16_47;
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
    u_xlat16_4.x = u_xlat16_3.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat15.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat15.xyz = _RimColor.xyz * u_xlat15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.yzw = _RimColor.xyz * u_xlat15.xyz + (-u_xlat16_0.xyz);
    u_xlat16_3.yzw = _RimColor.xyz;
    u_xlat16_3 = (bool(u_xlatb1)) ? u_xlat16_4 : u_xlat16_3;
    u_xlat16_0.xyz = u_xlat16_3.yzw * u_xlat16_3.xxx + u_xlat16_0.xyz;
    u_xlat16_39 = _RimAlpha * u_xlat16_3.x + u_xlat16_39;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_14.x = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_47 = u_xlat10_14.x * u_xlat10_1.x;
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Power;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Intensity;
    u_xlat16_9.xyz = vec3(u_xlat16_47) * _Glint_Color.xyz;
    u_xlat16_9.xyz = u_xlat10_14.yyy * u_xlat16_9.xyz;
    u_xlatb1 = 0.5<_EFF_SD;
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_8.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = (bool(u_xlatb1)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_47 = u_xlat10_14.y * u_xlat16_47;
    SV_Target0.w = _Glint_Alpha * u_xlat16_47 + u_xlat16_39;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_9.xyz;
    u_xlatb1 = 0.5<_EFF_LEILA;
    if(u_xlatb1){
        u_xlat10_1.x = texture2D(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_39 = u_xlat10_2.x * _FluAnimMapParaIntensity;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_39);
        u_xlat16_8.xyz = u_xlat10_1.xxx * u_xlat16_8.xyz;
        u_xlat16_0.xyz = u_xlat16_8.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
void main()
{
    u_xlat16_0 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_8 = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_2 = texture(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_DecalsTex3, u_xlat16.xy);
    u_xlat16_3 = texture(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat16_8 * u_xlat16_2.w;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat16_8 * u_xlat16_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat16_3.w, u_xlat16_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_2.w);
    u_xlat8.x = u_xlat16_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(0.0<_UseMask4);
#else
    u_xlatb16.x = 0.0<_UseMask4;
#endif
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat16_3 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat16_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat16_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat16_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat16_0 * u_xlat16_6.x + 1.0;
    SV_Target0.w = u_xlat16_1.w * _Link;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xy = texture(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat16_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat16_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xyz = texture(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat16_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
void main()
{
    u_xlat16_0 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_8 = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_2 = texture(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_DecalsTex3, u_xlat16.xy);
    u_xlat16_3 = texture(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat16_8 * u_xlat16_2.w;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat16_8 * u_xlat16_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat16_3.w, u_xlat16_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_2.w);
    u_xlat8.x = u_xlat16_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(0.0<_UseMask4);
#else
    u_xlatb16.x = 0.0<_UseMask4;
#endif
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat16_3 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat16_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat16_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat16_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat16_0 * u_xlat16_6.x + 1.0;
    SV_Target0.w = u_xlat16_1.w * _Link;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xy = texture(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat16_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat16_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xyz = texture(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat16_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
bvec3 u_xlatb4;
lowp vec4 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
lowp float u_xlat10_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
void main()
{
    u_xlat10_0 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_8 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_2 = texture2D(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_5 = texture2D(_DecalsTex3, u_xlat16.xy);
    u_xlat10_3 = texture2D(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat10_8 * u_xlat10_2.w;
    u_xlat2.xyz = u_xlat10_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat10_8 * u_xlat10_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat10_3.w, u_xlat10_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_2.w);
    u_xlat8.x = u_xlat10_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
    u_xlatb16.x = 0.0<_UseMask4;
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat10_3 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat10_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat10_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat10_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat10_0 * u_xlat16_6.x + 1.0;
    SV_Target0.w = u_xlat10_1.w * _Link;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat10_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat10_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xyz = texture2D(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat10_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
bvec3 u_xlatb4;
lowp vec4 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
lowp float u_xlat10_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
void main()
{
    u_xlat10_0 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_8 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_2 = texture2D(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_5 = texture2D(_DecalsTex3, u_xlat16.xy);
    u_xlat10_3 = texture2D(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat10_8 * u_xlat10_2.w;
    u_xlat2.xyz = u_xlat10_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat10_8 * u_xlat10_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat10_3.w, u_xlat10_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_2.w);
    u_xlat8.x = u_xlat10_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
    u_xlatb16.x = 0.0<_UseMask4;
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat10_3 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat10_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat10_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat10_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat10_0 * u_xlat16_6.x + 1.0;
    SV_Target0.w = u_xlat10_1.w * _Link;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat10_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat10_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xyz = texture2D(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat10_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
float u_xlat17;
mediump float u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat25;
mediump float u_xlat16_30;
void main()
{
    u_xlat16_0 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_8 = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_2 = texture(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_DecalsTex3, u_xlat16.xy);
    u_xlat16_3 = texture(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat16_8 * u_xlat16_2.w;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat16_8 * u_xlat16_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat16_3.w, u_xlat16_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_2.w);
    u_xlat8.x = u_xlat16_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(0.0<_UseMask4);
#else
    u_xlatb16.x = 0.0<_UseMask4;
#endif
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat16_3 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat16_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat16_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat16_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat16_0 * u_xlat16_6.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Flu_UV==2.0);
#else
    u_xlatb0 = _Flu_UV==2.0;
#endif
    u_xlat1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_Flu_Mask, u_xlat1.xy).x;
    u_xlat16_1.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb17 = _Flu_Intensity==0.0;
#endif
    u_xlat16_14.x = (u_xlatb17) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = u_xlat16_14.xx * vs_TEXCOORD6.xy;
    u_xlat16_17 = texture(_Flu_Tex, u_xlat2.xy).x;
    u_xlat16_14.x = u_xlat16_0 * u_xlat16_17;
    u_xlat16_14.x = u_xlat16_14.x * _FluAlpha;
    u_xlat16_14.x = u_xlat16_1.w * _Link + u_xlat16_14.x;
    u_xlat16_22 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _RimPower;
    u_xlat16_22 = exp2(u_xlat16_22);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseRimRange>=0.5);
#else
    u_xlatb0 = _UseRimRange>=0.5;
#endif
    u_xlat16_30 = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_7.x = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat17 = (-u_xlat16_30) + u_xlat16_7.x;
    u_xlat25 = (-u_xlat16_30) + u_xlat16_22;
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
    u_xlat16_22 = (u_xlatb0) ? u_xlat17 : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * _RimIntensity;
    u_xlat16_22 = u_xlat16_1.x * u_xlat16_22;
    u_xlat16_30 = float(1.0) / _RimOffset;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_7.x * u_xlat16_30 + (-u_xlat16_22);
    u_xlat16_22 = _RimAlpha * u_xlat16_30 + u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb0 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_30 = u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_22 = (u_xlatb0) ? u_xlat16_30 : u_xlat16_22;
    u_xlat16_14.x = _RimAlpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat16_0 = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_22 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Power;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Intensity;
    u_xlat16_22 = u_xlat16_1.y * u_xlat16_22;
    SV_Target0.w = _Glint_Alpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xy = texture(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat16_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat16_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xyz = texture(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat16_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
float u_xlat17;
mediump float u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat25;
mediump float u_xlat16_30;
void main()
{
    u_xlat16_0 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_8 = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_2 = texture(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_DecalsTex3, u_xlat16.xy);
    u_xlat16_3 = texture(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat16_8 * u_xlat16_2.w;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat16_8 * u_xlat16_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat16_3.w, u_xlat16_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_2.w);
    u_xlat8.x = u_xlat16_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(0.0<_UseMask4);
#else
    u_xlatb16.x = 0.0<_UseMask4;
#endif
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat16_3 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat16_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat16_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat16_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat16_0 * u_xlat16_6.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Flu_UV==2.0);
#else
    u_xlatb0 = _Flu_UV==2.0;
#endif
    u_xlat1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_Flu_Mask, u_xlat1.xy).x;
    u_xlat16_1.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb17 = _Flu_Intensity==0.0;
#endif
    u_xlat16_14.x = (u_xlatb17) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = u_xlat16_14.xx * vs_TEXCOORD6.xy;
    u_xlat16_17 = texture(_Flu_Tex, u_xlat2.xy).x;
    u_xlat16_14.x = u_xlat16_0 * u_xlat16_17;
    u_xlat16_14.x = u_xlat16_14.x * _FluAlpha;
    u_xlat16_14.x = u_xlat16_1.w * _Link + u_xlat16_14.x;
    u_xlat16_22 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _RimPower;
    u_xlat16_22 = exp2(u_xlat16_22);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseRimRange>=0.5);
#else
    u_xlatb0 = _UseRimRange>=0.5;
#endif
    u_xlat16_30 = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_7.x = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat17 = (-u_xlat16_30) + u_xlat16_7.x;
    u_xlat25 = (-u_xlat16_30) + u_xlat16_22;
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
    u_xlat16_22 = (u_xlatb0) ? u_xlat17 : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * _RimIntensity;
    u_xlat16_22 = u_xlat16_1.x * u_xlat16_22;
    u_xlat16_30 = float(1.0) / _RimOffset;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_7.x * u_xlat16_30 + (-u_xlat16_22);
    u_xlat16_22 = _RimAlpha * u_xlat16_30 + u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb0 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_30 = u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_22 = (u_xlatb0) ? u_xlat16_30 : u_xlat16_22;
    u_xlat16_14.x = _RimAlpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat16_0 = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_22 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Power;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Intensity;
    u_xlat16_22 = u_xlat16_1.y * u_xlat16_22;
    SV_Target0.w = _Glint_Alpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xy = texture(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat16_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat16_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xyz = texture(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat16_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
bvec3 u_xlatb4;
lowp vec4 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
lowp float u_xlat10_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
float u_xlat17;
lowp float u_xlat10_17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat25;
mediump float u_xlat16_30;
void main()
{
    u_xlat10_0 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_8 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_2 = texture2D(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_5 = texture2D(_DecalsTex3, u_xlat16.xy);
    u_xlat10_3 = texture2D(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat10_8 * u_xlat10_2.w;
    u_xlat2.xyz = u_xlat10_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat10_8 * u_xlat10_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat10_3.w, u_xlat10_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_2.w);
    u_xlat8.x = u_xlat10_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
    u_xlatb16.x = 0.0<_UseMask4;
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat10_3 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat10_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat10_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat10_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat10_0 * u_xlat16_6.x + 1.0;
    u_xlatb0 = _Flu_UV==2.0;
    u_xlat1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_Flu_Mask, u_xlat1.xy).x;
    u_xlat10_1.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlatb17 = _Flu_Intensity==0.0;
    u_xlat16_14.x = (u_xlatb17) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = u_xlat16_14.xx * vs_TEXCOORD6.xy;
    u_xlat10_17 = texture2D(_Flu_Tex, u_xlat2.xy).x;
    u_xlat16_14.x = u_xlat10_0 * u_xlat10_17;
    u_xlat16_14.x = u_xlat16_14.x * _FluAlpha;
    u_xlat16_14.x = u_xlat10_1.w * _Link + u_xlat16_14.x;
    u_xlat16_22 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _RimPower;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlatb0 = _UseRimRange>=0.5;
    u_xlat16_30 = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_7.x = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat17 = (-u_xlat16_30) + u_xlat16_7.x;
    u_xlat25 = (-u_xlat16_30) + u_xlat16_22;
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat25 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
    u_xlat16_22 = (u_xlatb0) ? u_xlat17 : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * _RimIntensity;
    u_xlat16_22 = u_xlat10_1.x * u_xlat16_22;
    u_xlat16_30 = float(1.0) / _RimOffset;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_22;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_7.x * u_xlat16_30 + (-u_xlat16_22);
    u_xlat16_22 = _RimAlpha * u_xlat16_30 + u_xlat16_22;
    u_xlatb0 = 0.5<_HeroFluNewRimMode;
    u_xlat16_30 = u_xlat16_22;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_22 = (u_xlatb0) ? u_xlat16_30 : u_xlat16_22;
    u_xlat16_14.x = _RimAlpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat10_0 = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_22 = u_xlat10_0 * u_xlat10_1.x;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Power;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Intensity;
    u_xlat16_22 = u_xlat10_1.y * u_xlat16_22;
    SV_Target0.w = _Glint_Alpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat10_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat10_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xyz = texture2D(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat10_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
bvec3 u_xlatb4;
lowp vec4 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
lowp float u_xlat10_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
float u_xlat17;
lowp float u_xlat10_17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat25;
mediump float u_xlat16_30;
void main()
{
    u_xlat10_0 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_8 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_2 = texture2D(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_5 = texture2D(_DecalsTex3, u_xlat16.xy);
    u_xlat10_3 = texture2D(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat10_8 * u_xlat10_2.w;
    u_xlat2.xyz = u_xlat10_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat10_8 * u_xlat10_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat10_3.w, u_xlat10_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_2.w);
    u_xlat8.x = u_xlat10_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
    u_xlatb16.x = 0.0<_UseMask4;
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat10_3 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat10_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat10_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat10_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat10_0 * u_xlat16_6.x + 1.0;
    u_xlatb0 = _Flu_UV==2.0;
    u_xlat1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_Flu_Mask, u_xlat1.xy).x;
    u_xlat10_1.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlatb17 = _Flu_Intensity==0.0;
    u_xlat16_14.x = (u_xlatb17) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = u_xlat16_14.xx * vs_TEXCOORD6.xy;
    u_xlat10_17 = texture2D(_Flu_Tex, u_xlat2.xy).x;
    u_xlat16_14.x = u_xlat10_0 * u_xlat10_17;
    u_xlat16_14.x = u_xlat16_14.x * _FluAlpha;
    u_xlat16_14.x = u_xlat10_1.w * _Link + u_xlat16_14.x;
    u_xlat16_22 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _RimPower;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlatb0 = _UseRimRange>=0.5;
    u_xlat16_30 = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_7.x = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat17 = (-u_xlat16_30) + u_xlat16_7.x;
    u_xlat25 = (-u_xlat16_30) + u_xlat16_22;
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat25 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
    u_xlat16_22 = (u_xlatb0) ? u_xlat17 : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * _RimIntensity;
    u_xlat16_22 = u_xlat10_1.x * u_xlat16_22;
    u_xlat16_30 = float(1.0) / _RimOffset;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_22;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_7.x * u_xlat16_30 + (-u_xlat16_22);
    u_xlat16_22 = _RimAlpha * u_xlat16_30 + u_xlat16_22;
    u_xlatb0 = 0.5<_HeroFluNewRimMode;
    u_xlat16_30 = u_xlat16_22;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_22 = (u_xlatb0) ? u_xlat16_30 : u_xlat16_22;
    u_xlat16_14.x = _RimAlpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat10_0 = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_22 = u_xlat10_0 * u_xlat10_1.x;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Power;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Intensity;
    u_xlat16_22 = u_xlat10_1.y * u_xlat16_22;
    SV_Target0.w = _Glint_Alpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat10_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat10_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xyz = texture2D(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat10_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_5;
float u_xlat9;
mediump float u_xlat16_11;
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
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = max(u_xlat16_11, 6.10351563e-05);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_5 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_5) * u_xlat16_2.xz;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(9) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
UNITY_LOCATION(11) uniform mediump sampler2D _EffMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
vec3 u_xlat15;
ivec2 u_xlati16;
bool u_xlatb16;
bool u_xlatb28;
mediump float u_xlat16_36;
float u_xlat37;
bool u_xlatb40;
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
    u_xlat16_3 = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat15.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex1, u_xlat15.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat16_6 = texture(_DecalsTex2, u_xlat5.xy);
    u_xlat15.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat15.xy = u_xlat15.xy + u_xlat15.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat16_7 = texture(_DecalsTex3, u_xlat15.xy);
    u_xlat16_5 = texture(_DecalsTex4, u_xlat5.zw);
    u_xlat15.x = u_xlat16_3 * u_xlat16_4.w;
    u_xlat4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = u_xlat15.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat16_3 * u_xlat16_6.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat16_6.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat16_3 * u_xlat16_7.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat16_7.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat16_3 * u_xlat16_5.w;
    u_xlat5.xyz = (-u_xlat15.xyz) + u_xlat16_5.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlat4.x = max(u_xlat16_5.w, u_xlat16_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_4.w);
    u_xlat3 = u_xlat16_3 * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati16.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati16.x : u_xlati16.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5.x = !!(0.0<_UseMask4);
#else
    u_xlatb5.x = 0.0<_UseMask4;
#endif
    u_xlatb40 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb28 = u_xlatb4.z || u_xlatb40;
    u_xlatb16 = u_xlatb4.y || u_xlatb28;
    u_xlatb4.x = u_xlatb4.x || u_xlatb16;
    if(u_xlatb4.x){
        u_xlat16_4 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat15.xyz + (-u_xlat16_4.xyz);
        u_xlat15.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat16_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat16_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat15.xyz = (-u_xlat16_2.xyz) + u_xlat15.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat15.xyz + u_xlat16_2.xyz;
    u_xlat16_12.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_12.xy = u_xlat16_1.ww * u_xlat16_12.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_12.xxx * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_12.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_12.x = max(u_xlat16_2.z, u_xlat16_12.x);
    u_xlat16_12.x = (-u_xlat16_12.x) + 1.0;
    u_xlat16_36 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_36 * u_xlat16_36 + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat37 = u_xlat16_36 * 4.0 + 2.0;
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat37 = u_xlat16_36 * u_xlat37;
    u_xlat1.x = u_xlat37 / u_xlat1.x;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_12.yyy + u_xlat16_11.xyz;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_12.xxx;
    u_xlat16_11.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_36 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_8.xyz = vec3(u_xlat16_36) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz + u_xlat16_0.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_8.xyz = u_xlat16_1.yyy * u_xlat16_9.xyz + u_xlat16_8.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_9.xyz + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    }
    SV_Target0.w = u_xlat16_2.w * _Link;
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_8.xyz + u_xlat16_0.xyz;
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
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_5;
float u_xlat9;
mediump float u_xlat16_11;
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
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = max(u_xlat16_11, 6.10351563e-05);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_5 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_5) * u_xlat16_2.xz;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(9) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
UNITY_LOCATION(11) uniform mediump sampler2D _EffMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
vec3 u_xlat15;
ivec2 u_xlati16;
bool u_xlatb16;
bool u_xlatb28;
mediump float u_xlat16_36;
float u_xlat37;
bool u_xlatb40;
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
    u_xlat16_3 = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat15.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex1, u_xlat15.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat16_6 = texture(_DecalsTex2, u_xlat5.xy);
    u_xlat15.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat15.xy = u_xlat15.xy + u_xlat15.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat16_7 = texture(_DecalsTex3, u_xlat15.xy);
    u_xlat16_5 = texture(_DecalsTex4, u_xlat5.zw);
    u_xlat15.x = u_xlat16_3 * u_xlat16_4.w;
    u_xlat4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = u_xlat15.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat16_3 * u_xlat16_6.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat16_6.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat16_3 * u_xlat16_7.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat16_7.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat16_3 * u_xlat16_5.w;
    u_xlat5.xyz = (-u_xlat15.xyz) + u_xlat16_5.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlat4.x = max(u_xlat16_5.w, u_xlat16_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_4.w);
    u_xlat3 = u_xlat16_3 * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati16.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati16.x : u_xlati16.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5.x = !!(0.0<_UseMask4);
#else
    u_xlatb5.x = 0.0<_UseMask4;
#endif
    u_xlatb40 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb28 = u_xlatb4.z || u_xlatb40;
    u_xlatb16 = u_xlatb4.y || u_xlatb28;
    u_xlatb4.x = u_xlatb4.x || u_xlatb16;
    if(u_xlatb4.x){
        u_xlat16_4 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat15.xyz + (-u_xlat16_4.xyz);
        u_xlat15.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat16_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat16_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat15.xyz = (-u_xlat16_2.xyz) + u_xlat15.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat15.xyz + u_xlat16_2.xyz;
    u_xlat16_12.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_12.xy = u_xlat16_1.ww * u_xlat16_12.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_12.xxx * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_12.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_12.x = max(u_xlat16_2.z, u_xlat16_12.x);
    u_xlat16_12.x = (-u_xlat16_12.x) + 1.0;
    u_xlat16_36 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_36 * u_xlat16_36 + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat37 = u_xlat16_36 * 4.0 + 2.0;
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat37 = u_xlat16_36 * u_xlat37;
    u_xlat1.x = u_xlat37 / u_xlat1.x;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_12.yyy + u_xlat16_11.xyz;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_12.xxx;
    u_xlat16_11.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_36 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_8.xyz = vec3(u_xlat16_36) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz + u_xlat16_0.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_8.xyz = u_xlat16_1.yyy * u_xlat16_9.xyz + u_xlat16_8.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_9.xyz + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    }
    SV_Target0.w = u_xlat16_2.w * _Link;
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_8.xyz + u_xlat16_0.xyz;
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
varying mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_5;
float u_xlat9;
mediump float u_xlat16_11;
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
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = max(u_xlat16_11, 6.10351563e-05);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_5 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_5) * u_xlat16_2.xz;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _SpecularTex;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
uniform lowp sampler2D _EffMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
vec3 u_xlat15;
ivec2 u_xlati16;
bool u_xlatb16;
bool u_xlatb28;
mediump float u_xlat16_36;
float u_xlat37;
bool u_xlatb40;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_3 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat15.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex1, u_xlat15.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat10_6 = texture2D(_DecalsTex2, u_xlat5.xy);
    u_xlat15.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat15.xy = u_xlat15.xy + u_xlat15.xy;
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
    u_xlat10_7 = texture2D(_DecalsTex3, u_xlat15.xy);
    u_xlat10_5 = texture2D(_DecalsTex4, u_xlat5.zw);
    u_xlat15.x = u_xlat10_3 * u_xlat10_4.w;
    u_xlat4.xyz = u_xlat10_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = u_xlat15.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat10_3 * u_xlat10_6.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat10_6.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_7.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat10_7.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_5.w;
    u_xlat5.xyz = (-u_xlat15.xyz) + u_xlat10_5.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlat4.x = max(u_xlat10_5.w, u_xlat10_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_4.w);
    u_xlat3 = u_xlat10_3 * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati16.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati16.x : u_xlati16.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
    u_xlatb5.x = 0.0<_UseMask4;
    u_xlatb40 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb28 = u_xlatb4.z || u_xlatb40;
    u_xlatb16 = u_xlatb4.y || u_xlatb28;
    u_xlatb4.x = u_xlatb4.x || u_xlatb16;
    if(u_xlatb4.x){
        u_xlat10_4 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat15.xyz + (-u_xlat10_4.xyz);
        u_xlat15.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat10_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat10_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat15.xyz = (-u_xlat10_2.xyz) + u_xlat15.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat15.xyz + u_xlat10_2.xyz;
    u_xlat16_12.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_12.xy = u_xlat10_1.ww * u_xlat16_12.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_12.xxx * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_12.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_12.x = max(u_xlat10_2.z, u_xlat16_12.x);
    u_xlat16_12.x = (-u_xlat16_12.x) + 1.0;
    u_xlat16_36 = u_xlat10_1.x * u_xlat10_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_36 * u_xlat16_36 + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat37 = u_xlat16_36 * 4.0 + 2.0;
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat37 = u_xlat16_36 * u_xlat37;
    u_xlat1.x = u_xlat37 / u_xlat1.x;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat10_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat10_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_12.yyy + u_xlat16_11.xyz;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_12.xxx;
    u_xlat16_11.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_36 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_8.xyz = vec3(u_xlat16_36) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_8.xyz = u_xlat10_1.xxx * u_xlat16_8.xyz + u_xlat16_0.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_8.xyz = u_xlat10_1.yyy * u_xlat16_9.xyz + u_xlat16_8.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_9.xyz + u_xlat16_8.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    SV_Target0.w = u_xlat10_2.w * _Link;
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_8.xyz + u_xlat16_0.xyz;
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
varying mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_5;
float u_xlat9;
mediump float u_xlat16_11;
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
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = max(u_xlat16_11, 6.10351563e-05);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot((-u_xlat0.xyz), u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat1.xyz * (-u_xlat16_2.xxx) + (-u_xlat0.xyz);
    vs_TEXCOORD4.y = u_xlat16_2.y;
    u_xlat16_5 = _HeroBattleLightDir.w * _TopHelpBox;
    vs_TEXCOORD4.xz = vec2(u_xlat16_5) * u_xlat16_2.xz;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _SpecularTex;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
uniform lowp sampler2D _EffMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
vec3 u_xlat15;
ivec2 u_xlati16;
bool u_xlatb16;
bool u_xlatb28;
mediump float u_xlat16_36;
float u_xlat37;
bool u_xlatb40;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_3 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat15.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex1, u_xlat15.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat10_6 = texture2D(_DecalsTex2, u_xlat5.xy);
    u_xlat15.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat15.xy = u_xlat15.xy + u_xlat15.xy;
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
    u_xlat10_7 = texture2D(_DecalsTex3, u_xlat15.xy);
    u_xlat10_5 = texture2D(_DecalsTex4, u_xlat5.zw);
    u_xlat15.x = u_xlat10_3 * u_xlat10_4.w;
    u_xlat4.xyz = u_xlat10_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = u_xlat15.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat10_3 * u_xlat10_6.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat10_6.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_7.w;
    u_xlat6.xyz = (-u_xlat15.xyz) + u_xlat10_7.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat15.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_5.w;
    u_xlat5.xyz = (-u_xlat15.xyz) + u_xlat10_5.xyz;
    u_xlat15.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlat4.x = max(u_xlat10_5.w, u_xlat10_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_4.w);
    u_xlat3 = u_xlat10_3 * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati16.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati16.x : u_xlati16.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
    u_xlatb5.x = 0.0<_UseMask4;
    u_xlatb40 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb28 = u_xlatb4.z || u_xlatb40;
    u_xlatb16 = u_xlatb4.y || u_xlatb28;
    u_xlatb4.x = u_xlatb4.x || u_xlatb16;
    if(u_xlatb4.x){
        u_xlat10_4 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat15.xyz + (-u_xlat10_4.xyz);
        u_xlat15.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat10_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat10_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat15.xyz = (-u_xlat10_2.xyz) + u_xlat15.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat15.xyz + u_xlat10_2.xyz;
    u_xlat16_12.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_12.xy = u_xlat10_1.ww * u_xlat16_12.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_12.xxx * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_12.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_12.x = max(u_xlat10_2.z, u_xlat16_12.x);
    u_xlat16_12.x = (-u_xlat16_12.x) + 1.0;
    u_xlat16_36 = u_xlat10_1.x * u_xlat10_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_36 * u_xlat16_36 + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat37 = u_xlat16_36 * 4.0 + 2.0;
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat37 = u_xlat16_36 * u_xlat37;
    u_xlat1.x = u_xlat37 / u_xlat1.x;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat10_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat10_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_12.yyy + u_xlat16_11.xyz;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_12.xxx;
    u_xlat16_11.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_10.xyz * u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_8.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_36 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_8.xyz = vec3(u_xlat16_36) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_8.xyz = u_xlat10_1.xxx * u_xlat16_8.xyz + u_xlat16_0.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_8.xyz = u_xlat10_1.yyy * u_xlat16_9.xyz + u_xlat16_8.xyz;
        u_xlat16_9.xyz = vec3(u_xlat16_36) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_8.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_9.xyz + u_xlat16_8.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    SV_Target0.w = u_xlat10_2.w * _Link;
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_8.xyz + u_xlat16_0.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(9) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
UNITY_LOCATION(11) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(12) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(13) uniform mediump sampler2D _FluAnimMap;
UNITY_LOCATION(14) uniform mediump sampler2D _EffMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
ivec2 u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
bool u_xlatb30;
mediump float u_xlat16_39;
float u_xlat40;
bool u_xlatb40;
bool u_xlatb43;
mediump float u_xlat16_47;
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
    u_xlat16_3.x = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex1, u_xlat16.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat16_6 = texture(_DecalsTex2, u_xlat5.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_7 = texture(_DecalsTex3, u_xlat16.xy);
    u_xlat16_5 = texture(_DecalsTex4, u_xlat5.zw);
    u_xlat16.x = u_xlat16_3.x * u_xlat16_4.w;
    u_xlat4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16.xyz = u_xlat16.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat16_3.x * u_xlat16_6.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat16_6.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat16_3.x * u_xlat16_7.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat16_7.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat16_3.x * u_xlat16_5.w;
    u_xlat5.xyz = (-u_xlat16.xyz) + u_xlat16_5.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat16.xyz;
    u_xlat4.x = max(u_xlat16_5.w, u_xlat16_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_4.w);
    u_xlat3 = u_xlat16_3.x * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati17.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati17.x : u_xlati17.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5.x = !!(0.0<_UseMask4);
#else
    u_xlatb5.x = 0.0<_UseMask4;
#endif
    u_xlatb43 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb30 = u_xlatb4.z || u_xlatb43;
    u_xlatb17 = u_xlatb4.y || u_xlatb30;
    u_xlatb4.x = u_xlatb4.x || u_xlatb17;
    if(u_xlatb4.x){
        u_xlat16_4 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat16.xyz + (-u_xlat16_4.xyz);
        u_xlat16.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat16_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat16_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat16.xyz = (-u_xlat16_2.xyz) + u_xlat16.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat16.xyz + u_xlat16_2.xyz;
    u_xlat16_13.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_13.xy = u_xlat16_1.ww * u_xlat16_13.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_13.xxx * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_13.x = max(u_xlat16_2.z, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    u_xlat16_39 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_39 * u_xlat16_39 + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat40 = u_xlat16_39 * 4.0 + 2.0;
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat40 = u_xlat16_39 * u_xlat40;
    u_xlat1.x = u_xlat40 / u_xlat1.x;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_13.yyy + u_xlat16_11.xyz;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_11.xyz = u_xlat16_8.xyz * u_xlat16_13.xxx;
    u_xlat16_12.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_39 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_9.xyz = vec3(u_xlat16_39) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz + u_xlat16_0.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat16_1.yyy * u_xlat16_10.xyz + u_xlat16_9.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_10.xyz + u_xlat16_9.xyz;
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
    u_xlat16_14.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb40 = _Flu_Intensity==0.0;
#endif
    u_xlat16_39 = (u_xlatb40) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_39) * vs_TEXCOORD6.xy;
    u_xlat16_2.xyz = texture(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_2.xyz * _Flu_Color.xyz;
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_9.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_39 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_39 = u_xlat16_39 * _FluAlpha;
    u_xlat16_39 = u_xlat16_2.w * _Link + u_xlat16_39;
    u_xlat16_47 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _RimPower;
    u_xlat16_47 = exp2(u_xlat16_47);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_UseRimRange>=0.5);
#else
    u_xlatb1 = _UseRimRange>=0.5;
#endif
    u_xlat16_9.x = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_22 = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_9.x) + u_xlat16_22;
    u_xlat15.x = u_xlat16_47 + (-u_xlat16_9.x);
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat16_47 = (u_xlatb1) ? u_xlat40 : u_xlat16_47;
    u_xlat16_47 = u_xlat16_47 * _RimIntensity;
    u_xlat16_47 = u_xlat16_14.x * u_xlat16_47;
    u_xlat16_9.x = float(1.0) / _RimOffset;
    u_xlat16_9.x = u_xlat16_47 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_22 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_22 * u_xlat16_9.x + (-u_xlat16_47);
    u_xlat16_3.x = _RimAlpha * u_xlat16_9.x + u_xlat16_47;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_4.x = u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat15.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat15.xyz = _RimColor.xyz * u_xlat15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.yzw = _RimColor.xyz * u_xlat15.xyz + (-u_xlat16_0.xyz);
    u_xlat16_3.yzw = _RimColor.xyz;
    u_xlat16_3 = (bool(u_xlatb1)) ? u_xlat16_4 : u_xlat16_3;
    u_xlat16_0.xyz = u_xlat16_3.yzw * u_xlat16_3.xxx + u_xlat16_0.xyz;
    u_xlat16_39 = _RimAlpha * u_xlat16_3.x + u_xlat16_39;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_14.x = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_47 = u_xlat16_14.x * u_xlat16_1.x;
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Power;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Intensity;
    u_xlat16_9.xyz = vec3(u_xlat16_47) * _Glint_Color.xyz;
    u_xlat16_9.xyz = u_xlat16_14.yyy * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_SD);
#else
    u_xlatb1 = 0.5<_EFF_SD;
#endif
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_8.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = (bool(u_xlatb1)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_47 = u_xlat16_14.y * u_xlat16_47;
    SV_Target0.w = _Glint_Alpha * u_xlat16_47 + u_xlat16_39;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_LEILA);
#else
    u_xlatb1 = 0.5<_EFF_LEILA;
#endif
    if(u_xlatb1){
        u_xlat16_1.x = texture(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_39 = u_xlat16_2.x * _FluAnimMapParaIntensity;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_39);
        u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz;
        u_xlat16_0.xyz = u_xlat16_8.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
    }
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_8.xyz + u_xlat16_0.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _SpecularTex;
UNITY_LOCATION(9) uniform mediump samplerCube _EnvMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Crystal_CustomColorMask;
UNITY_LOCATION(11) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(12) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(13) uniform mediump sampler2D _FluAnimMap;
UNITY_LOCATION(14) uniform mediump sampler2D _EffMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
ivec2 u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
bool u_xlatb30;
mediump float u_xlat16_39;
float u_xlat40;
bool u_xlatb40;
bool u_xlatb43;
mediump float u_xlat16_47;
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
    u_xlat16_3.x = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex1, u_xlat16.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat16_6 = texture(_DecalsTex2, u_xlat5.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_7 = texture(_DecalsTex3, u_xlat16.xy);
    u_xlat16_5 = texture(_DecalsTex4, u_xlat5.zw);
    u_xlat16.x = u_xlat16_3.x * u_xlat16_4.w;
    u_xlat4.xyz = u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16.xyz = u_xlat16.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat16_3.x * u_xlat16_6.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat16_6.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat16_3.x * u_xlat16_7.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat16_7.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat16_3.x * u_xlat16_5.w;
    u_xlat5.xyz = (-u_xlat16.xyz) + u_xlat16_5.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat16.xyz;
    u_xlat4.x = max(u_xlat16_5.w, u_xlat16_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat16_4.w);
    u_xlat3 = u_xlat16_3.x * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati17.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati17.x : u_xlati17.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5.x = !!(0.0<_UseMask4);
#else
    u_xlatb5.x = 0.0<_UseMask4;
#endif
    u_xlatb43 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb30 = u_xlatb4.z || u_xlatb43;
    u_xlatb17 = u_xlatb4.y || u_xlatb30;
    u_xlatb4.x = u_xlatb4.x || u_xlatb17;
    if(u_xlatb4.x){
        u_xlat16_4 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat16.xyz + (-u_xlat16_4.xyz);
        u_xlat16.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat16_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat16_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat16.xyz = (-u_xlat16_2.xyz) + u_xlat16.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat16.xyz + u_xlat16_2.xyz;
    u_xlat16_13.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_13.xy = u_xlat16_1.ww * u_xlat16_13.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_13.xxx * u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_13.x = max(u_xlat16_2.z, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    u_xlat16_39 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_39 * u_xlat16_39 + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat40 = u_xlat16_39 * 4.0 + 2.0;
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat40 = u_xlat16_39 * u_xlat40;
    u_xlat1.x = u_xlat40 / u_xlat1.x;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_2.xyz + u_xlat16_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_13.yyy + u_xlat16_11.xyz;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_11.xyz = u_xlat16_8.xyz * u_xlat16_13.xxx;
    u_xlat16_12.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_39 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_9.xyz = vec3(u_xlat16_39) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz + u_xlat16_0.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat16_1.yyy * u_xlat16_10.xyz + u_xlat16_9.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_0.xyz = u_xlat16_1.zzz * u_xlat16_10.xyz + u_xlat16_9.xyz;
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
    u_xlat16_14.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb40 = _Flu_Intensity==0.0;
#endif
    u_xlat16_39 = (u_xlatb40) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_39) * vs_TEXCOORD6.xy;
    u_xlat16_2.xyz = texture(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_2.xyz * _Flu_Color.xyz;
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_9.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_39 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_39 = u_xlat16_39 * _FluAlpha;
    u_xlat16_39 = u_xlat16_2.w * _Link + u_xlat16_39;
    u_xlat16_47 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _RimPower;
    u_xlat16_47 = exp2(u_xlat16_47);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_UseRimRange>=0.5);
#else
    u_xlatb1 = _UseRimRange>=0.5;
#endif
    u_xlat16_9.x = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_22 = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_9.x) + u_xlat16_22;
    u_xlat15.x = u_xlat16_47 + (-u_xlat16_9.x);
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat15.x = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat16_47 = (u_xlatb1) ? u_xlat40 : u_xlat16_47;
    u_xlat16_47 = u_xlat16_47 * _RimIntensity;
    u_xlat16_47 = u_xlat16_14.x * u_xlat16_47;
    u_xlat16_9.x = float(1.0) / _RimOffset;
    u_xlat16_9.x = u_xlat16_47 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_22 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_22 * u_xlat16_9.x + (-u_xlat16_47);
    u_xlat16_3.x = _RimAlpha * u_xlat16_9.x + u_xlat16_47;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_4.x = u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat15.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat15.xyz = _RimColor.xyz * u_xlat15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.yzw = _RimColor.xyz * u_xlat15.xyz + (-u_xlat16_0.xyz);
    u_xlat16_3.yzw = _RimColor.xyz;
    u_xlat16_3 = (bool(u_xlatb1)) ? u_xlat16_4 : u_xlat16_3;
    u_xlat16_0.xyz = u_xlat16_3.yzw * u_xlat16_3.xxx + u_xlat16_0.xyz;
    u_xlat16_39 = _RimAlpha * u_xlat16_3.x + u_xlat16_39;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_14.x = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_47 = u_xlat16_14.x * u_xlat16_1.x;
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Power;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Intensity;
    u_xlat16_9.xyz = vec3(u_xlat16_47) * _Glint_Color.xyz;
    u_xlat16_9.xyz = u_xlat16_14.yyy * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_SD);
#else
    u_xlatb1 = 0.5<_EFF_SD;
#endif
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_8.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = (bool(u_xlatb1)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_47 = u_xlat16_14.y * u_xlat16_47;
    SV_Target0.w = _Glint_Alpha * u_xlat16_47 + u_xlat16_39;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_EFF_LEILA);
#else
    u_xlatb1 = 0.5<_EFF_LEILA;
#endif
    if(u_xlatb1){
        u_xlat16_1.x = texture(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_39 = u_xlat16_2.x * _FluAnimMapParaIntensity;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_39);
        u_xlat16_8.xyz = u_xlat16_1.xxx * u_xlat16_8.xyz;
        u_xlat16_0.xyz = u_xlat16_8.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
    }
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_8.xyz + u_xlat16_0.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _SpecularTex;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _FluAnimMap;
uniform lowp sampler2D _EffMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
lowp float u_xlat10_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec2 u_xlat16_13;
lowp vec2 u_xlat10_14;
vec3 u_xlat15;
vec3 u_xlat16;
ivec2 u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
bool u_xlatb30;
mediump float u_xlat16_39;
float u_xlat40;
bool u_xlatb40;
bool u_xlatb43;
mediump float u_xlat16_47;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_3 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex1, u_xlat16.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat10_6 = texture2D(_DecalsTex2, u_xlat5.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_7 = texture2D(_DecalsTex3, u_xlat16.xy);
    u_xlat10_5 = texture2D(_DecalsTex4, u_xlat5.zw);
    u_xlat16.x = u_xlat10_3 * u_xlat10_4.w;
    u_xlat4.xyz = u_xlat10_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16.xyz = u_xlat16.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat10_3 * u_xlat10_6.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat10_6.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_7.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat10_7.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_5.w;
    u_xlat5.xyz = (-u_xlat16.xyz) + u_xlat10_5.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat16.xyz;
    u_xlat4.x = max(u_xlat10_5.w, u_xlat10_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_4.w);
    u_xlat3 = u_xlat10_3 * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati17.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati17.x : u_xlati17.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
    u_xlatb5.x = 0.0<_UseMask4;
    u_xlatb43 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb30 = u_xlatb4.z || u_xlatb43;
    u_xlatb17 = u_xlatb4.y || u_xlatb30;
    u_xlatb4.x = u_xlatb4.x || u_xlatb17;
    if(u_xlatb4.x){
        u_xlat10_4 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat16.xyz + (-u_xlat10_4.xyz);
        u_xlat16.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat10_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat10_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat16.xyz = (-u_xlat10_2.xyz) + u_xlat16.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat16.xyz + u_xlat10_2.xyz;
    u_xlat16_13.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_13.xy = u_xlat10_1.ww * u_xlat16_13.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_13.xxx * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_13.x = max(u_xlat10_2.z, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    u_xlat16_39 = u_xlat10_1.x * u_xlat10_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_39 * u_xlat16_39 + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat40 = u_xlat16_39 * 4.0 + 2.0;
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat40 = u_xlat16_39 * u_xlat40;
    u_xlat1.x = u_xlat40 / u_xlat1.x;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat10_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat10_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_13.yyy + u_xlat16_11.xyz;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_11.xyz = u_xlat16_8.xyz * u_xlat16_13.xxx;
    u_xlat16_12.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_9.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_39 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_9.xyz = vec3(u_xlat16_39) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_9.xyz = u_xlat10_1.xxx * u_xlat16_9.xyz + u_xlat16_0.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat10_1.yyy * u_xlat16_10.xyz + u_xlat16_9.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_10.xyz + u_xlat16_9.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    u_xlatb1 = _Flu_UV==2.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_1.x = texture2D(_Flu_Mask, u_xlat1.xy).x;
    u_xlat10_14.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlatb40 = _Flu_Intensity==0.0;
    u_xlat16_39 = (u_xlatb40) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_39) * vs_TEXCOORD6.xy;
    u_xlat10_2.xyz = texture2D(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_9.xyz = u_xlat10_2.xyz * _Flu_Color.xyz;
    u_xlat16_9.xyz = u_xlat10_1.xxx * u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_9.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_39 = u_xlat10_1.x * u_xlat10_2.x;
    u_xlat16_39 = u_xlat16_39 * _FluAlpha;
    u_xlat16_39 = u_xlat10_2.w * _Link + u_xlat16_39;
    u_xlat16_47 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _RimPower;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlatb1 = _UseRimRange>=0.5;
    u_xlat16_9.x = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
    u_xlat16_22 = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat40 = (-u_xlat16_9.x) + u_xlat16_22;
    u_xlat15.x = u_xlat16_47 + (-u_xlat16_9.x);
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat15.x = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat16_47 = (u_xlatb1) ? u_xlat40 : u_xlat16_47;
    u_xlat16_47 = u_xlat16_47 * _RimIntensity;
    u_xlat16_47 = u_xlat10_14.x * u_xlat16_47;
    u_xlat16_9.x = float(1.0) / _RimOffset;
    u_xlat16_9.x = u_xlat16_47 * u_xlat16_9.x;
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
    u_xlat16_22 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_22 * u_xlat16_9.x + (-u_xlat16_47);
    u_xlat16_3.x = _RimAlpha * u_xlat16_9.x + u_xlat16_47;
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
    u_xlat16_4.x = u_xlat16_3.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat15.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat15.xyz = _RimColor.xyz * u_xlat15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.yzw = _RimColor.xyz * u_xlat15.xyz + (-u_xlat16_0.xyz);
    u_xlat16_3.yzw = _RimColor.xyz;
    u_xlat16_3 = (bool(u_xlatb1)) ? u_xlat16_4 : u_xlat16_3;
    u_xlat16_0.xyz = u_xlat16_3.yzw * u_xlat16_3.xxx + u_xlat16_0.xyz;
    u_xlat16_39 = _RimAlpha * u_xlat16_3.x + u_xlat16_39;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_14.x = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_47 = u_xlat10_14.x * u_xlat10_1.x;
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Power;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Intensity;
    u_xlat16_9.xyz = vec3(u_xlat16_47) * _Glint_Color.xyz;
    u_xlat16_9.xyz = u_xlat10_14.yyy * u_xlat16_9.xyz;
    u_xlatb1 = 0.5<_EFF_SD;
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_8.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = (bool(u_xlatb1)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_47 = u_xlat10_14.y * u_xlat16_47;
    SV_Target0.w = _Glint_Alpha * u_xlat16_47 + u_xlat16_39;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_9.xyz;
    u_xlatb1 = 0.5<_EFF_LEILA;
    if(u_xlatb1){
        u_xlat10_1.x = texture2D(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_39 = u_xlat10_2.x * _FluAnimMapParaIntensity;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_39);
        u_xlat16_8.xyz = u_xlat10_1.xxx * u_xlat16_8.xyz;
        u_xlat16_0.xyz = u_xlat16_8.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
    }
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_8.xyz + u_xlat16_0.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
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
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _SpecularTex;
uniform lowp samplerCube _EnvMap;
uniform lowp sampler2D _Crystal_CustomColorMask;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _FluAnimMap;
uniform lowp sampler2D _EffMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
lowp float u_xlat10_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
int u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
bvec3 u_xlatb5;
vec3 u_xlat6;
lowp vec4 u_xlat10_6;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec2 u_xlat16_13;
lowp vec2 u_xlat10_14;
vec3 u_xlat15;
vec3 u_xlat16;
ivec2 u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
bool u_xlatb30;
mediump float u_xlat16_39;
float u_xlat40;
bool u_xlatb40;
bool u_xlatb43;
mediump float u_xlat16_47;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_3 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex1, u_xlat16.xy);
    u_xlat5 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat5 = u_xlat5.zwxy + u_xlat5.zwxy;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat10_6 = texture2D(_DecalsTex2, u_xlat5.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_7 = texture2D(_DecalsTex3, u_xlat16.xy);
    u_xlat10_5 = texture2D(_DecalsTex4, u_xlat5.zw);
    u_xlat16.x = u_xlat10_3 * u_xlat10_4.w;
    u_xlat4.xyz = u_xlat10_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16.xyz = u_xlat16.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.x = u_xlat10_3 * u_xlat10_6.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat10_6.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_7.w;
    u_xlat6.xyz = (-u_xlat16.xyz) + u_xlat10_7.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat6.xyz + u_xlat16.xyz;
    u_xlat4.x = u_xlat10_3 * u_xlat10_5.w;
    u_xlat5.xyz = (-u_xlat16.xyz) + u_xlat10_5.xyz;
    u_xlat16.xyz = u_xlat4.xxx * u_xlat5.xyz + u_xlat16.xyz;
    u_xlat4.x = max(u_xlat10_5.w, u_xlat10_7.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_6.w);
    u_xlat4.x = max(u_xlat4.x, u_xlat10_4.w);
    u_xlat3 = u_xlat10_3 * u_xlat4.x;
    u_xlatb4.xy = greaterThanEqual(vec4(0.5, 0.5, 0.0, 0.0), vs_TEXCOORD0.zwzz).xy;
    u_xlati17.xy = (u_xlatb4.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati4 = (u_xlatb4.x) ? u_xlati17.x : u_xlati17.y;
    u_xlatb4 = equal(ivec4(u_xlati4), ivec4(1, 2, 3, 4));
    u_xlatb5.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
    u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
    u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
    u_xlatb5.x = 0.0<_UseMask4;
    u_xlatb43 = u_xlatb4.w && u_xlatb5.x;
    u_xlatb30 = u_xlatb4.z || u_xlatb43;
    u_xlatb17 = u_xlatb4.y || u_xlatb30;
    u_xlatb4.x = u_xlatb4.x || u_xlatb17;
    if(u_xlatb4.x){
        u_xlat10_4 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat5.xyz = u_xlat16.xyz + (-u_xlat10_4.xyz);
        u_xlat16.xyz = vec3(u_xlat3) * u_xlat5.xyz + u_xlat10_4.xyz;
        u_xlat3 = max(u_xlat3, u_xlat10_4.w);
    }
    u_xlat3 = u_xlat3 * _DecalsStrong;
    u_xlat16.xyz = (-u_xlat10_2.xyz) + u_xlat16.xyz;
    u_xlat2.xyz = vec3(u_xlat3) * u_xlat16.xyz + u_xlat10_2.xyz;
    u_xlat16_13.xy = vec2(_MainTexBrightness, _EmissiveCompensation) + vec2(-1.0, -0.5);
    u_xlat16_13.xy = u_xlat10_1.ww * u_xlat16_13.xy + vec2(1.0, 0.5);
    u_xlat16_8.xyz = u_xlat16_13.xxx * u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_SpecularTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13.x = max(u_xlat10_2.y, u_xlat10_2.x);
    u_xlat16_13.x = max(u_xlat10_2.z, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    u_xlat16_39 = u_xlat10_1.x * u_xlat10_1.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat1.x = u_xlat16_39 * u_xlat16_39 + -1.0;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x + 1.00100005;
    u_xlat40 = u_xlat16_39 * 4.0 + 2.0;
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat40 = u_xlat16_39 * u_xlat40;
    u_xlat1.x = u_xlat40 / u_xlat1.x;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat10_2.xyz;
    u_xlat10_2.xyz = textureCube(_EnvMap, vs_TEXCOORD4.xyz).xyz;
    u_xlat16_10.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz + u_xlat10_2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(_EnvSpecularIntensity);
    u_xlat16_0.x = vs_TEXCOORD4.y * 0.400000006 + 0.600000024;
    u_xlat16_10.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat10_1.zzz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat10_1.yyy * u_xlat16_8.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_EmiIntensity, _EmiIntensity, _EmiIntensity));
    u_xlat16_0.xzw = u_xlat16_8.xyz * u_xlat16_13.yyy + u_xlat16_11.xyz;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_11.xyz = u_xlat16_8.xyz * u_xlat16_13.xxx;
    u_xlat16_12.xyz = vs_TEXCOORD1.www * _LightColor.xyz + _EnvDiffuseLighting.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xzw + u_xlat16_9.xyz;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlat10_1.xyz = texture2D(_Crystal_CustomColorMask, vs_TEXCOORD0.xy).xyz;
        u_xlat16_39 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlat16_9.xyz = vec3(u_xlat16_39) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_0.xyz);
        u_xlat16_9.xyz = u_xlat10_1.xxx * u_xlat16_9.xyz + u_xlat16_0.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat10_1.yyy * u_xlat16_10.xyz + u_xlat16_9.xyz;
        u_xlat16_10.xyz = vec3(u_xlat16_39) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_9.xyz);
        u_xlat16_0.xyz = u_xlat10_1.zzz * u_xlat16_10.xyz + u_xlat16_9.xyz;
        u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    }
    u_xlatb1 = _Flu_UV==2.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_1.x = texture2D(_Flu_Mask, u_xlat1.xy).x;
    u_xlat10_14.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlatb40 = _Flu_Intensity==0.0;
    u_xlat16_39 = (u_xlatb40) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = vec2(u_xlat16_39) * vs_TEXCOORD6.xy;
    u_xlat10_2.xyz = texture2D(_Flu_Tex, u_xlat2.xy).xyz;
    u_xlat16_9.xyz = u_xlat10_2.xyz * _Flu_Color.xyz;
    u_xlat16_9.xyz = u_xlat10_1.xxx * u_xlat16_9.xyz;
    u_xlat16_0.xyz = u_xlat16_9.xyz * vec3(vec3(_Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox, _Flu_Intensity_HelpBox)) + u_xlat16_0.xyz;
    u_xlat16_39 = u_xlat10_1.x * u_xlat10_2.x;
    u_xlat16_39 = u_xlat16_39 * _FluAlpha;
    u_xlat16_39 = u_xlat10_2.w * _Link + u_xlat16_39;
    u_xlat16_47 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _RimPower;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlatb1 = _UseRimRange>=0.5;
    u_xlat16_9.x = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
    u_xlat16_22 = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat40 = (-u_xlat16_9.x) + u_xlat16_22;
    u_xlat15.x = u_xlat16_47 + (-u_xlat16_9.x);
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat15.x = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat16_47 = (u_xlatb1) ? u_xlat40 : u_xlat16_47;
    u_xlat16_47 = u_xlat16_47 * _RimIntensity;
    u_xlat16_47 = u_xlat10_14.x * u_xlat16_47;
    u_xlat16_9.x = float(1.0) / _RimOffset;
    u_xlat16_9.x = u_xlat16_47 * u_xlat16_9.x;
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
    u_xlat16_22 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_22 * u_xlat16_9.x + (-u_xlat16_47);
    u_xlat16_3.x = _RimAlpha * u_xlat16_9.x + u_xlat16_47;
    u_xlatb1 = 0.5<_HeroFluNewRimMode;
    u_xlat16_4.x = u_xlat16_3.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat15.xyz = _RimColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat15.xyz = _RimColor.xyz * u_xlat15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.yzw = _RimColor.xyz * u_xlat15.xyz + (-u_xlat16_0.xyz);
    u_xlat16_3.yzw = _RimColor.xyz;
    u_xlat16_3 = (bool(u_xlatb1)) ? u_xlat16_4 : u_xlat16_3;
    u_xlat16_0.xyz = u_xlat16_3.yzw * u_xlat16_3.xxx + u_xlat16_0.xyz;
    u_xlat16_39 = _RimAlpha * u_xlat16_3.x + u_xlat16_39;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_14.x = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_47 = u_xlat10_14.x * u_xlat10_1.x;
    u_xlat16_47 = log2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Power;
    u_xlat16_47 = exp2(u_xlat16_47);
    u_xlat16_47 = u_xlat16_47 * _Glint_Intensity;
    u_xlat16_9.xyz = vec3(u_xlat16_47) * _Glint_Color.xyz;
    u_xlat16_9.xyz = u_xlat10_14.yyy * u_xlat16_9.xyz;
    u_xlatb1 = 0.5<_EFF_SD;
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_8.xyz + vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = (bool(u_xlatb1)) ? u_xlat16_10.xyz : u_xlat16_9.xyz;
    u_xlat16_47 = u_xlat10_14.y * u_xlat16_47;
    SV_Target0.w = _Glint_Alpha * u_xlat16_47 + u_xlat16_39;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_9.xyz;
    u_xlatb1 = 0.5<_EFF_LEILA;
    if(u_xlatb1){
        u_xlat10_1.x = texture2D(_FluAnimMap, vs_TEXCOORD0.xy).x;
        u_xlat16_39 = u_xlat10_2.x * _FluAnimMapParaIntensity;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat16_39);
        u_xlat16_8.xyz = u_xlat10_1.xxx * u_xlat16_8.xyz;
        u_xlat16_0.xyz = u_xlat16_8.xyz * _FluAnimMapColor.xyz + u_xlat16_0.xyz;
    }
    u_xlat1.xy = _Time.xy * vec2(_EffMapMoveSpd) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_EffMap, u_xlat1.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_1.xyz * vec3(vec3(_EffMapScale, _EffMapScale, _EffMapScale)) + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_EffRate) * u_xlat16_8.xyz + u_xlat16_0.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
void main()
{
    u_xlat16_0 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_8 = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_2 = texture(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_DecalsTex3, u_xlat16.xy);
    u_xlat16_3 = texture(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat16_8 * u_xlat16_2.w;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat16_8 * u_xlat16_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat16_3.w, u_xlat16_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_2.w);
    u_xlat8.x = u_xlat16_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(0.0<_UseMask4);
#else
    u_xlatb16.x = 0.0<_UseMask4;
#endif
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat16_3 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat16_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat16_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat16_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat16_0 * u_xlat16_6.x + 1.0;
    SV_Target0.w = u_xlat16_1.w * _Link;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xy = texture(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat16_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat16_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xyz = texture(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat16_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
void main()
{
    u_xlat16_0 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_8 = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_2 = texture(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_DecalsTex3, u_xlat16.xy);
    u_xlat16_3 = texture(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat16_8 * u_xlat16_2.w;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat16_8 * u_xlat16_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat16_3.w, u_xlat16_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_2.w);
    u_xlat8.x = u_xlat16_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(0.0<_UseMask4);
#else
    u_xlatb16.x = 0.0<_UseMask4;
#endif
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat16_3 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat16_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat16_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat16_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat16_0 * u_xlat16_6.x + 1.0;
    SV_Target0.w = u_xlat16_1.w * _Link;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xy = texture(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat16_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat16_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xyz = texture(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat16_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
bvec3 u_xlatb4;
lowp vec4 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
lowp float u_xlat10_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
void main()
{
    u_xlat10_0 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_8 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_2 = texture2D(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_5 = texture2D(_DecalsTex3, u_xlat16.xy);
    u_xlat10_3 = texture2D(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat10_8 * u_xlat10_2.w;
    u_xlat2.xyz = u_xlat10_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat10_8 * u_xlat10_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat10_3.w, u_xlat10_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_2.w);
    u_xlat8.x = u_xlat10_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
    u_xlatb16.x = 0.0<_UseMask4;
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat10_3 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat10_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat10_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat10_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat10_0 * u_xlat16_6.x + 1.0;
    SV_Target0.w = u_xlat10_1.w * _Link;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat10_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat10_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xyz = texture2D(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat10_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
bvec3 u_xlatb4;
lowp vec4 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
lowp float u_xlat10_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
void main()
{
    u_xlat10_0 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_8 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_2 = texture2D(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_5 = texture2D(_DecalsTex3, u_xlat16.xy);
    u_xlat10_3 = texture2D(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat10_8 * u_xlat10_2.w;
    u_xlat2.xyz = u_xlat10_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat10_8 * u_xlat10_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat10_3.w, u_xlat10_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_2.w);
    u_xlat8.x = u_xlat10_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
    u_xlatb16.x = 0.0<_UseMask4;
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat10_3 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat10_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat10_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat10_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat10_0 * u_xlat16_6.x + 1.0;
    SV_Target0.w = u_xlat10_1.w * _Link;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat10_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat10_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xyz = texture2D(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat10_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
float u_xlat17;
mediump float u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat25;
mediump float u_xlat16_30;
void main()
{
    u_xlat16_0 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_8 = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_2 = texture(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_DecalsTex3, u_xlat16.xy);
    u_xlat16_3 = texture(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat16_8 * u_xlat16_2.w;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat16_8 * u_xlat16_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat16_3.w, u_xlat16_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_2.w);
    u_xlat8.x = u_xlat16_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(0.0<_UseMask4);
#else
    u_xlatb16.x = 0.0<_UseMask4;
#endif
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat16_3 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat16_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat16_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat16_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat16_0 * u_xlat16_6.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Flu_UV==2.0);
#else
    u_xlatb0 = _Flu_UV==2.0;
#endif
    u_xlat1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_Flu_Mask, u_xlat1.xy).x;
    u_xlat16_1.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb17 = _Flu_Intensity==0.0;
#endif
    u_xlat16_14.x = (u_xlatb17) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = u_xlat16_14.xx * vs_TEXCOORD6.xy;
    u_xlat16_17 = texture(_Flu_Tex, u_xlat2.xy).x;
    u_xlat16_14.x = u_xlat16_0 * u_xlat16_17;
    u_xlat16_14.x = u_xlat16_14.x * _FluAlpha;
    u_xlat16_14.x = u_xlat16_1.w * _Link + u_xlat16_14.x;
    u_xlat16_22 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _RimPower;
    u_xlat16_22 = exp2(u_xlat16_22);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseRimRange>=0.5);
#else
    u_xlatb0 = _UseRimRange>=0.5;
#endif
    u_xlat16_30 = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_7.x = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat17 = (-u_xlat16_30) + u_xlat16_7.x;
    u_xlat25 = (-u_xlat16_30) + u_xlat16_22;
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
    u_xlat16_22 = (u_xlatb0) ? u_xlat17 : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * _RimIntensity;
    u_xlat16_22 = u_xlat16_1.x * u_xlat16_22;
    u_xlat16_30 = float(1.0) / _RimOffset;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_7.x * u_xlat16_30 + (-u_xlat16_22);
    u_xlat16_22 = _RimAlpha * u_xlat16_30 + u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb0 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_30 = u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_22 = (u_xlatb0) ? u_xlat16_30 : u_xlat16_22;
    u_xlat16_14.x = _RimAlpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat16_0 = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_22 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Power;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Intensity;
    u_xlat16_22 = u_xlat16_1.y * u_xlat16_22;
    SV_Target0.w = _Glint_Alpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xy = texture(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat16_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat16_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xyz = texture(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat16_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
UNITY_LOCATION(0) uniform mediump sampler2D _RoughEmissiveEnv;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DecalsMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DecalsTex1;
UNITY_LOCATION(4) uniform mediump sampler2D _DecalsTex2;
UNITY_LOCATION(5) uniform mediump sampler2D _DecalsTex3;
UNITY_LOCATION(6) uniform mediump sampler2D _DecalsTex4;
UNITY_LOCATION(7) uniform mediump sampler2D _DecalsMask2;
UNITY_LOCATION(8) uniform mediump sampler2D _Flu_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec3 u_xlatb4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
float u_xlat17;
mediump float u_xlat16_17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat25;
mediump float u_xlat16_30;
void main()
{
    u_xlat16_0 = texture(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_8 = texture(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_2 = texture(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xy = min(max(u_xlat16.xy, 0.0), 1.0);
#else
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
#endif
    u_xlat16_5 = texture(_DecalsTex3, u_xlat16.xy);
    u_xlat16_3 = texture(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat16_8 * u_xlat16_2.w;
    u_xlat2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat16_8 * u_xlat16_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat16_8 * u_xlat16_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat16_3.w, u_xlat16_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat16_2.w);
    u_xlat8.x = u_xlat16_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(0.0<_UseMask4);
#else
    u_xlatb16.x = 0.0<_UseMask4;
#endif
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat16_3 = texture(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat16_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat16_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat16_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat16_0 * u_xlat16_6.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Flu_UV==2.0);
#else
    u_xlatb0 = _Flu_UV==2.0;
#endif
    u_xlat1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_Flu_Mask, u_xlat1.xy).x;
    u_xlat16_1.xy = texture(_Flu_Mask, vs_TEXCOORD0.xy).yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Flu_Intensity==0.0);
#else
    u_xlatb17 = _Flu_Intensity==0.0;
#endif
    u_xlat16_14.x = (u_xlatb17) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = u_xlat16_14.xx * vs_TEXCOORD6.xy;
    u_xlat16_17 = texture(_Flu_Tex, u_xlat2.xy).x;
    u_xlat16_14.x = u_xlat16_0 * u_xlat16_17;
    u_xlat16_14.x = u_xlat16_14.x * _FluAlpha;
    u_xlat16_14.x = u_xlat16_1.w * _Link + u_xlat16_14.x;
    u_xlat16_22 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _RimPower;
    u_xlat16_22 = exp2(u_xlat16_22);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseRimRange>=0.5);
#else
    u_xlatb0 = _UseRimRange>=0.5;
#endif
    u_xlat16_30 = (-_RimRangeProportion) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_7.x = _RimRangeProportion * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat17 = (-u_xlat16_30) + u_xlat16_7.x;
    u_xlat25 = (-u_xlat16_30) + u_xlat16_22;
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
    u_xlat16_22 = (u_xlatb0) ? u_xlat17 : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * _RimIntensity;
    u_xlat16_22 = u_xlat16_1.x * u_xlat16_22;
    u_xlat16_30 = float(1.0) / _RimOffset;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_7.x * u_xlat16_30 + (-u_xlat16_22);
    u_xlat16_22 = _RimAlpha * u_xlat16_30 + u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_HeroFluNewRimMode);
#else
    u_xlatb0 = 0.5<_HeroFluNewRimMode;
#endif
    u_xlat16_30 = u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_22 = (u_xlatb0) ? u_xlat16_30 : u_xlat16_22;
    u_xlat16_14.x = _RimAlpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat16_0 = texture(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat16_1.x = texture(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_22 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Power;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Intensity;
    u_xlat16_22 = u_xlat16_1.y * u_xlat16_22;
    SV_Target0.w = _Glint_Alpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xy = texture(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat16_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat16_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1.xyz = texture(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat16_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
bvec3 u_xlatb4;
lowp vec4 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
lowp float u_xlat10_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
float u_xlat17;
lowp float u_xlat10_17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat25;
mediump float u_xlat16_30;
void main()
{
    u_xlat10_0 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_8 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_2 = texture2D(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_5 = texture2D(_DecalsTex3, u_xlat16.xy);
    u_xlat10_3 = texture2D(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat10_8 * u_xlat10_2.w;
    u_xlat2.xyz = u_xlat10_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat10_8 * u_xlat10_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat10_3.w, u_xlat10_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_2.w);
    u_xlat8.x = u_xlat10_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
    u_xlatb16.x = 0.0<_UseMask4;
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat10_3 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat10_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat10_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat10_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat10_0 * u_xlat16_6.x + 1.0;
    u_xlatb0 = _Flu_UV==2.0;
    u_xlat1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_Flu_Mask, u_xlat1.xy).x;
    u_xlat10_1.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlatb17 = _Flu_Intensity==0.0;
    u_xlat16_14.x = (u_xlatb17) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = u_xlat16_14.xx * vs_TEXCOORD6.xy;
    u_xlat10_17 = texture2D(_Flu_Tex, u_xlat2.xy).x;
    u_xlat16_14.x = u_xlat10_0 * u_xlat10_17;
    u_xlat16_14.x = u_xlat16_14.x * _FluAlpha;
    u_xlat16_14.x = u_xlat10_1.w * _Link + u_xlat16_14.x;
    u_xlat16_22 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _RimPower;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlatb0 = _UseRimRange>=0.5;
    u_xlat16_30 = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_7.x = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat17 = (-u_xlat16_30) + u_xlat16_7.x;
    u_xlat25 = (-u_xlat16_30) + u_xlat16_22;
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat25 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
    u_xlat16_22 = (u_xlatb0) ? u_xlat17 : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * _RimIntensity;
    u_xlat16_22 = u_xlat10_1.x * u_xlat16_22;
    u_xlat16_30 = float(1.0) / _RimOffset;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_22;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_7.x * u_xlat16_30 + (-u_xlat16_22);
    u_xlat16_22 = _RimAlpha * u_xlat16_30 + u_xlat16_22;
    u_xlatb0 = 0.5<_HeroFluNewRimMode;
    u_xlat16_30 = u_xlat16_22;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_22 = (u_xlatb0) ? u_xlat16_30 : u_xlat16_22;
    u_xlat16_14.x = _RimAlpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat10_0 = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_22 = u_xlat10_0 * u_xlat10_1.x;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Power;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Intensity;
    u_xlat16_22 = u_xlat10_1.y * u_xlat16_22;
    SV_Target0.w = _Glint_Alpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat10_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat10_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xyz = texture2D(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat10_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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
    vs_TEXCOORD1.w = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_14 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_14 = max(u_xlat16_14, 6.10351563e-05);
    u_xlat16_14 = inversesqrt(u_xlat16_14);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_14) * u_xlat16_2.xyz;
    vs_TEXCOORD2.w = 1.0;
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
uniform 	float _DecalsStrong;
uniform 	float _UseMask1;
uniform 	float _UseMask2;
uniform 	float _UseMask3;
uniform 	float _UseMask4;
uniform 	mediump float _MainTexBrightness;
uniform 	mediump float _Link;
uniform lowp sampler2D _RoughEmissiveEnv;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DecalsMask;
uniform lowp sampler2D _DecalsTex1;
uniform lowp sampler2D _DecalsTex2;
uniform lowp sampler2D _DecalsTex3;
uniform lowp sampler2D _DecalsTex4;
uniform lowp sampler2D _DecalsMask2;
uniform lowp sampler2D _Flu_Mask;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _LG_Tex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
bvec3 u_xlatb4;
lowp vec4 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
lowp float u_xlat10_8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
int u_xlati16;
bvec2 u_xlatb16;
float u_xlat17;
lowp float u_xlat10_17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat25;
mediump float u_xlat16_30;
void main()
{
    u_xlat10_0 = texture2D(_RoughEmissiveEnv, vs_TEXCOORD0.xy).w;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_8 = texture2D(_DecalsMask, vs_TEXCOORD0.zw).x;
    u_xlat16.xy = vs_TEXCOORD0.zw + vs_TEXCOORD0.zw;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_2 = texture2D(_DecalsTex1, u_xlat16.xy);
    u_xlat3 = vs_TEXCOORD0.zwzw + vec4(-0.5, -0.5, -0.5, 0.0);
    u_xlat3 = u_xlat3.zwxy + u_xlat3.zwxy;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat10_4 = texture2D(_DecalsTex2, u_xlat3.xy);
    u_xlat16.xy = vs_TEXCOORD0.zw + vec2(0.0, -0.5);
    u_xlat16.xy = u_xlat16.xy + u_xlat16.xy;
    u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
    u_xlat10_5 = texture2D(_DecalsTex3, u_xlat16.xy);
    u_xlat10_3 = texture2D(_DecalsTex4, u_xlat3.zw);
    u_xlat16.x = u_xlat10_8 * u_xlat10_2.w;
    u_xlat2.xyz = u_xlat10_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16.x = u_xlat10_8 * u_xlat10_4.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_4.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_5.w;
    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat10_5.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat4.xyz + u_xlat2.xyz;
    u_xlat16.x = u_xlat10_8 * u_xlat10_3.w;
    u_xlat3.xyz = (-u_xlat2.xyz) + u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16.xxx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16.x = max(u_xlat10_3.w, u_xlat10_5.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_4.w);
    u_xlat16.x = max(u_xlat16.x, u_xlat10_2.w);
    u_xlat8.x = u_xlat10_8 * u_xlat16.x;
    u_xlatb16.xy = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.5), vs_TEXCOORD0.zwzw).xy;
    u_xlati3.xy = (u_xlatb16.y) ? ivec2(1, 2) : ivec2(3, 4);
    u_xlati16 = (u_xlatb16.x) ? u_xlati3.x : u_xlati3.y;
    u_xlatb3 = equal(ivec4(u_xlati16), ivec4(1, 2, 3, 4));
    u_xlatb4.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseMask1, _UseMask2, _UseMask3, _UseMask1)).xyz;
    u_xlatb3.x = u_xlatb3.x && u_xlatb4.x;
    u_xlatb3.y = u_xlatb3.y && u_xlatb4.y;
    u_xlatb3.z = u_xlatb3.z && u_xlatb4.z;
    u_xlatb16.x = 0.0<_UseMask4;
    u_xlatb16.x = u_xlatb16.x && u_xlatb3.w;
    u_xlatb16.x = u_xlatb3.z || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.y || u_xlatb16.x;
    u_xlatb16.x = u_xlatb3.x || u_xlatb16.x;
    if(u_xlatb16.x){
        u_xlat10_3 = texture2D(_DecalsMask2, vs_TEXCOORD0.xy);
        u_xlat4.xyz = u_xlat2.xyz + (-u_xlat10_3.xyz);
        u_xlat2.xyz = u_xlat8.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
        u_xlat8.x = max(u_xlat8.x, u_xlat10_3.w);
    }
    u_xlat8.x = u_xlat8.x * _DecalsStrong;
    u_xlat2.xyz = (-u_xlat10_1.xyz) + u_xlat2.xyz;
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat10_1.xyz;
    u_xlat16_6.x = _MainTexBrightness + -1.0;
    u_xlat16_6.x = u_xlat10_0 * u_xlat16_6.x + 1.0;
    u_xlatb0 = _Flu_UV==2.0;
    u_xlat1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_Flu_Mask, u_xlat1.xy).x;
    u_xlat10_1.xy = texture2D(_Flu_Mask, vs_TEXCOORD0.xy).yz;
    u_xlatb17 = _Flu_Intensity==0.0;
    u_xlat16_14.x = (u_xlatb17) ? 1.0 : _Flu_Intensity;
    u_xlat2.xy = u_xlat16_14.xx * vs_TEXCOORD6.xy;
    u_xlat10_17 = texture2D(_Flu_Tex, u_xlat2.xy).x;
    u_xlat16_14.x = u_xlat10_0 * u_xlat10_17;
    u_xlat16_14.x = u_xlat16_14.x * _FluAlpha;
    u_xlat16_14.x = u_xlat10_1.w * _Link + u_xlat16_14.x;
    u_xlat16_22 = max(vs_TEXCOORD5.z, 0.00100000005);
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _RimPower;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlatb0 = _UseRimRange>=0.5;
    u_xlat16_30 = (-_RimRangeProportion) * 0.5 + 0.5;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_7.x = _RimRangeProportion * 0.5 + 0.5;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat17 = (-u_xlat16_30) + u_xlat16_7.x;
    u_xlat25 = (-u_xlat16_30) + u_xlat16_22;
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat25 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat25;
    u_xlat16_22 = (u_xlatb0) ? u_xlat17 : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * _RimIntensity;
    u_xlat16_22 = u_xlat10_1.x * u_xlat16_22;
    u_xlat16_30 = float(1.0) / _RimOffset;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_22;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_7.x * u_xlat16_30 + (-u_xlat16_22);
    u_xlat16_22 = _RimAlpha * u_xlat16_30 + u_xlat16_22;
    u_xlatb0 = 0.5<_HeroFluNewRimMode;
    u_xlat16_30 = u_xlat16_22;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_22 = (u_xlatb0) ? u_xlat16_30 : u_xlat16_22;
    u_xlat16_14.x = _RimAlpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat10_0 = texture2D(_Flu_Mask, vs_TEXCOORD7.xy).w;
    u_xlat10_1.x = texture2D(_Flu_Mask, vs_TEXCOORD7.zw).w;
    u_xlat16_22 = u_xlat10_0 * u_xlat10_1.x;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Power;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _Glint_Intensity;
    u_xlat16_22 = u_xlat10_1.y * u_xlat16_22;
    SV_Target0.w = _Glint_Alpha * u_xlat16_22 + u_xlat16_14.x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_LG_Tex, u_xlat1.xy).xy;
    u_xlat16_14.x = u_xlat10_1.x * 0.100000001;
    u_xlat1.xy = u_xlat16_14.xx * u_xlat10_1.yy + vs_TEXCOORD0.xy;
    u_xlat1.xy = _Time.yy * vec2(_L_U, _L_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1.xyz = texture2D(_LG_Tex, u_xlat1.xy).xyz;
    u_xlat16_14.x = (-vs_TEXCOORD5.x) + 1.0;
    u_xlat16_14.x = log2(u_xlat16_14.x);
    u_xlat16_14.x = u_xlat16_14.x * _Fr_Fw;
    u_xlat16_14.x = exp2(u_xlat16_14.x);
    u_xlat16_7.xyz = u_xlat10_1.xyz * _LG_Color.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(_LG_Pw);
    u_xlat16_7.xyz = u_xlat16_14.xxx * u_xlat16_7.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xxx * _LG_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Fr_Pw);
    u_xlat16_14.xyz = max(u_xlat16_14.xyz, u_xlat16_7.xyz);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz + _HitColFix.xyz;
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