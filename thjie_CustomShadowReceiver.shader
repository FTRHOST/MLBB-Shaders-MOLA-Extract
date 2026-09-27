//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "thjie/CustomShadowReceiver" {
Properties {

_Diffuse ("Diffuse", Color) = (1,1,1,1)

_MainTex ("Base 2D", 2D) = "white" { }

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 42699
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    vs_TEXCOORD0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    vs_TEXCOORD0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _Diffuse;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
in highp vec3 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_2;
vec3 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec3 u_xlat4;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
int u_xlati13;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
bool u_xlatb17;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * _Diffuse.xyz;
    u_xlat15 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * vs_TEXCOORD0.xyz;
    u_xlat15 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat4.xyz = vec3(u_xlat15) * _WorldSpaceLightPos0.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat15 = u_xlat15 * 0.5 + 0.5;
    u_xlat3.xyz = vec3(u_xlat15) * _Diffuse.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LightColor0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat2.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb12 = !!(u_xlat15>=1.0);
#else
        u_xlatb12 = u_xlat15>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(0.0>=u_xlat15);
#else
        u_xlatb17 = 0.0>=u_xlat15;
#endif
        u_xlatb12 = u_xlatb17 || u_xlatb12;
        u_xlatb3.xy = lessThan(u_xlat2.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb12 = u_xlatb12 || u_xlatb3.x;
        u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat2.xxyx).xz;
        u_xlatb12 = u_xlatb12 || u_xlatb3.x;
        u_xlatb12 = u_xlatb3.y || u_xlatb12;
        u_xlatb12 = u_xlatb3.z || u_xlatb12;
        if(u_xlatb12){
            u_xlat12 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb17 = !!(0.0<_UsePCF);
#else
            u_xlatb17 = 0.0<_UsePCF;
#endif
            if(u_xlatb17){
                u_xlat17 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat8 = u_xlat17;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat9.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat2.xy;
                        u_xlat16_18 = textureLod(_CustomShadowTex, u_xlat9.xy, 0.0).x;
                        u_xlat18 = (-u_xlat16_18) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb18 = !!(u_xlat15<u_xlat18);
#else
                        u_xlatb18 = u_xlat15<u_xlat18;
#endif
                        u_xlat18 = (u_xlatb18) ? _CustomShadowStrength : 1.0;
                        u_xlat8 = u_xlat18 + u_xlat8;
                    }
                    u_xlat17 = u_xlat8;
                }
                u_xlat12 = u_xlat17 * 0.111111112;
            } else {
                u_xlat16_2 = textureLod(_CustomShadowTex, u_xlat2.xy, 0.0).x;
                u_xlat2.x = (-u_xlat16_2) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb15 = !!(u_xlat15<u_xlat2.x);
#else
                u_xlatb15 = u_xlat15<u_xlat2.x;
#endif
                u_xlat12 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
    }
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    vs_TEXCOORD0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    vs_TEXCOORD0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _Diffuse;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
in highp vec3 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_2;
vec3 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec3 u_xlat4;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
int u_xlati13;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
bool u_xlatb17;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * _Diffuse.xyz;
    u_xlat15 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * vs_TEXCOORD0.xyz;
    u_xlat15 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat4.xyz = vec3(u_xlat15) * _WorldSpaceLightPos0.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat15 = u_xlat15 * 0.5 + 0.5;
    u_xlat3.xyz = vec3(u_xlat15) * _Diffuse.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LightColor0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat2.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb12 = !!(u_xlat15>=1.0);
#else
        u_xlatb12 = u_xlat15>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(0.0>=u_xlat15);
#else
        u_xlatb17 = 0.0>=u_xlat15;
#endif
        u_xlatb12 = u_xlatb17 || u_xlatb12;
        u_xlatb3.xy = lessThan(u_xlat2.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb12 = u_xlatb12 || u_xlatb3.x;
        u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat2.xxyx).xz;
        u_xlatb12 = u_xlatb12 || u_xlatb3.x;
        u_xlatb12 = u_xlatb3.y || u_xlatb12;
        u_xlatb12 = u_xlatb3.z || u_xlatb12;
        if(u_xlatb12){
            u_xlat12 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb17 = !!(0.0<_UsePCF);
#else
            u_xlatb17 = 0.0<_UsePCF;
#endif
            if(u_xlatb17){
                u_xlat17 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat8 = u_xlat17;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat9.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat2.xy;
                        u_xlat16_18 = textureLod(_CustomShadowTex, u_xlat9.xy, 0.0).x;
                        u_xlat18 = (-u_xlat16_18) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb18 = !!(u_xlat15<u_xlat18);
#else
                        u_xlatb18 = u_xlat15<u_xlat18;
#endif
                        u_xlat18 = (u_xlatb18) ? _CustomShadowStrength : 1.0;
                        u_xlat8 = u_xlat18 + u_xlat8;
                    }
                    u_xlat17 = u_xlat8;
                }
                u_xlat12 = u_xlat17 * 0.111111112;
            } else {
                u_xlat16_2 = textureLod(_CustomShadowTex, u_xlat2.xy, 0.0).x;
                u_xlat2.x = (-u_xlat16_2) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb15 = !!(u_xlat15<u_xlat2.x);
#else
                u_xlatb15 = u_xlat15<u_xlat2.x;
#endif
                u_xlat12 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
    }
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    vs_TEXCOORD0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    vs_TEXCOORD0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _Diffuse;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _CustomShadowTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp float u_xlat10_2;
vec3 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec3 u_xlat4;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
int u_xlati13;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
bool u_xlatb17;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * _Diffuse.xyz;
    u_xlat15 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * vs_TEXCOORD0.xyz;
    u_xlat15 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat4.xyz = vec3(u_xlat15) * _WorldSpaceLightPos0.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat15 = u_xlat15 * 0.5 + 0.5;
    u_xlat3.xyz = vec3(u_xlat15) * _Diffuse.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LightColor0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat2.xyz;
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat2.z) + 1.0;
        u_xlatb12 = u_xlat15>=1.0;
        u_xlatb17 = 0.0>=u_xlat15;
        u_xlatb12 = u_xlatb17 || u_xlatb12;
        u_xlatb3.xy = lessThan(u_xlat2.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb12 = u_xlatb12 || u_xlatb3.x;
        u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat2.xxyx).xz;
        u_xlatb12 = u_xlatb12 || u_xlatb3.x;
        u_xlatb12 = u_xlatb3.y || u_xlatb12;
        u_xlatb12 = u_xlatb3.z || u_xlatb12;
        if(u_xlatb12){
            u_xlat12 = 1.0;
        } else {
            u_xlatb17 = 0.0<_UsePCF;
            if(u_xlatb17){
                u_xlat17 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat8 = u_xlat17;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat9.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat2.xy;
                        u_xlat10_18 = texture2DLodEXT(_CustomShadowTex, u_xlat9.xy, 0.0).x;
                        u_xlat18 = (-u_xlat10_18) + 1.0;
                        u_xlatb18 = u_xlat15<u_xlat18;
                        u_xlat18 = (u_xlatb18) ? _CustomShadowStrength : 1.0;
                        u_xlat8 = u_xlat18 + u_xlat8;
                    }
                    u_xlat17 = u_xlat8;
                }
                u_xlat12 = u_xlat17 * 0.111111112;
            } else {
                u_xlat10_2 = texture2DLodEXT(_CustomShadowTex, u_xlat2.xy, 0.0).x;
                u_xlat2.x = (-u_xlat10_2) + 1.0;
                u_xlatb15 = u_xlat15<u_xlat2.x;
                u_xlat12 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
    }
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    vs_TEXCOORD0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    vs_TEXCOORD0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _Diffuse;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _CustomShadowTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp float u_xlat10_2;
vec3 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec3 u_xlat4;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
int u_xlati13;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
bool u_xlatb17;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * _Diffuse.xyz;
    u_xlat15 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * vs_TEXCOORD0.xyz;
    u_xlat15 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat4.xyz = vec3(u_xlat15) * _WorldSpaceLightPos0.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat15 = u_xlat15 * 0.5 + 0.5;
    u_xlat3.xyz = vec3(u_xlat15) * _Diffuse.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LightColor0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat2.xyz;
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat2.z) + 1.0;
        u_xlatb12 = u_xlat15>=1.0;
        u_xlatb17 = 0.0>=u_xlat15;
        u_xlatb12 = u_xlatb17 || u_xlatb12;
        u_xlatb3.xy = lessThan(u_xlat2.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb12 = u_xlatb12 || u_xlatb3.x;
        u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat2.xxyx).xz;
        u_xlatb12 = u_xlatb12 || u_xlatb3.x;
        u_xlatb12 = u_xlatb3.y || u_xlatb12;
        u_xlatb12 = u_xlatb3.z || u_xlatb12;
        if(u_xlatb12){
            u_xlat12 = 1.0;
        } else {
            u_xlatb17 = 0.0<_UsePCF;
            if(u_xlatb17){
                u_xlat17 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat8 = u_xlat17;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat9.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat2.xy;
                        u_xlat10_18 = texture2DLodEXT(_CustomShadowTex, u_xlat9.xy, 0.0).x;
                        u_xlat18 = (-u_xlat10_18) + 1.0;
                        u_xlatb18 = u_xlat15<u_xlat18;
                        u_xlat18 = (u_xlatb18) ? _CustomShadowStrength : 1.0;
                        u_xlat8 = u_xlat18 + u_xlat8;
                    }
                    u_xlat17 = u_xlat8;
                }
                u_xlat12 = u_xlat17 * 0.111111112;
            } else {
                u_xlat10_2 = texture2DLodEXT(_CustomShadowTex, u_xlat2.xy, 0.0).x;
                u_xlat2.x = (-u_xlat10_2) + 1.0;
                u_xlatb15 = u_xlat15<u_xlat2.x;
                u_xlat12 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
    }
    SV_Target0.xyz = u_xlat0.xyz;
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
}
}
}
}