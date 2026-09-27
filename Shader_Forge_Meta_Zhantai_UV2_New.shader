//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Shader Forge/Meta_Zhantai_UV2_New" {
Properties {

_Diff ("Diff", 2D) = "white" { }

_light_PW ("light_PW", Float) = 5.0

_Light ("Light", 2D) = "white" { }

_Light_C ("Light_C", Color) = (0.5,0.5,0.5,1)

_Shadows_PW ("Shadows_PW", Range(0, 10)) = 1.0

[Header(Fog)] [MaterialToggle] _EnableCustomFog ("打开雾效", Float) = 0.0

_FogColor ("雾效颜色", Color) = (1,1,1,1)

_FogDistance ("雾效距离", Float) = 1000.0

_FogFade ("雾效衰减", Float) = 1.0

_Cutout ("Cutout", Range(0, 1)) = 0.0

[Enum(Off, 0, On, 1)] _MLZWrite ("ZWrite", Float) = 1.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2.0

}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 44228
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	float _Shadows_PW;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
UNITY_LOCATION(0) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
int u_xlati6;
vec2 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
float u_xlat10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat17;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb0 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb0){
        u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat0;
        u_xlat0 = u_xlat0 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat10 = (-u_xlat0.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat10>=1.0);
#else
        u_xlatb15 = u_xlat10>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb1.x = !!(0.0>=u_xlat10);
#else
        u_xlatb1.x = 0.0>=u_xlat10;
#endif
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat0.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb15 = u_xlatb1.y || u_xlatb15;
        u_xlatb15 = u_xlatb1.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb1.x = !!(0.0<_UsePCF);
#else
            u_xlatb1.x = 0.0<_UsePCF;
#endif
            if(u_xlatb1.x){
                u_xlat1.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat2.x = float(u_xlati_loop_1);
                    u_xlat11 = u_xlat1.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat2.y = float(u_xlati_loop_2);
                        u_xlat7.xy = u_xlat2.xy * _CustomShadowTex_TexelSize.xy + u_xlat0.xy;
                        u_xlat16_7 = textureLod(_CustomShadowTex, u_xlat7.xy, 0.0).x;
                        u_xlat7.x = (-u_xlat16_7) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb7 = !!(u_xlat10<u_xlat7.x);
#else
                        u_xlatb7 = u_xlat10<u_xlat7.x;
#endif
                        u_xlat7.x = (u_xlatb7) ? _CustomShadowStrength : 1.0;
                        u_xlat11 = u_xlat11 + u_xlat7.x;
                    }
                    u_xlat1.x = u_xlat11;
                }
                u_xlat15 = u_xlat1.x * 0.111111112;
            } else {
                u_xlat16_0.x = textureLod(_CustomShadowTex, u_xlat0.xy, 0.0).x;
                u_xlat0.x = (-u_xlat16_0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb0 = !!(u_xlat10<u_xlat0.x);
#else
                u_xlatb0 = u_xlat10<u_xlat0.x;
#endif
                u_xlat15 = (u_xlatb0) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat15 = 1.0;
    }
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat1 = texture(_Diff, u_xlat1.xy);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Shadows_PW;
    u_xlat15 = exp2(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 / _FogDistance;
    u_xlat17 = max(_FogFade, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat15 = exp2(u_xlat15);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat2.xyz + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat1.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.x = u_xlat1.w + (-_Cutout);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	float _Shadows_PW;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
UNITY_LOCATION(0) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
int u_xlati6;
vec2 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
float u_xlat10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat17;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb0 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb0){
        u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat0;
        u_xlat0 = u_xlat0 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat10 = (-u_xlat0.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat10>=1.0);
#else
        u_xlatb15 = u_xlat10>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb1.x = !!(0.0>=u_xlat10);
#else
        u_xlatb1.x = 0.0>=u_xlat10;
#endif
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat0.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb15 = u_xlatb1.y || u_xlatb15;
        u_xlatb15 = u_xlatb1.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb1.x = !!(0.0<_UsePCF);
#else
            u_xlatb1.x = 0.0<_UsePCF;
#endif
            if(u_xlatb1.x){
                u_xlat1.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat2.x = float(u_xlati_loop_1);
                    u_xlat11 = u_xlat1.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat2.y = float(u_xlati_loop_2);
                        u_xlat7.xy = u_xlat2.xy * _CustomShadowTex_TexelSize.xy + u_xlat0.xy;
                        u_xlat16_7 = textureLod(_CustomShadowTex, u_xlat7.xy, 0.0).x;
                        u_xlat7.x = (-u_xlat16_7) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb7 = !!(u_xlat10<u_xlat7.x);
#else
                        u_xlatb7 = u_xlat10<u_xlat7.x;
#endif
                        u_xlat7.x = (u_xlatb7) ? _CustomShadowStrength : 1.0;
                        u_xlat11 = u_xlat11 + u_xlat7.x;
                    }
                    u_xlat1.x = u_xlat11;
                }
                u_xlat15 = u_xlat1.x * 0.111111112;
            } else {
                u_xlat16_0.x = textureLod(_CustomShadowTex, u_xlat0.xy, 0.0).x;
                u_xlat0.x = (-u_xlat16_0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb0 = !!(u_xlat10<u_xlat0.x);
#else
                u_xlatb0 = u_xlat10<u_xlat0.x;
#endif
                u_xlat15 = (u_xlatb0) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat15 = 1.0;
    }
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat1 = texture(_Diff, u_xlat1.xy);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Shadows_PW;
    u_xlat15 = exp2(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 / _FogDistance;
    u_xlat17 = max(_FogFade, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat15 = exp2(u_xlat15);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat2.xyz + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat1.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.x = u_xlat1.w + (-_Cutout);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	float _Shadows_PW;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Diff;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
int u_xlati6;
vec2 u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
float u_xlat10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat17;
void main()
{
    u_xlatb0 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb0){
        u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat0;
        u_xlat0 = u_xlat0 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat10 = (-u_xlat0.z) + 1.0;
        u_xlatb15 = u_xlat10>=1.0;
        u_xlatb1.x = 0.0>=u_xlat10;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat0.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb15 = u_xlatb1.y || u_xlatb15;
        u_xlatb15 = u_xlatb1.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
            u_xlatb1.x = 0.0<_UsePCF;
            if(u_xlatb1.x){
                u_xlat1.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat2.x = float(u_xlati_loop_1);
                    u_xlat11 = u_xlat1.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat2.y = float(u_xlati_loop_2);
                        u_xlat7.xy = u_xlat2.xy * _CustomShadowTex_TexelSize.xy + u_xlat0.xy;
                        u_xlat10_7 = texture2DLodEXT(_CustomShadowTex, u_xlat7.xy, 0.0).x;
                        u_xlat7.x = (-u_xlat10_7) + 1.0;
                        u_xlatb7 = u_xlat10<u_xlat7.x;
                        u_xlat7.x = (u_xlatb7) ? _CustomShadowStrength : 1.0;
                        u_xlat11 = u_xlat11 + u_xlat7.x;
                    }
                    u_xlat1.x = u_xlat11;
                }
                u_xlat15 = u_xlat1.x * 0.111111112;
            } else {
                u_xlat10_0.x = texture2DLodEXT(_CustomShadowTex, u_xlat0.xy, 0.0).x;
                u_xlat0.x = (-u_xlat10_0.x) + 1.0;
                u_xlatb0 = u_xlat10<u_xlat0.x;
                u_xlat15 = (u_xlatb0) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat15 = 1.0;
    }
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat1 = texture2D(_Diff, u_xlat1.xy);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Shadows_PW;
    u_xlat15 = exp2(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 / _FogDistance;
    u_xlat17 = max(_FogFade, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat15 = exp2(u_xlat15);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat2.xyz + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat1.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.x = u_xlat1.w + (-_Cutout);
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	float _Shadows_PW;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Diff;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
int u_xlati6;
vec2 u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
float u_xlat10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat17;
void main()
{
    u_xlatb0 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb0){
        u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat0;
        u_xlat0 = u_xlat0 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat10 = (-u_xlat0.z) + 1.0;
        u_xlatb15 = u_xlat10>=1.0;
        u_xlatb1.x = 0.0>=u_xlat10;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat0.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb15 = u_xlatb1.y || u_xlatb15;
        u_xlatb15 = u_xlatb1.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
            u_xlatb1.x = 0.0<_UsePCF;
            if(u_xlatb1.x){
                u_xlat1.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat2.x = float(u_xlati_loop_1);
                    u_xlat11 = u_xlat1.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat2.y = float(u_xlati_loop_2);
                        u_xlat7.xy = u_xlat2.xy * _CustomShadowTex_TexelSize.xy + u_xlat0.xy;
                        u_xlat10_7 = texture2DLodEXT(_CustomShadowTex, u_xlat7.xy, 0.0).x;
                        u_xlat7.x = (-u_xlat10_7) + 1.0;
                        u_xlatb7 = u_xlat10<u_xlat7.x;
                        u_xlat7.x = (u_xlatb7) ? _CustomShadowStrength : 1.0;
                        u_xlat11 = u_xlat11 + u_xlat7.x;
                    }
                    u_xlat1.x = u_xlat11;
                }
                u_xlat15 = u_xlat1.x * 0.111111112;
            } else {
                u_xlat10_0.x = texture2DLodEXT(_CustomShadowTex, u_xlat0.xy, 0.0).x;
                u_xlat0.x = (-u_xlat10_0.x) + 1.0;
                u_xlatb0 = u_xlat10<u_xlat0.x;
                u_xlat15 = (u_xlatb0) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat15 = 1.0;
    }
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat1 = texture2D(_Diff, u_xlat1.xy);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Shadows_PW;
    u_xlat15 = exp2(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 / _FogDistance;
    u_xlat17 = max(_FogFade, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat15 = exp2(u_xlat15);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat2.xyz + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat1.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.x = u_xlat1.w + (-_Cutout);
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	float _Shadows_PW;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
UNITY_LOCATION(0) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati6;
vec2 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
float u_xlat10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat17;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb0 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb0){
        u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat0;
        u_xlat0 = u_xlat0 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat10 = (-u_xlat0.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat10>=1.0);
#else
        u_xlatb15 = u_xlat10>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb1.x = !!(0.0>=u_xlat10);
#else
        u_xlatb1.x = 0.0>=u_xlat10;
#endif
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat0.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb15 = u_xlatb1.y || u_xlatb15;
        u_xlatb15 = u_xlatb1.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb1.x = !!(0.0<_UsePCF);
#else
            u_xlatb1.x = 0.0<_UsePCF;
#endif
            if(u_xlatb1.x){
                u_xlat1.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat2.x = float(u_xlati_loop_1);
                    u_xlat11 = u_xlat1.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat2.y = float(u_xlati_loop_2);
                        u_xlat7.xy = u_xlat2.xy * _CustomShadowTex_TexelSize.xy + u_xlat0.xy;
                        u_xlat16_7 = textureLod(_CustomShadowTex, u_xlat7.xy, 0.0).x;
                        u_xlat7.x = (-u_xlat16_7) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb7 = !!(u_xlat10<u_xlat7.x);
#else
                        u_xlatb7 = u_xlat10<u_xlat7.x;
#endif
                        u_xlat7.x = (u_xlatb7) ? _CustomShadowStrength : 1.0;
                        u_xlat11 = u_xlat11 + u_xlat7.x;
                    }
                    u_xlat1.x = u_xlat11;
                }
                u_xlat15 = u_xlat1.x * 0.111111112;
            } else {
                u_xlat16_0.x = textureLod(_CustomShadowTex, u_xlat0.xy, 0.0).x;
                u_xlat0.x = (-u_xlat16_0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb0 = !!(u_xlat10<u_xlat0.x);
#else
                u_xlatb0 = u_xlat10<u_xlat0.x;
#endif
                u_xlat15 = (u_xlatb0) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat0.xyz = vs_TEXCOORD5.xyz / vs_TEXCOORD5.www;
        u_xlat1.xyz = u_xlat0.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
        u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat2.xyz = u_xlat0.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat2.xyz = u_xlat0.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat0.xyz = u_xlat0.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
        u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat5 = (-_LightShadowData.x) + 1.0;
        u_xlat15 = u_xlat0.x * u_xlat5 + _LightShadowData.x;
    }
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat1 = texture(_Diff, u_xlat1.xy);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Shadows_PW;
    u_xlat15 = exp2(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 / _FogDistance;
    u_xlat17 = max(_FogFade, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat15 = exp2(u_xlat15);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat2.xyz + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat1.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.x = u_xlat1.w + (-_Cutout);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	float _Shadows_PW;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
UNITY_LOCATION(0) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati6;
vec2 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
float u_xlat10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat17;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb0 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb0){
        u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat0;
        u_xlat0 = u_xlat0 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat10 = (-u_xlat0.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat10>=1.0);
#else
        u_xlatb15 = u_xlat10>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb1.x = !!(0.0>=u_xlat10);
#else
        u_xlatb1.x = 0.0>=u_xlat10;
#endif
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat0.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb15 = u_xlatb1.y || u_xlatb15;
        u_xlatb15 = u_xlatb1.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb1.x = !!(0.0<_UsePCF);
#else
            u_xlatb1.x = 0.0<_UsePCF;
#endif
            if(u_xlatb1.x){
                u_xlat1.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat2.x = float(u_xlati_loop_1);
                    u_xlat11 = u_xlat1.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat2.y = float(u_xlati_loop_2);
                        u_xlat7.xy = u_xlat2.xy * _CustomShadowTex_TexelSize.xy + u_xlat0.xy;
                        u_xlat16_7 = textureLod(_CustomShadowTex, u_xlat7.xy, 0.0).x;
                        u_xlat7.x = (-u_xlat16_7) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb7 = !!(u_xlat10<u_xlat7.x);
#else
                        u_xlatb7 = u_xlat10<u_xlat7.x;
#endif
                        u_xlat7.x = (u_xlatb7) ? _CustomShadowStrength : 1.0;
                        u_xlat11 = u_xlat11 + u_xlat7.x;
                    }
                    u_xlat1.x = u_xlat11;
                }
                u_xlat15 = u_xlat1.x * 0.111111112;
            } else {
                u_xlat16_0.x = textureLod(_CustomShadowTex, u_xlat0.xy, 0.0).x;
                u_xlat0.x = (-u_xlat16_0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb0 = !!(u_xlat10<u_xlat0.x);
#else
                u_xlatb0 = u_xlat10<u_xlat0.x;
#endif
                u_xlat15 = (u_xlatb0) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat0.xyz = vs_TEXCOORD5.xyz / vs_TEXCOORD5.www;
        u_xlat1.xyz = u_xlat0.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
        u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat2.xyz = u_xlat0.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat2.xyz = u_xlat0.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat0.xyz = u_xlat0.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
        u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat5 = (-_LightShadowData.x) + 1.0;
        u_xlat15 = u_xlat0.x * u_xlat5 + _LightShadowData.x;
    }
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat1 = texture(_Diff, u_xlat1.xy);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Shadows_PW;
    u_xlat15 = exp2(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 / _FogDistance;
    u_xlat17 = max(_FogFade, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat15 = exp2(u_xlat15);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat2.xyz + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat1.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.x = u_xlat1.w + (-_Cutout);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	float _Shadows_PW;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Diff;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati6;
vec2 u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
float u_xlat10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat17;
void main()
{
    u_xlatb0 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb0){
        u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat0;
        u_xlat0 = u_xlat0 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat10 = (-u_xlat0.z) + 1.0;
        u_xlatb15 = u_xlat10>=1.0;
        u_xlatb1.x = 0.0>=u_xlat10;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat0.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb15 = u_xlatb1.y || u_xlatb15;
        u_xlatb15 = u_xlatb1.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
            u_xlatb1.x = 0.0<_UsePCF;
            if(u_xlatb1.x){
                u_xlat1.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat2.x = float(u_xlati_loop_1);
                    u_xlat11 = u_xlat1.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat2.y = float(u_xlati_loop_2);
                        u_xlat7.xy = u_xlat2.xy * _CustomShadowTex_TexelSize.xy + u_xlat0.xy;
                        u_xlat10_7 = texture2DLodEXT(_CustomShadowTex, u_xlat7.xy, 0.0).x;
                        u_xlat7.x = (-u_xlat10_7) + 1.0;
                        u_xlatb7 = u_xlat10<u_xlat7.x;
                        u_xlat7.x = (u_xlatb7) ? _CustomShadowStrength : 1.0;
                        u_xlat11 = u_xlat11 + u_xlat7.x;
                    }
                    u_xlat1.x = u_xlat11;
                }
                u_xlat15 = u_xlat1.x * 0.111111112;
            } else {
                u_xlat10_0.x = texture2DLodEXT(_CustomShadowTex, u_xlat0.xy, 0.0).x;
                u_xlat0.x = (-u_xlat10_0.x) + 1.0;
                u_xlatb0 = u_xlat10<u_xlat0.x;
                u_xlat15 = (u_xlatb0) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat0.xyz = vs_TEXCOORD5.xyz / vs_TEXCOORD5.www;
        u_xlat1.xyz = u_xlat0.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
        u_xlat1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat2.xyz = u_xlat0.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat2.xyz = u_xlat0.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat0.xyz = u_xlat0.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
        u_xlat1.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat5 = (-_LightShadowData.x) + 1.0;
        u_xlat15 = u_xlat0.x * u_xlat5 + _LightShadowData.x;
    }
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat1 = texture2D(_Diff, u_xlat1.xy);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Shadows_PW;
    u_xlat15 = exp2(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 / _FogDistance;
    u_xlat17 = max(_FogFade, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat15 = exp2(u_xlat15);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat2.xyz + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat1.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.x = u_xlat1.w + (-_Cutout);
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	float _Shadows_PW;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Diff;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec3 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati6;
vec2 u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
float u_xlat10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat17;
void main()
{
    u_xlatb0 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb0){
        u_xlat0 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat0 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat0;
        u_xlat0 = u_xlat0 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat10 = (-u_xlat0.z) + 1.0;
        u_xlatb15 = u_xlat10>=1.0;
        u_xlatb1.x = 0.0>=u_xlat10;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xy = lessThan(u_xlat0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb1.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat0.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb1.x;
        u_xlatb15 = u_xlatb1.y || u_xlatb15;
        u_xlatb15 = u_xlatb1.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
            u_xlatb1.x = 0.0<_UsePCF;
            if(u_xlatb1.x){
                u_xlat1.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat2.x = float(u_xlati_loop_1);
                    u_xlat11 = u_xlat1.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat2.y = float(u_xlati_loop_2);
                        u_xlat7.xy = u_xlat2.xy * _CustomShadowTex_TexelSize.xy + u_xlat0.xy;
                        u_xlat10_7 = texture2DLodEXT(_CustomShadowTex, u_xlat7.xy, 0.0).x;
                        u_xlat7.x = (-u_xlat10_7) + 1.0;
                        u_xlatb7 = u_xlat10<u_xlat7.x;
                        u_xlat7.x = (u_xlatb7) ? _CustomShadowStrength : 1.0;
                        u_xlat11 = u_xlat11 + u_xlat7.x;
                    }
                    u_xlat1.x = u_xlat11;
                }
                u_xlat15 = u_xlat1.x * 0.111111112;
            } else {
                u_xlat10_0.x = texture2DLodEXT(_CustomShadowTex, u_xlat0.xy, 0.0).x;
                u_xlat0.x = (-u_xlat10_0.x) + 1.0;
                u_xlatb0 = u_xlat10<u_xlat0.x;
                u_xlat15 = (u_xlatb0) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat0.xyz = vs_TEXCOORD5.xyz / vs_TEXCOORD5.www;
        u_xlat1.xyz = u_xlat0.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
        u_xlat1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat2.xyz = u_xlat0.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat2.xyz = u_xlat0.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat0.xyz = u_xlat0.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
        u_xlat1.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat5 = (-_LightShadowData.x) + 1.0;
        u_xlat15 = u_xlat0.x * u_xlat5 + _LightShadowData.x;
    }
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat1 = texture2D(_Diff, u_xlat1.xy);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Shadows_PW;
    u_xlat15 = exp2(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat15 = u_xlat15 / _FogDistance;
    u_xlat17 = max(_FogFade, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat15 = exp2(u_xlat15);
    u_xlat15 = min(u_xlat15, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat2.xyz + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat1.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.x = u_xlat1.w + (-_Cutout);
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
UNITY_LOCATION(0) uniform mediump sampler2D _Light;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat0 = texture(_Diff, u_xlat0.xy);
    u_xlat1.x = u_xlat0.w + (-_Cutout);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<0.0);
#else
    u_xlatb1 = u_xlat1.x<0.0;
#endif
    if(u_xlatb1){discard;}
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x / _FogDistance;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat4.x = max(_FogFade, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat4.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_4.xyz = texture(_Light, u_xlat4.xy).xyz;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(_light_PW);
    u_xlat4.xyz = u_xlat4.xyz * _Light_C.xyz;
    u_xlat2.xyz = (-u_xlat4.xyz) * u_xlat0.xyz + _FogColor.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat2.xyz + u_xlat4.xyz;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
UNITY_LOCATION(0) uniform mediump sampler2D _Light;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat0 = texture(_Diff, u_xlat0.xy);
    u_xlat1.x = u_xlat0.w + (-_Cutout);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<0.0);
#else
    u_xlatb1 = u_xlat1.x<0.0;
#endif
    if(u_xlatb1){discard;}
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x / _FogDistance;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat4.x = max(_FogFade, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat4.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_4.xyz = texture(_Light, u_xlat4.xy).xyz;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(_light_PW);
    u_xlat4.xyz = u_xlat4.xyz * _Light_C.xyz;
    u_xlat2.xyz = (-u_xlat4.xyz) * u_xlat0.xyz + _FogColor.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat2.xyz + u_xlat4.xyz;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Diff;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat0 = texture2D(_Diff, u_xlat0.xy);
    u_xlat1.x = u_xlat0.w + (-_Cutout);
    u_xlatb1 = u_xlat1.x<0.0;
    if(u_xlatb1){discard;}
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x / _FogDistance;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat4.x = max(_FogFade, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat4.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_4.xyz = texture2D(_Light, u_xlat4.xy).xyz;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_light_PW);
    u_xlat4.xyz = u_xlat4.xyz * _Light_C.xyz;
    u_xlat2.xyz = (-u_xlat4.xyz) * u_xlat0.xyz + _FogColor.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat2.xyz + u_xlat4.xyz;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Diff;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat0 = texture2D(_Diff, u_xlat0.xy);
    u_xlat1.x = u_xlat0.w + (-_Cutout);
    u_xlatb1 = u_xlat1.x<0.0;
    if(u_xlatb1){discard;}
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x / _FogDistance;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat4.x = max(_FogFade, 0.0);
    u_xlat1.x = u_xlat1.x * u_xlat4.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_4.xyz = texture2D(_Light, u_xlat4.xy).xyz;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_light_PW);
    u_xlat4.xyz = u_xlat4.xyz * _Light_C.xyz;
    u_xlat2.xyz = (-u_xlat4.xyz) * u_xlat0.xyz + _FogColor.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat2.xyz + u_xlat4.xyz;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	float _Shadows_PW;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
UNITY_LOCATION(0) uniform mediump sampler2D _Light;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(3) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump float u_xlat10_11;
mediump vec2 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump float u_xlat10_18;
float u_xlat19;
mediump float u_xlat16_23;
mediump float u_xlat10_36;
bool u_xlatb36;
mediump vec2 u_xlat16_41;
mediump vec2 u_xlat16_42;
mediump vec2 u_xlat16_43;
mediump vec2 u_xlat16_44;
mediump vec2 u_xlat16_48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_59;
float u_xlat69;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb54 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
    u_xlat0.xyz = (bool(u_xlatb54)) ? u_xlat0.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat4;
    u_xlat2 = u_xlat0.yyyy * u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = u_xlat3 * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat4 + u_xlat0;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat16_5 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_softShadowQuality==1.0);
#else
    u_xlatb36 = _softShadowQuality==1.0;
#endif
    if(u_xlatb36){
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
        u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
        vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_23 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(_softShadowQuality==2.0);
#else
        u_xlatb36 = _softShadowQuality==2.0;
#endif
        if(u_xlatb36){
            u_xlat16_41.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_41.xy = floor(u_xlat16_41.xy);
            u_xlat16_6.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_41.xy);
            u_xlat16_1 = u_xlat16_6.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_2 = u_xlat16_1.xxzz * u_xlat16_1.xxzz;
            u_xlat16_42.xy = u_xlat16_2.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_7.xy = u_xlat16_2.xz * vec2(0.5, 0.5) + (-u_xlat16_6.xy);
            u_xlat16_43.xy = (-u_xlat16_6.xy) + vec2(1.0, 1.0);
            u_xlat16_8.xy = min(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_43.xy;
            u_xlat16_6.xy = max(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_6.xy = (-u_xlat16_6.xy) * u_xlat16_6.xy + u_xlat16_1.yw;
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_6.xy = u_xlat16_6.xy + vec2(1.0, 1.0);
            u_xlat16_2.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_3.xy = u_xlat16_43.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_4.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_6.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_1.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_2.z = u_xlat16_4.x;
            u_xlat16_2.w = u_xlat16_6.x;
            u_xlat16_3.z = u_xlat16_7.x;
            u_xlat16_3.w = u_xlat16_42.x;
            u_xlat16_1 = u_xlat16_2.zwxz + u_xlat16_3.zwxz;
            u_xlat16_4.z = u_xlat16_2.y;
            u_xlat16_4.w = u_xlat16_6.y;
            u_xlat16_7.z = u_xlat16_3.y;
            u_xlat16_7.w = u_xlat16_42.y;
            u_xlat16_6.xyz = u_xlat16_4.zyw + u_xlat16_7.zyw;
            u_xlat16_8.xyz = u_xlat16_3.xzw / u_xlat16_1.zwy;
            u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_7.xyz = u_xlat16_7.zyw / u_xlat16_6.xyz;
            u_xlat16_7.xyz = u_xlat16_7.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_2.xyz = u_xlat16_8.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_3.xyz = u_xlat16_7.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_2.w = u_xlat16_3.x;
            u_xlat16_4 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_2.ywxw;
            u_xlat16_7.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_2.zw;
            u_xlat16_3.w = u_xlat16_2.y;
            u_xlat16_2.yw = u_xlat16_3.yz;
            u_xlat16_8 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_2.xyzy;
            u_xlat16_3 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.wywz;
            u_xlat16_2 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_2.xwzw;
            u_xlat16_9 = u_xlat16_1.zwyz * u_xlat16_6.xxxy;
            u_xlat16_10 = u_xlat16_1 * u_xlat16_6.yyzz;
            u_xlat16_41.x = u_xlat16_1.y * u_xlat16_6.z;
            vec3 txVec4 = vec3(u_xlat16_4.xy,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_4.zw,u_xlat0.w);
            u_xlat10_11 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_59 = u_xlat16_9.y * u_xlat10_11;
            u_xlat16_59 = u_xlat16_9.x * u_xlat10_36 + u_xlat16_59;
            vec3 txVec6 = vec3(u_xlat16_7.xy,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_59 = u_xlat16_9.z * u_xlat10_36 + u_xlat16_59;
            vec3 txVec7 = vec3(u_xlat16_3.xy,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_59 = u_xlat16_9.w * u_xlat10_36 + u_xlat16_59;
            vec3 txVec8 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_59 = u_xlat16_10.x * u_xlat10_36 + u_xlat16_59;
            vec3 txVec9 = vec3(u_xlat16_8.zw,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_59 = u_xlat16_10.y * u_xlat10_36 + u_xlat16_59;
            vec3 txVec10 = vec3(u_xlat16_3.zw,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_59 = u_xlat16_10.z * u_xlat10_36 + u_xlat16_59;
            vec3 txVec11 = vec3(u_xlat16_2.xy,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_59 = u_xlat16_10.w * u_xlat10_36 + u_xlat16_59;
            vec3 txVec12 = vec3(u_xlat16_2.zw,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_23 = u_xlat16_41.x * u_xlat10_36 + u_xlat16_59;
        } else {
            u_xlat16_41.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_41.xy = floor(u_xlat16_41.xy);
            u_xlat16_6.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_41.xy);
            u_xlat16_1 = u_xlat16_6.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_2 = u_xlat16_1.xxzz * u_xlat16_1.xxzz;
            u_xlat16_3.yw = u_xlat16_2.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_42.xy = u_xlat16_2.xz * vec2(0.5, 0.5) + (-u_xlat16_6.xy);
            u_xlat16_7.xy = (-u_xlat16_6.xy) + vec2(1.0, 1.0);
            u_xlat16_43.xy = min(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_7.xy = (-u_xlat16_43.xy) * u_xlat16_43.xy + u_xlat16_7.xy;
            u_xlat16_43.xy = max(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_7.zw = (-u_xlat16_43.xy) * u_xlat16_43.xy + u_xlat16_1.yw;
            u_xlat16_7 = u_xlat16_7 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_1.z = u_xlat16_7.z * 0.0816320032;
            u_xlat16_2.xy = u_xlat16_42.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_42.xy = u_xlat16_7.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_2.z = u_xlat16_7.w * 0.0816320032;
            u_xlat16_1.x = u_xlat16_2.y;
            u_xlat16_1.yw = u_xlat16_6.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_4.xz = u_xlat16_6.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_4.y = u_xlat16_42.x;
            u_xlat16_4.w = u_xlat16_3.y;
            u_xlat16_1 = u_xlat16_1 + u_xlat16_4;
            u_xlat16_2.yw = u_xlat16_6.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_3.xz = u_xlat16_6.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_3.y = u_xlat16_42.y;
            u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
            u_xlat16_4 = u_xlat16_4 / u_xlat16_1;
            u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_3 = u_xlat16_3 / u_xlat16_2;
            u_xlat16_3 = u_xlat16_3 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_4 = u_xlat16_4.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_3 = u_xlat16_3.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_6.xzw = u_xlat16_4.yzw;
            u_xlat16_6.y = u_xlat16_3.x;
            u_xlat16_7 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_8.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_4.y = u_xlat16_6.y;
            u_xlat16_6.y = u_xlat16_3.z;
            u_xlat16_9 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_44.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_4.z = u_xlat16_6.y;
            u_xlat16_10 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyxz;
            u_xlat16_6.y = u_xlat16_3.w;
            u_xlat16_11 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_12.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_4.w = u_xlat16_6.y;
            u_xlat16_48.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xw;
            u_xlat16_3.xzw = u_xlat16_6.xzw;
            u_xlat16_6 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
            u_xlat16_13.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.wy;
            u_xlat16_3.x = u_xlat16_4.x;
            u_xlat16_41.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.xy;
            u_xlat16_3 = u_xlat16_1 * u_xlat16_2.xxxx;
            u_xlat16_4 = u_xlat16_1 * u_xlat16_2.yyyy;
            u_xlat16_14 = u_xlat16_1 * u_xlat16_2.zzzz;
            u_xlat16_1 = u_xlat16_1 * u_xlat16_2.wwww;
            vec3 txVec13 = vec3(u_xlat16_7.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_7.zw,u_xlat0.w);
            u_xlat10_18 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_7.x = u_xlat10_18 * u_xlat16_3.y;
            u_xlat16_7.x = u_xlat16_3.x * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec15 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_7.x = u_xlat16_3.z * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec16 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_7.x = u_xlat16_3.w * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec17 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_7.x = u_xlat16_4.x * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec18 = vec3(u_xlat16_9.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_7.x = u_xlat16_4.y * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec19 = vec3(u_xlat16_44.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_7.x = u_xlat16_4.z * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec20 = vec3(u_xlat16_10.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_7.x = u_xlat16_4.w * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec21 = vec3(u_xlat16_11.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_7.x = u_xlat16_14.x * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec22 = vec3(u_xlat16_11.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_7.x = u_xlat16_14.y * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec23 = vec3(u_xlat16_12.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_7.x = u_xlat16_14.z * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec24 = vec3(u_xlat16_48.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_7.x = u_xlat16_14.w * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec25 = vec3(u_xlat16_6.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_6.x = u_xlat16_1.x * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec26 = vec3(u_xlat16_6.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_6.x = u_xlat16_1.y * u_xlat10_0 + u_xlat16_6.x;
            vec3 txVec27 = vec3(u_xlat16_13.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_6.x = u_xlat16_1.z * u_xlat10_0 + u_xlat16_6.x;
            vec3 txVec28 = vec3(u_xlat16_41.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_23 = u_xlat16_1.w * u_xlat10_0 + u_xlat16_6.x;
        }
    }
    u_xlat16_41.x = (-u_xlat16_5) + 1.0;
    u_xlat16_5 = u_xlat16_23 * u_xlat16_41.x + u_xlat16_5;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat15.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat1 = texture(_Diff, u_xlat15.xy);
    u_xlat54 = log2(u_xlat16_5);
    u_xlat54 = u_xlat54 * _Shadows_PW;
    u_xlat54 = exp2(u_xlat54);
    u_xlat15.xyz = vec3(u_xlat54) * u_xlat1.xyz;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat15.xyz;
    u_xlat17.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat54 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 / _FogDistance;
    u_xlat69 = max(_FogFade, 0.0);
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * u_xlat69;
    u_xlat54 = exp2(u_xlat54);
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat15.xyz + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat54);
    u_xlat1.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat16.xyz;
    u_xlat0.x = u_xlat1.w + (-_Cutout);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	float _Shadows_PW;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
UNITY_LOCATION(0) uniform mediump sampler2D _Light;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(3) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump float u_xlat10_11;
mediump vec2 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump float u_xlat10_18;
float u_xlat19;
mediump float u_xlat16_23;
mediump float u_xlat10_36;
bool u_xlatb36;
mediump vec2 u_xlat16_41;
mediump vec2 u_xlat16_42;
mediump vec2 u_xlat16_43;
mediump vec2 u_xlat16_44;
mediump vec2 u_xlat16_48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_59;
float u_xlat69;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb54 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
    u_xlat0.xyz = (bool(u_xlatb54)) ? u_xlat0.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat4;
    u_xlat2 = u_xlat0.yyyy * u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = u_xlat3 * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat4 + u_xlat0;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat16_5 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_softShadowQuality==1.0);
#else
    u_xlatb36 = _softShadowQuality==1.0;
#endif
    if(u_xlatb36){
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
        u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
        vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_23 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(_softShadowQuality==2.0);
#else
        u_xlatb36 = _softShadowQuality==2.0;
#endif
        if(u_xlatb36){
            u_xlat16_41.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_41.xy = floor(u_xlat16_41.xy);
            u_xlat16_6.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_41.xy);
            u_xlat16_1 = u_xlat16_6.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_2 = u_xlat16_1.xxzz * u_xlat16_1.xxzz;
            u_xlat16_42.xy = u_xlat16_2.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_7.xy = u_xlat16_2.xz * vec2(0.5, 0.5) + (-u_xlat16_6.xy);
            u_xlat16_43.xy = (-u_xlat16_6.xy) + vec2(1.0, 1.0);
            u_xlat16_8.xy = min(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_43.xy;
            u_xlat16_6.xy = max(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_6.xy = (-u_xlat16_6.xy) * u_xlat16_6.xy + u_xlat16_1.yw;
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_6.xy = u_xlat16_6.xy + vec2(1.0, 1.0);
            u_xlat16_2.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_3.xy = u_xlat16_43.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_4.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_6.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_1.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_2.z = u_xlat16_4.x;
            u_xlat16_2.w = u_xlat16_6.x;
            u_xlat16_3.z = u_xlat16_7.x;
            u_xlat16_3.w = u_xlat16_42.x;
            u_xlat16_1 = u_xlat16_2.zwxz + u_xlat16_3.zwxz;
            u_xlat16_4.z = u_xlat16_2.y;
            u_xlat16_4.w = u_xlat16_6.y;
            u_xlat16_7.z = u_xlat16_3.y;
            u_xlat16_7.w = u_xlat16_42.y;
            u_xlat16_6.xyz = u_xlat16_4.zyw + u_xlat16_7.zyw;
            u_xlat16_8.xyz = u_xlat16_3.xzw / u_xlat16_1.zwy;
            u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_7.xyz = u_xlat16_7.zyw / u_xlat16_6.xyz;
            u_xlat16_7.xyz = u_xlat16_7.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_2.xyz = u_xlat16_8.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_3.xyz = u_xlat16_7.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_2.w = u_xlat16_3.x;
            u_xlat16_4 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_2.ywxw;
            u_xlat16_7.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_2.zw;
            u_xlat16_3.w = u_xlat16_2.y;
            u_xlat16_2.yw = u_xlat16_3.yz;
            u_xlat16_8 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_2.xyzy;
            u_xlat16_3 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.wywz;
            u_xlat16_2 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_2.xwzw;
            u_xlat16_9 = u_xlat16_1.zwyz * u_xlat16_6.xxxy;
            u_xlat16_10 = u_xlat16_1 * u_xlat16_6.yyzz;
            u_xlat16_41.x = u_xlat16_1.y * u_xlat16_6.z;
            vec3 txVec4 = vec3(u_xlat16_4.xy,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_4.zw,u_xlat0.w);
            u_xlat10_11 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_59 = u_xlat16_9.y * u_xlat10_11;
            u_xlat16_59 = u_xlat16_9.x * u_xlat10_36 + u_xlat16_59;
            vec3 txVec6 = vec3(u_xlat16_7.xy,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_59 = u_xlat16_9.z * u_xlat10_36 + u_xlat16_59;
            vec3 txVec7 = vec3(u_xlat16_3.xy,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_59 = u_xlat16_9.w * u_xlat10_36 + u_xlat16_59;
            vec3 txVec8 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_59 = u_xlat16_10.x * u_xlat10_36 + u_xlat16_59;
            vec3 txVec9 = vec3(u_xlat16_8.zw,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_59 = u_xlat16_10.y * u_xlat10_36 + u_xlat16_59;
            vec3 txVec10 = vec3(u_xlat16_3.zw,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_59 = u_xlat16_10.z * u_xlat10_36 + u_xlat16_59;
            vec3 txVec11 = vec3(u_xlat16_2.xy,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_59 = u_xlat16_10.w * u_xlat10_36 + u_xlat16_59;
            vec3 txVec12 = vec3(u_xlat16_2.zw,u_xlat0.w);
            u_xlat10_36 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_23 = u_xlat16_41.x * u_xlat10_36 + u_xlat16_59;
        } else {
            u_xlat16_41.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_41.xy = floor(u_xlat16_41.xy);
            u_xlat16_6.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_41.xy);
            u_xlat16_1 = u_xlat16_6.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_2 = u_xlat16_1.xxzz * u_xlat16_1.xxzz;
            u_xlat16_3.yw = u_xlat16_2.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_42.xy = u_xlat16_2.xz * vec2(0.5, 0.5) + (-u_xlat16_6.xy);
            u_xlat16_7.xy = (-u_xlat16_6.xy) + vec2(1.0, 1.0);
            u_xlat16_43.xy = min(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_7.xy = (-u_xlat16_43.xy) * u_xlat16_43.xy + u_xlat16_7.xy;
            u_xlat16_43.xy = max(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_7.zw = (-u_xlat16_43.xy) * u_xlat16_43.xy + u_xlat16_1.yw;
            u_xlat16_7 = u_xlat16_7 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_1.z = u_xlat16_7.z * 0.0816320032;
            u_xlat16_2.xy = u_xlat16_42.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_42.xy = u_xlat16_7.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_2.z = u_xlat16_7.w * 0.0816320032;
            u_xlat16_1.x = u_xlat16_2.y;
            u_xlat16_1.yw = u_xlat16_6.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_4.xz = u_xlat16_6.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_4.y = u_xlat16_42.x;
            u_xlat16_4.w = u_xlat16_3.y;
            u_xlat16_1 = u_xlat16_1 + u_xlat16_4;
            u_xlat16_2.yw = u_xlat16_6.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_3.xz = u_xlat16_6.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_3.y = u_xlat16_42.y;
            u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
            u_xlat16_4 = u_xlat16_4 / u_xlat16_1;
            u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_3 = u_xlat16_3 / u_xlat16_2;
            u_xlat16_3 = u_xlat16_3 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_4 = u_xlat16_4.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_3 = u_xlat16_3.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_6.xzw = u_xlat16_4.yzw;
            u_xlat16_6.y = u_xlat16_3.x;
            u_xlat16_7 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_8.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_4.y = u_xlat16_6.y;
            u_xlat16_6.y = u_xlat16_3.z;
            u_xlat16_9 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_44.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_4.z = u_xlat16_6.y;
            u_xlat16_10 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyxz;
            u_xlat16_6.y = u_xlat16_3.w;
            u_xlat16_11 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_12.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_4.w = u_xlat16_6.y;
            u_xlat16_48.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xw;
            u_xlat16_3.xzw = u_xlat16_6.xzw;
            u_xlat16_6 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
            u_xlat16_13.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.wy;
            u_xlat16_3.x = u_xlat16_4.x;
            u_xlat16_41.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.xy;
            u_xlat16_3 = u_xlat16_1 * u_xlat16_2.xxxx;
            u_xlat16_4 = u_xlat16_1 * u_xlat16_2.yyyy;
            u_xlat16_14 = u_xlat16_1 * u_xlat16_2.zzzz;
            u_xlat16_1 = u_xlat16_1 * u_xlat16_2.wwww;
            vec3 txVec13 = vec3(u_xlat16_7.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_7.zw,u_xlat0.w);
            u_xlat10_18 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_7.x = u_xlat10_18 * u_xlat16_3.y;
            u_xlat16_7.x = u_xlat16_3.x * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec15 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_7.x = u_xlat16_3.z * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec16 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_7.x = u_xlat16_3.w * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec17 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_7.x = u_xlat16_4.x * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec18 = vec3(u_xlat16_9.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_7.x = u_xlat16_4.y * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec19 = vec3(u_xlat16_44.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_7.x = u_xlat16_4.z * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec20 = vec3(u_xlat16_10.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_7.x = u_xlat16_4.w * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec21 = vec3(u_xlat16_11.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_7.x = u_xlat16_14.x * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec22 = vec3(u_xlat16_11.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_7.x = u_xlat16_14.y * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec23 = vec3(u_xlat16_12.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_7.x = u_xlat16_14.z * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec24 = vec3(u_xlat16_48.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_7.x = u_xlat16_14.w * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec25 = vec3(u_xlat16_6.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_6.x = u_xlat16_1.x * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec26 = vec3(u_xlat16_6.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_6.x = u_xlat16_1.y * u_xlat10_0 + u_xlat16_6.x;
            vec3 txVec27 = vec3(u_xlat16_13.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_6.x = u_xlat16_1.z * u_xlat10_0 + u_xlat16_6.x;
            vec3 txVec28 = vec3(u_xlat16_41.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_23 = u_xlat16_1.w * u_xlat10_0 + u_xlat16_6.x;
        }
    }
    u_xlat16_41.x = (-u_xlat16_5) + 1.0;
    u_xlat16_5 = u_xlat16_23 * u_xlat16_41.x + u_xlat16_5;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat15.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat1 = texture(_Diff, u_xlat15.xy);
    u_xlat54 = log2(u_xlat16_5);
    u_xlat54 = u_xlat54 * _Shadows_PW;
    u_xlat54 = exp2(u_xlat54);
    u_xlat15.xyz = vec3(u_xlat54) * u_xlat1.xyz;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat15.xyz;
    u_xlat17.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat54 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 / _FogDistance;
    u_xlat69 = max(_FogFade, 0.0);
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * u_xlat69;
    u_xlat54 = exp2(u_xlat54);
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat15.xyz + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat54);
    u_xlat1.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat16.xyz;
    u_xlat0.x = u_xlat1.w + (-_Cutout);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	float _Shadows_PW;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Diff;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
lowp float u_xlat10_11;
mediump vec2 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
lowp float u_xlat10_18;
float u_xlat19;
mediump float u_xlat16_23;
lowp float u_xlat10_36;
bool u_xlatb36;
mediump vec2 u_xlat16_41;
mediump vec2 u_xlat16_42;
mediump vec2 u_xlat16_43;
mediump vec2 u_xlat16_44;
mediump vec2 u_xlat16_48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_59;
float u_xlat69;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlatb54 = _ShadowBias.z!=0.0;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
    u_xlat0.xyz = (bool(u_xlatb54)) ? u_xlat0.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat4;
    u_xlat2 = u_xlat0.yyyy * u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = u_xlat3 * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat4 + u_xlat0;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat16_5 = (-_ShadowBias.w) + 1.0;
    u_xlatb36 = _softShadowQuality==1.0;
    if(u_xlatb36){
        u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat1.z = 0.0;
        u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
        vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
        u_xlat1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
        vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
        vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
        vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_23 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb36 = _softShadowQuality==2.0;
        if(u_xlatb36){
            u_xlat16_41.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_41.xy = floor(u_xlat16_41.xy);
            u_xlat16_6.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_41.xy);
            u_xlat16_1 = u_xlat16_6.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_2 = u_xlat16_1.xxzz * u_xlat16_1.xxzz;
            u_xlat16_42.xy = u_xlat16_2.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_7.xy = u_xlat16_2.xz * vec2(0.5, 0.5) + (-u_xlat16_6.xy);
            u_xlat16_43.xy = (-u_xlat16_6.xy) + vec2(1.0, 1.0);
            u_xlat16_8.xy = min(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_43.xy;
            u_xlat16_6.xy = max(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_6.xy = (-u_xlat16_6.xy) * u_xlat16_6.xy + u_xlat16_1.yw;
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_6.xy = u_xlat16_6.xy + vec2(1.0, 1.0);
            u_xlat16_2.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_3.xy = u_xlat16_43.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_4.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_6.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_1.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_2.z = u_xlat16_4.x;
            u_xlat16_2.w = u_xlat16_6.x;
            u_xlat16_3.z = u_xlat16_7.x;
            u_xlat16_3.w = u_xlat16_42.x;
            u_xlat16_1 = u_xlat16_2.zwxz + u_xlat16_3.zwxz;
            u_xlat16_4.z = u_xlat16_2.y;
            u_xlat16_4.w = u_xlat16_6.y;
            u_xlat16_7.z = u_xlat16_3.y;
            u_xlat16_7.w = u_xlat16_42.y;
            u_xlat16_6.xyz = u_xlat16_4.zyw + u_xlat16_7.zyw;
            u_xlat16_8.xyz = u_xlat16_3.xzw / u_xlat16_1.zwy;
            u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_7.xyz = u_xlat16_7.zyw / u_xlat16_6.xyz;
            u_xlat16_7.xyz = u_xlat16_7.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_2.xyz = u_xlat16_8.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_3.xyz = u_xlat16_7.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_2.w = u_xlat16_3.x;
            u_xlat16_4 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_2.ywxw;
            u_xlat16_7.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_2.zw;
            u_xlat16_3.w = u_xlat16_2.y;
            u_xlat16_2.yw = u_xlat16_3.yz;
            u_xlat16_8 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_2.xyzy;
            u_xlat16_3 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.wywz;
            u_xlat16_2 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_2.xwzw;
            u_xlat16_9 = u_xlat16_1.zwyz * u_xlat16_6.xxxy;
            u_xlat16_10 = u_xlat16_1 * u_xlat16_6.yyzz;
            u_xlat16_41.x = u_xlat16_1.y * u_xlat16_6.z;
            vec3 txVec4 = vec3(u_xlat16_4.xy,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_4.zw,u_xlat0.w);
            u_xlat10_11 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_59 = u_xlat16_9.y * u_xlat10_11;
            u_xlat16_59 = u_xlat16_9.x * u_xlat10_36 + u_xlat16_59;
            vec3 txVec6 = vec3(u_xlat16_7.xy,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_59 = u_xlat16_9.z * u_xlat10_36 + u_xlat16_59;
            vec3 txVec7 = vec3(u_xlat16_3.xy,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_59 = u_xlat16_9.w * u_xlat10_36 + u_xlat16_59;
            vec3 txVec8 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_59 = u_xlat16_10.x * u_xlat10_36 + u_xlat16_59;
            vec3 txVec9 = vec3(u_xlat16_8.zw,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_59 = u_xlat16_10.y * u_xlat10_36 + u_xlat16_59;
            vec3 txVec10 = vec3(u_xlat16_3.zw,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_59 = u_xlat16_10.z * u_xlat10_36 + u_xlat16_59;
            vec3 txVec11 = vec3(u_xlat16_2.xy,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_59 = u_xlat16_10.w * u_xlat10_36 + u_xlat16_59;
            vec3 txVec12 = vec3(u_xlat16_2.zw,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_23 = u_xlat16_41.x * u_xlat10_36 + u_xlat16_59;
        } else {
            u_xlat16_41.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_41.xy = floor(u_xlat16_41.xy);
            u_xlat16_6.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_41.xy);
            u_xlat16_1 = u_xlat16_6.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_2 = u_xlat16_1.xxzz * u_xlat16_1.xxzz;
            u_xlat16_3.yw = u_xlat16_2.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_42.xy = u_xlat16_2.xz * vec2(0.5, 0.5) + (-u_xlat16_6.xy);
            u_xlat16_7.xy = (-u_xlat16_6.xy) + vec2(1.0, 1.0);
            u_xlat16_43.xy = min(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_7.xy = (-u_xlat16_43.xy) * u_xlat16_43.xy + u_xlat16_7.xy;
            u_xlat16_43.xy = max(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_7.zw = (-u_xlat16_43.xy) * u_xlat16_43.xy + u_xlat16_1.yw;
            u_xlat16_7 = u_xlat16_7 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_1.z = u_xlat16_7.z * 0.0816320032;
            u_xlat16_2.xy = u_xlat16_42.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_42.xy = u_xlat16_7.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_2.z = u_xlat16_7.w * 0.0816320032;
            u_xlat16_1.x = u_xlat16_2.y;
            u_xlat16_1.yw = u_xlat16_6.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_4.xz = u_xlat16_6.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_4.y = u_xlat16_42.x;
            u_xlat16_4.w = u_xlat16_3.y;
            u_xlat16_1 = u_xlat16_1 + u_xlat16_4;
            u_xlat16_2.yw = u_xlat16_6.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_3.xz = u_xlat16_6.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_3.y = u_xlat16_42.y;
            u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
            u_xlat16_4 = u_xlat16_4 / u_xlat16_1;
            u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_3 = u_xlat16_3 / u_xlat16_2;
            u_xlat16_3 = u_xlat16_3 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_4 = u_xlat16_4.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_3 = u_xlat16_3.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_6.xzw = u_xlat16_4.yzw;
            u_xlat16_6.y = u_xlat16_3.x;
            u_xlat16_7 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_8.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_4.y = u_xlat16_6.y;
            u_xlat16_6.y = u_xlat16_3.z;
            u_xlat16_9 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_44.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_4.z = u_xlat16_6.y;
            u_xlat16_10 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyxz;
            u_xlat16_6.y = u_xlat16_3.w;
            u_xlat16_11 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_12.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_4.w = u_xlat16_6.y;
            u_xlat16_48.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xw;
            u_xlat16_3.xzw = u_xlat16_6.xzw;
            u_xlat16_6 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
            u_xlat16_13.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.wy;
            u_xlat16_3.x = u_xlat16_4.x;
            u_xlat16_41.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.xy;
            u_xlat16_3 = u_xlat16_1 * u_xlat16_2.xxxx;
            u_xlat16_4 = u_xlat16_1 * u_xlat16_2.yyyy;
            u_xlat16_14 = u_xlat16_1 * u_xlat16_2.zzzz;
            u_xlat16_1 = u_xlat16_1 * u_xlat16_2.wwww;
            vec3 txVec13 = vec3(u_xlat16_7.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_7.zw,u_xlat0.w);
            u_xlat10_18 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_7.x = u_xlat10_18 * u_xlat16_3.y;
            u_xlat16_7.x = u_xlat16_3.x * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec15 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_7.x = u_xlat16_3.z * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec16 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_7.x = u_xlat16_3.w * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec17 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_7.x = u_xlat16_4.x * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec18 = vec3(u_xlat16_9.zw,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_7.x = u_xlat16_4.y * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec19 = vec3(u_xlat16_44.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_7.x = u_xlat16_4.z * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec20 = vec3(u_xlat16_10.zw,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_7.x = u_xlat16_4.w * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec21 = vec3(u_xlat16_11.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_7.x = u_xlat16_14.x * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec22 = vec3(u_xlat16_11.zw,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_7.x = u_xlat16_14.y * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec23 = vec3(u_xlat16_12.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_7.x = u_xlat16_14.z * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec24 = vec3(u_xlat16_48.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_7.x = u_xlat16_14.w * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec25 = vec3(u_xlat16_6.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_6.x = u_xlat16_1.x * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec26 = vec3(u_xlat16_6.zw,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_6.x = u_xlat16_1.y * u_xlat10_0.x + u_xlat16_6.x;
            vec3 txVec27 = vec3(u_xlat16_13.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_6.x = u_xlat16_1.z * u_xlat10_0.x + u_xlat16_6.x;
            vec3 txVec28 = vec3(u_xlat16_41.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_23 = u_xlat16_1.w * u_xlat10_0.x + u_xlat16_6.x;
        }
    }
    u_xlat16_41.x = (-u_xlat16_5) + 1.0;
    u_xlat16_5 = u_xlat16_23 * u_xlat16_41.x + u_xlat16_5;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat15.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat1 = texture2D(_Diff, u_xlat15.xy);
    u_xlat54 = log2(u_xlat16_5);
    u_xlat54 = u_xlat54 * _Shadows_PW;
    u_xlat54 = exp2(u_xlat54);
    u_xlat15.xyz = vec3(u_xlat54) * u_xlat1.xyz;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat15.xyz;
    u_xlat17.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat54 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 / _FogDistance;
    u_xlat69 = max(_FogFade, 0.0);
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * u_xlat69;
    u_xlat54 = exp2(u_xlat54);
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat15.xyz + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat54);
    u_xlat1.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat16.xyz;
    u_xlat0.x = u_xlat1.w + (-_Cutout);
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	float _Shadows_PW;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _Cutout;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Diff;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
lowp float u_xlat10_11;
mediump vec2 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec4 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
vec3 u_xlat17;
lowp float u_xlat10_18;
float u_xlat19;
mediump float u_xlat16_23;
lowp float u_xlat10_36;
bool u_xlatb36;
mediump vec2 u_xlat16_41;
mediump vec2 u_xlat16_42;
mediump vec2 u_xlat16_43;
mediump vec2 u_xlat16_44;
mediump vec2 u_xlat16_48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_59;
float u_xlat69;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlatb54 = _ShadowBias.z!=0.0;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
    u_xlat0.xyz = (bool(u_xlatb54)) ? u_xlat0.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat4;
    u_xlat2 = u_xlat0.yyyy * u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = u_xlat3 * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat4 + u_xlat0;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat16_5 = (-_ShadowBias.w) + 1.0;
    u_xlatb36 = _softShadowQuality==1.0;
    if(u_xlatb36){
        u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat1.z = 0.0;
        u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
        vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
        u_xlat1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
        vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
        vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
        vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat1.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_23 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb36 = _softShadowQuality==2.0;
        if(u_xlatb36){
            u_xlat16_41.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_41.xy = floor(u_xlat16_41.xy);
            u_xlat16_6.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_41.xy);
            u_xlat16_1 = u_xlat16_6.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_2 = u_xlat16_1.xxzz * u_xlat16_1.xxzz;
            u_xlat16_42.xy = u_xlat16_2.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_7.xy = u_xlat16_2.xz * vec2(0.5, 0.5) + (-u_xlat16_6.xy);
            u_xlat16_43.xy = (-u_xlat16_6.xy) + vec2(1.0, 1.0);
            u_xlat16_8.xy = min(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_43.xy;
            u_xlat16_6.xy = max(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_6.xy = (-u_xlat16_6.xy) * u_xlat16_6.xy + u_xlat16_1.yw;
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_6.xy = u_xlat16_6.xy + vec2(1.0, 1.0);
            u_xlat16_2.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_3.xy = u_xlat16_43.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_4.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_6.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_1.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_2.z = u_xlat16_4.x;
            u_xlat16_2.w = u_xlat16_6.x;
            u_xlat16_3.z = u_xlat16_7.x;
            u_xlat16_3.w = u_xlat16_42.x;
            u_xlat16_1 = u_xlat16_2.zwxz + u_xlat16_3.zwxz;
            u_xlat16_4.z = u_xlat16_2.y;
            u_xlat16_4.w = u_xlat16_6.y;
            u_xlat16_7.z = u_xlat16_3.y;
            u_xlat16_7.w = u_xlat16_42.y;
            u_xlat16_6.xyz = u_xlat16_4.zyw + u_xlat16_7.zyw;
            u_xlat16_8.xyz = u_xlat16_3.xzw / u_xlat16_1.zwy;
            u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_7.xyz = u_xlat16_7.zyw / u_xlat16_6.xyz;
            u_xlat16_7.xyz = u_xlat16_7.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_2.xyz = u_xlat16_8.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_3.xyz = u_xlat16_7.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_2.w = u_xlat16_3.x;
            u_xlat16_4 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_2.ywxw;
            u_xlat16_7.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_2.zw;
            u_xlat16_3.w = u_xlat16_2.y;
            u_xlat16_2.yw = u_xlat16_3.yz;
            u_xlat16_8 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_2.xyzy;
            u_xlat16_3 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.wywz;
            u_xlat16_2 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_2.xwzw;
            u_xlat16_9 = u_xlat16_1.zwyz * u_xlat16_6.xxxy;
            u_xlat16_10 = u_xlat16_1 * u_xlat16_6.yyzz;
            u_xlat16_41.x = u_xlat16_1.y * u_xlat16_6.z;
            vec3 txVec4 = vec3(u_xlat16_4.xy,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_4.zw,u_xlat0.w);
            u_xlat10_11 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_59 = u_xlat16_9.y * u_xlat10_11;
            u_xlat16_59 = u_xlat16_9.x * u_xlat10_36 + u_xlat16_59;
            vec3 txVec6 = vec3(u_xlat16_7.xy,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_59 = u_xlat16_9.z * u_xlat10_36 + u_xlat16_59;
            vec3 txVec7 = vec3(u_xlat16_3.xy,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_59 = u_xlat16_9.w * u_xlat10_36 + u_xlat16_59;
            vec3 txVec8 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_59 = u_xlat16_10.x * u_xlat10_36 + u_xlat16_59;
            vec3 txVec9 = vec3(u_xlat16_8.zw,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_59 = u_xlat16_10.y * u_xlat10_36 + u_xlat16_59;
            vec3 txVec10 = vec3(u_xlat16_3.zw,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_59 = u_xlat16_10.z * u_xlat10_36 + u_xlat16_59;
            vec3 txVec11 = vec3(u_xlat16_2.xy,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_59 = u_xlat16_10.w * u_xlat10_36 + u_xlat16_59;
            vec3 txVec12 = vec3(u_xlat16_2.zw,u_xlat0.w);
            u_xlat10_36 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_23 = u_xlat16_41.x * u_xlat10_36 + u_xlat16_59;
        } else {
            u_xlat16_41.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_41.xy = floor(u_xlat16_41.xy);
            u_xlat16_6.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_41.xy);
            u_xlat16_1 = u_xlat16_6.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_2 = u_xlat16_1.xxzz * u_xlat16_1.xxzz;
            u_xlat16_3.yw = u_xlat16_2.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_42.xy = u_xlat16_2.xz * vec2(0.5, 0.5) + (-u_xlat16_6.xy);
            u_xlat16_7.xy = (-u_xlat16_6.xy) + vec2(1.0, 1.0);
            u_xlat16_43.xy = min(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_7.xy = (-u_xlat16_43.xy) * u_xlat16_43.xy + u_xlat16_7.xy;
            u_xlat16_43.xy = max(u_xlat16_6.xy, vec2(0.0, 0.0));
            u_xlat16_7.zw = (-u_xlat16_43.xy) * u_xlat16_43.xy + u_xlat16_1.yw;
            u_xlat16_7 = u_xlat16_7 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_1.z = u_xlat16_7.z * 0.0816320032;
            u_xlat16_2.xy = u_xlat16_42.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_42.xy = u_xlat16_7.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_2.z = u_xlat16_7.w * 0.0816320032;
            u_xlat16_1.x = u_xlat16_2.y;
            u_xlat16_1.yw = u_xlat16_6.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_4.xz = u_xlat16_6.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_4.y = u_xlat16_42.x;
            u_xlat16_4.w = u_xlat16_3.y;
            u_xlat16_1 = u_xlat16_1 + u_xlat16_4;
            u_xlat16_2.yw = u_xlat16_6.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_3.xz = u_xlat16_6.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_3.y = u_xlat16_42.y;
            u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
            u_xlat16_4 = u_xlat16_4 / u_xlat16_1;
            u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_3 = u_xlat16_3 / u_xlat16_2;
            u_xlat16_3 = u_xlat16_3 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_4 = u_xlat16_4.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_3 = u_xlat16_3.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_6.xzw = u_xlat16_4.yzw;
            u_xlat16_6.y = u_xlat16_3.x;
            u_xlat16_7 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_8.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_4.y = u_xlat16_6.y;
            u_xlat16_6.y = u_xlat16_3.z;
            u_xlat16_9 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_44.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_4.z = u_xlat16_6.y;
            u_xlat16_10 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyxz;
            u_xlat16_6.y = u_xlat16_3.w;
            u_xlat16_11 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_12.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_4.w = u_xlat16_6.y;
            u_xlat16_48.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xw;
            u_xlat16_3.xzw = u_xlat16_6.xzw;
            u_xlat16_6 = u_xlat16_41.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
            u_xlat16_13.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.wy;
            u_xlat16_3.x = u_xlat16_4.x;
            u_xlat16_41.xy = u_xlat16_41.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.xy;
            u_xlat16_3 = u_xlat16_1 * u_xlat16_2.xxxx;
            u_xlat16_4 = u_xlat16_1 * u_xlat16_2.yyyy;
            u_xlat16_14 = u_xlat16_1 * u_xlat16_2.zzzz;
            u_xlat16_1 = u_xlat16_1 * u_xlat16_2.wwww;
            vec3 txVec13 = vec3(u_xlat16_7.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_7.zw,u_xlat0.w);
            u_xlat10_18 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_7.x = u_xlat10_18 * u_xlat16_3.y;
            u_xlat16_7.x = u_xlat16_3.x * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec15 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_7.x = u_xlat16_3.z * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec16 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_7.x = u_xlat16_3.w * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec17 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_7.x = u_xlat16_4.x * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec18 = vec3(u_xlat16_9.zw,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_7.x = u_xlat16_4.y * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec19 = vec3(u_xlat16_44.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_7.x = u_xlat16_4.z * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec20 = vec3(u_xlat16_10.zw,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_7.x = u_xlat16_4.w * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec21 = vec3(u_xlat16_11.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_7.x = u_xlat16_14.x * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec22 = vec3(u_xlat16_11.zw,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_7.x = u_xlat16_14.y * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec23 = vec3(u_xlat16_12.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_7.x = u_xlat16_14.z * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec24 = vec3(u_xlat16_48.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_7.x = u_xlat16_14.w * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec25 = vec3(u_xlat16_6.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_6.x = u_xlat16_1.x * u_xlat10_0.x + u_xlat16_7.x;
            vec3 txVec26 = vec3(u_xlat16_6.zw,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_6.x = u_xlat16_1.y * u_xlat10_0.x + u_xlat16_6.x;
            vec3 txVec27 = vec3(u_xlat16_13.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_6.x = u_xlat16_1.z * u_xlat10_0.x + u_xlat16_6.x;
            vec3 txVec28 = vec3(u_xlat16_41.xy,u_xlat0.w);
            u_xlat10_0.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_23 = u_xlat16_1.w * u_xlat10_0.x + u_xlat16_6.x;
        }
    }
    u_xlat16_41.x = (-u_xlat16_5) + 1.0;
    u_xlat16_5 = u_xlat16_23 * u_xlat16_41.x + u_xlat16_5;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat15.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat1 = texture2D(_Diff, u_xlat15.xy);
    u_xlat54 = log2(u_xlat16_5);
    u_xlat54 = u_xlat54 * _Shadows_PW;
    u_xlat54 = exp2(u_xlat54);
    u_xlat15.xyz = vec3(u_xlat54) * u_xlat1.xyz;
    u_xlat16.xyz = u_xlat0.xyz * u_xlat15.xyz;
    u_xlat17.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat54 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 / _FogDistance;
    u_xlat69 = max(_FogFade, 0.0);
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * u_xlat69;
    u_xlat54 = exp2(u_xlat54);
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat15.xyz + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat54);
    u_xlat1.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat16.xyz;
    u_xlat0.x = u_xlat1.w + (-_Cutout);
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = u_xlat1;
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
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "SHADOWSUPPORT" = "true" }
  GpuProgramID 106083
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
CustomEditor "ShaderForgeMaterialInspector"
}