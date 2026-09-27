//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PBR/Hero_Pbr_Show2.0_RampRim" {
Properties {

_Intensity ("整体强度", Float) = 1.0

_Alpha ("正面不透明度", Range(0, 1)) = 1.0

_Shadow_Color ("接收投影颜色", Color) = (0,0,0,1)

_DirectionalLight_Color ("平行光颜色", Color) = (1,1,1,1)

_Ambient_Color ("环境光颜色", Color) = (0.5,0.5,0.5,1)

_AdditionalRefAlpha ("反射部分不透明度", Range(0, 10)) = 0.0

_MainTex ("MainTex", 2D) = "white" { }

_Normal ("法线贴图", 2D) = "bump" { }

_AO_Em_Sanshe ("R:AO G:边缘光 B:接受投影", 2D) = "white" { }

_AO_Intensity ("AO强度", Float) = 1.0

[Toggle] _EMISSION_ON ("自发光开关", Float) = 0.0

_EmissionTex ("自发光贴图(RGB)", 2D) = "black" { }

_Em_Intensity ("自发光强度", Float) = 1.0

_Em_Speed ("自发光呼吸速度", Float) = 0.0

_Metal_Intensity ("金属度强度", Float) = 1.0

_Rough_Intensity ("粗糙度强度", Float) = 1.0

[Space(10)] [Header(CubeMap)] _Cubemap ("Cubemap", Cube) = "_Skybox" { }

_Cube_Intensity ("Cube强度", Float) = 1.0

[Space(10)] [Header(Rim)] _Rim_Tex ("边缘光 R:扰动纹理 G:扰动遮罩 B:Ramp梯度", 2D) = "white" { }

_Rim_Ramp ("边缘光渐变Ramp，根据梯度图读取", 2D) = "white" { }

_Rim_Color ("边缘光颜色", Color) = (1,1,1,1)

_Rim_Intensity ("边缘光强度", Float) = 0.0

_Rim_X ("边缘光X轴偏移", Range(-1, 1)) = 0.0

_Rim_Y ("边缘光Y轴偏移", Range(-1, 1)) = 0.0

[Enum(1U,0,2U,1,3U,2)] _RimNoise_UV ("边缘光扰动纹理&遮罩UV选择", Float) = 1.0

_RimNoise_Speed ("XY:边缘光扰动流速 W:扰动强度", Vector) = (0,0,0,0)

[Space(8)] _Rim2_Threshold ("边缘光2阈值", Range(0, 255)) = 0.0

_Rim2_Color ("边缘光2颜色", Color) = (1,1,1,1)

_Rim2_Intensity ("边缘光2强度", Float) = 0.0

_Rim2_X ("边缘光2X轴偏移", Range(-1, 1)) = 0.0

_Rim2_Y ("边缘光2Y轴偏移", Range(-1, 1)) = 0.0

[Space(10)] [Header(LiuGuang)] [Toggle(_LG_ON)] _LG_ON ("流光开关", Float) = 0.0

[Toggle] _Use_2U ("流光纹理&遮罩使用2U", Float) = 0.0

[Toggle] _USE_UVMAP ("流光使用贴图自定义UV", Float) = 0.0

_LG_UVMap ("R:流光遮罩 GB:流光自定义UV贴图(GB=UV)", 2D) = "white" { }

_LG_Tex ("R:流光纹理 G:背面扰动纹理(↓下面用↓)", 2D) = "black" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Speed ("XY:流光流速 W:流光强度", Vector) = (0,0,0,1)

[Space(10)] [Header(Shadow)] _Delta_ShadowCenter ("接收投影中心坐标偏移（默认模型中心点,w=-1取消遮罩）", Vector) = (0,0,0,0)

[PowerSlider(2.0)] _ShadowIntensity ("接收投影强度", Range(0, 3)) = 1.0

}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Pass {
 Name "ForwardBase"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 30044
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat16;
mediump vec3 u_xlat16_16;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat26;
mediump float u_xlat16_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat16_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat42) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb43 = !!(u_xlat30>=1.0);
#else
        u_xlatb43 = u_xlat30>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5.x = !!(0.0>=u_xlat30);
#else
        u_xlatb5.x = 0.0>=u_xlat30;
#endif
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb5.x = !!(0.0<_UsePCF);
#else
            u_xlatb5.x = 0.0<_UsePCF;
#endif
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat30<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat30<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat16_5.x = textureLod(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb30 = !!(u_xlat30<u_xlat5.x);
#else
                u_xlatb30 = u_xlat30<u_xlat5.x;
#endif
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat43 = 1.0;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat16_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat40 = min(u_xlat40, 20.0);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_11 = textureLod(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat16_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat16_11.xyz;
    u_xlat10.xzw = u_xlat16_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat16_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_26 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3 = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3 * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(_Rim2_Threshold<u_xlat42);
#else
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
#endif
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat43 = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat43 = (-u_xlat3.x) * u_xlat16_26 + u_xlat43;
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat43 * -2.0 + 3.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat43 * u_xlat6.x;
    u_xlat43 = min(u_xlat43, 1.0);
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat26 = (-u_xlat3.x) * u_xlat16_26 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat1.x;
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat1.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat43 : u_xlat26;
    u_xlat16_16.xyz = texture(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat26 = u_xlat3.x * u_xlat16_5.y;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(u_xlat26);
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb26 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb26){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat6.xyz = u_xlat16_0.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat6.xyz;
        u_xlat42 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat42);
        u_xlat42 = _Time.y * _Em_Speed;
        u_xlat42 = sin(u_xlat42);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat42)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat6.xyz = vec3(u_xlat40) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat16;
mediump vec3 u_xlat16_16;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat26;
mediump float u_xlat16_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat16_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat42) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb43 = !!(u_xlat30>=1.0);
#else
        u_xlatb43 = u_xlat30>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5.x = !!(0.0>=u_xlat30);
#else
        u_xlatb5.x = 0.0>=u_xlat30;
#endif
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb5.x = !!(0.0<_UsePCF);
#else
            u_xlatb5.x = 0.0<_UsePCF;
#endif
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat30<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat30<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat16_5.x = textureLod(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb30 = !!(u_xlat30<u_xlat5.x);
#else
                u_xlatb30 = u_xlat30<u_xlat5.x;
#endif
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat43 = 1.0;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat16_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat40 = min(u_xlat40, 20.0);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_11 = textureLod(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat16_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat16_11.xyz;
    u_xlat10.xzw = u_xlat16_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat16_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_26 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3 = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3 * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(_Rim2_Threshold<u_xlat42);
#else
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
#endif
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat43 = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat43 = (-u_xlat3.x) * u_xlat16_26 + u_xlat43;
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat43 * -2.0 + 3.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat43 * u_xlat6.x;
    u_xlat43 = min(u_xlat43, 1.0);
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat26 = (-u_xlat3.x) * u_xlat16_26 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat1.x;
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat1.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat43 : u_xlat26;
    u_xlat16_16.xyz = texture(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat26 = u_xlat3.x * u_xlat16_5.y;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(u_xlat26);
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb26 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb26){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat6.xyz = u_xlat16_0.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat6.xyz;
        u_xlat42 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat42);
        u_xlat42 = _Time.y * _Em_Speed;
        u_xlat42 = sin(u_xlat42);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat42)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat6.xyz = vec3(u_xlat40) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
lowp vec4 u_xlat10_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat16;
lowp vec3 u_xlat10_16;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat26;
lowp float u_xlat10_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_5.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat10_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
        u_xlatb43 = u_xlat30>=1.0;
        u_xlatb5.x = 0.0>=u_xlat30;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
            u_xlatb5.x = 0.0<_UsePCF;
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat30<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat10_5.x = texture2DLodEXT(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5.x) + 1.0;
                u_xlatb30 = u_xlat30<u_xlat5.x;
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat43 = 1.0;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat10_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat40 = min(u_xlat40, 20.0);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_11 = textureCubeLodEXT(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat10_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat10_11.xyz;
    u_xlat10.xzw = u_xlat10_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat10_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_26 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3 = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3 * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat43 = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat43 = (-u_xlat3.x) * u_xlat10_26 + u_xlat43;
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
    u_xlat6.x = u_xlat43 * -2.0 + 3.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat43 * u_xlat6.x;
    u_xlat43 = min(u_xlat43, 1.0);
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat26 = (-u_xlat3.x) * u_xlat10_26 + u_xlat1.x;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat1.x = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat1.x;
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat1.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat43 : u_xlat26;
    u_xlat10_16.xyz = texture2D(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat26 = u_xlat3.x * u_xlat10_5.y;
    u_xlat3.xyz = u_xlat10_16.xyz * vec3(u_xlat26);
    u_xlatb26 = _EMISSION_ON==1.0;
    if(u_xlatb26){
        u_xlat10_0.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat6.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat6.xyz = u_xlat10_0.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat6.xyz;
        u_xlat42 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat42);
        u_xlat42 = _Time.y * _Em_Speed;
        u_xlat42 = sin(u_xlat42);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat42)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat6.xyz = vec3(u_xlat40) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
lowp vec4 u_xlat10_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat16;
lowp vec3 u_xlat10_16;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat26;
lowp float u_xlat10_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_5.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat10_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
        u_xlatb43 = u_xlat30>=1.0;
        u_xlatb5.x = 0.0>=u_xlat30;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
            u_xlatb5.x = 0.0<_UsePCF;
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat30<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat10_5.x = texture2DLodEXT(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5.x) + 1.0;
                u_xlatb30 = u_xlat30<u_xlat5.x;
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat43 = 1.0;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat10_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat40 = min(u_xlat40, 20.0);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_11 = textureCubeLodEXT(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat10_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat10_11.xyz;
    u_xlat10.xzw = u_xlat10_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat10_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_26 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3 = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3 * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat43 = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat43 = (-u_xlat3.x) * u_xlat10_26 + u_xlat43;
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
    u_xlat6.x = u_xlat43 * -2.0 + 3.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat43 * u_xlat6.x;
    u_xlat43 = min(u_xlat43, 1.0);
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat26 = (-u_xlat3.x) * u_xlat10_26 + u_xlat1.x;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat1.x = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat1.x;
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat1.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat43 : u_xlat26;
    u_xlat10_16.xyz = texture2D(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat26 = u_xlat3.x * u_xlat10_5.y;
    u_xlat3.xyz = u_xlat10_16.xyz * vec3(u_xlat26);
    u_xlatb26 = _EMISSION_ON==1.0;
    if(u_xlatb26){
        u_xlat10_0.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat6.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat6.xyz = u_xlat10_0.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat6.xyz;
        u_xlat42 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat42);
        u_xlat42 = _Time.y * _Em_Speed;
        u_xlat42 = sin(u_xlat42);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat42)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat6.xyz = vec3(u_xlat40) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(8) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(9) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat16;
mediump vec3 u_xlat16_16;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat26;
mediump float u_xlat16_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat16_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat42) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb43 = !!(u_xlat30>=1.0);
#else
        u_xlatb43 = u_xlat30>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5.x = !!(0.0>=u_xlat30);
#else
        u_xlatb5.x = 0.0>=u_xlat30;
#endif
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb5.x = !!(0.0<_UsePCF);
#else
            u_xlatb5.x = 0.0<_UsePCF;
#endif
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat30<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat30<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat16_5.x = textureLod(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb30 = !!(u_xlat30<u_xlat5.x);
#else
                u_xlatb30 = u_xlat30<u_xlat5.x;
#endif
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat6.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat6.xyz = u_xlat6.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat30 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat5.x = (-_LightShadowData.x) + 1.0;
        u_xlat43 = u_xlat30 * u_xlat5.x + _LightShadowData.x;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat16_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat40 = min(u_xlat40, 20.0);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_11 = textureLod(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat16_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat16_11.xyz;
    u_xlat10.xzw = u_xlat16_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat16_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_26 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3 = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3 * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(_Rim2_Threshold<u_xlat42);
#else
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
#endif
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat43 = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat43 = (-u_xlat3.x) * u_xlat16_26 + u_xlat43;
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat43 * -2.0 + 3.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat43 * u_xlat6.x;
    u_xlat43 = min(u_xlat43, 1.0);
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat26 = (-u_xlat3.x) * u_xlat16_26 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat1.x;
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat1.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat43 : u_xlat26;
    u_xlat16_16.xyz = texture(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat26 = u_xlat3.x * u_xlat16_5.y;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(u_xlat26);
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb26 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb26){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat6.xyz = u_xlat16_0.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat6.xyz;
        u_xlat42 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat42);
        u_xlat42 = _Time.y * _Em_Speed;
        u_xlat42 = sin(u_xlat42);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat42)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat6.xyz = vec3(u_xlat40) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(8) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(9) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat16;
mediump vec3 u_xlat16_16;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat26;
mediump float u_xlat16_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat16_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat42) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb43 = !!(u_xlat30>=1.0);
#else
        u_xlatb43 = u_xlat30>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5.x = !!(0.0>=u_xlat30);
#else
        u_xlatb5.x = 0.0>=u_xlat30;
#endif
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb5.x = !!(0.0<_UsePCF);
#else
            u_xlatb5.x = 0.0<_UsePCF;
#endif
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat30<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat30<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat16_5.x = textureLod(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb30 = !!(u_xlat30<u_xlat5.x);
#else
                u_xlatb30 = u_xlat30<u_xlat5.x;
#endif
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat6.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat6.xyz = u_xlat6.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat30 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat5.x = (-_LightShadowData.x) + 1.0;
        u_xlat43 = u_xlat30 * u_xlat5.x + _LightShadowData.x;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat16_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat40 = min(u_xlat40, 20.0);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_11 = textureLod(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat16_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat16_11.xyz;
    u_xlat10.xzw = u_xlat16_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat16_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_26 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3 = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3 * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(_Rim2_Threshold<u_xlat42);
#else
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
#endif
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat43 = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat43 = (-u_xlat3.x) * u_xlat16_26 + u_xlat43;
#ifdef UNITY_ADRENO_ES3
    u_xlat43 = min(max(u_xlat43, 0.0), 1.0);
#else
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat43 * -2.0 + 3.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat43 * u_xlat6.x;
    u_xlat43 = min(u_xlat43, 1.0);
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat26 = (-u_xlat3.x) * u_xlat16_26 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat1.x;
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat1.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat43 : u_xlat26;
    u_xlat16_16.xyz = texture(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat26 = u_xlat3.x * u_xlat16_5.y;
    u_xlat3.xyz = u_xlat16_16.xyz * vec3(u_xlat26);
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb26 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb26){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat6.xyz = u_xlat16_0.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat6.xyz;
        u_xlat42 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat42);
        u_xlat42 = _Time.y * _Em_Speed;
        u_xlat42 = sin(u_xlat42);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat42)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat6.xyz = vec3(u_xlat40) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
lowp vec4 u_xlat10_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat16;
lowp vec3 u_xlat10_16;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat26;
lowp float u_xlat10_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_5.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat10_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
        u_xlatb43 = u_xlat30>=1.0;
        u_xlatb5.x = 0.0>=u_xlat30;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
            u_xlatb5.x = 0.0<_UsePCF;
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat30<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat10_5.x = texture2DLodEXT(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5.x) + 1.0;
                u_xlatb30 = u_xlat30<u_xlat5.x;
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat6.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat6.xyz = u_xlat6.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat30 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat5.x = (-_LightShadowData.x) + 1.0;
        u_xlat43 = u_xlat30 * u_xlat5.x + _LightShadowData.x;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat10_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat40 = min(u_xlat40, 20.0);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_11 = textureCubeLodEXT(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat10_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat10_11.xyz;
    u_xlat10.xzw = u_xlat10_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat10_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_26 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3 = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3 * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat43 = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat43 = (-u_xlat3.x) * u_xlat10_26 + u_xlat43;
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
    u_xlat6.x = u_xlat43 * -2.0 + 3.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat43 * u_xlat6.x;
    u_xlat43 = min(u_xlat43, 1.0);
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat26 = (-u_xlat3.x) * u_xlat10_26 + u_xlat1.x;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat1.x = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat1.x;
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat1.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat43 : u_xlat26;
    u_xlat10_16.xyz = texture2D(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat26 = u_xlat3.x * u_xlat10_5.y;
    u_xlat3.xyz = u_xlat10_16.xyz * vec3(u_xlat26);
    u_xlatb26 = _EMISSION_ON==1.0;
    if(u_xlatb26){
        u_xlat10_0.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat6.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat6.xyz = u_xlat10_0.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat6.xyz;
        u_xlat42 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat42);
        u_xlat42 = _Time.y * _Em_Speed;
        u_xlat42 = sin(u_xlat42);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat42)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat6.xyz = vec3(u_xlat40) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
lowp vec4 u_xlat10_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat16;
lowp vec3 u_xlat10_16;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat26;
lowp float u_xlat10_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_5.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat10_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
        u_xlatb43 = u_xlat30>=1.0;
        u_xlatb5.x = 0.0>=u_xlat30;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
            u_xlatb5.x = 0.0<_UsePCF;
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat30<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat10_5.x = texture2DLodEXT(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5.x) + 1.0;
                u_xlatb30 = u_xlat30<u_xlat5.x;
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat6.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat6.xyz = u_xlat6.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat30 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat5.x = (-_LightShadowData.x) + 1.0;
        u_xlat43 = u_xlat30 * u_xlat5.x + _LightShadowData.x;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat10_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat40 = min(u_xlat40, 20.0);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_11 = textureCubeLodEXT(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat10_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat10_11.xyz;
    u_xlat10.xzw = u_xlat10_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat10_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_26 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3 = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3 * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat43 = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat43 = (-u_xlat3.x) * u_xlat10_26 + u_xlat43;
    u_xlat43 = clamp(u_xlat43, 0.0, 1.0);
    u_xlat6.x = u_xlat43 * -2.0 + 3.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat43 * u_xlat6.x;
    u_xlat43 = min(u_xlat43, 1.0);
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat26 = (-u_xlat3.x) * u_xlat10_26 + u_xlat1.x;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat1.x = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat1.x;
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat1.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat43 : u_xlat26;
    u_xlat10_16.xyz = texture2D(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat26 = u_xlat3.x * u_xlat10_5.y;
    u_xlat3.xyz = u_xlat10_16.xyz * vec3(u_xlat26);
    u_xlatb26 = _EMISSION_ON==1.0;
    if(u_xlatb26){
        u_xlat10_0.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat6.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat6.xyz = u_xlat10_0.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat6.xyz;
        u_xlat42 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat42);
        u_xlat42 = _Time.y * _Em_Speed;
        u_xlat42 = sin(u_xlat42);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat42)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat6.xyz = vec3(u_xlat40) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
float u_xlat14;
vec2 u_xlat16;
vec3 u_xlat19;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat26;
mediump float u_xlat16_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
mediump float u_xlat16_43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat16_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat42) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb43 = !!(u_xlat30>=1.0);
#else
        u_xlatb43 = u_xlat30>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5.x = !!(0.0>=u_xlat30);
#else
        u_xlatb5.x = 0.0>=u_xlat30;
#endif
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb5.x = !!(0.0<_UsePCF);
#else
            u_xlatb5.x = 0.0<_UsePCF;
#endif
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat30<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat30<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat16_5.x = textureLod(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb30 = !!(u_xlat30<u_xlat5.x);
#else
                u_xlatb30 = u_xlat30<u_xlat5.x;
#endif
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat43 = 1.0;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat16_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat40, 0.0);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_11 = textureLod(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat16_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat16_11.xyz;
    u_xlat10.xzw = u_xlat16_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat16_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_USE_UVMAP==1.0);
#else
    u_xlatb26 = _USE_UVMAP==1.0;
#endif
    if(u_xlatb26){
        u_xlat3.xw = texture(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_26 = texture(_LG_Tex, u_xlat3.xw).x;
    u_xlat16_3.x = texture(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat26 = u_xlat16_26 * u_xlat16_3.x;
    u_xlat26 = u_xlat26 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_43 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3.x = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3.x * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(_Rim2_Threshold<u_xlat42);
#else
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
#endif
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat6.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = (-u_xlat3.x) * u_xlat16_43 + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat19.x;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat11.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat11.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat16_43 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat14;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat19.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat14 = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat6.x : u_xlat1.x;
    u_xlat16_3.xyz = texture(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat1.x = u_xlat14 * u_xlat16_5.y;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb3 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb3){
        u_xlat16_3.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat11.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat11.xyz = u_xlat16_3.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat16_3.xyz * u_xlat11.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat1.www * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat8.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat19.xyz + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat26) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xzw + u_xlat3.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
float u_xlat14;
vec2 u_xlat16;
vec3 u_xlat19;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat26;
mediump float u_xlat16_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
mediump float u_xlat16_43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat16_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat42) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb43 = !!(u_xlat30>=1.0);
#else
        u_xlatb43 = u_xlat30>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5.x = !!(0.0>=u_xlat30);
#else
        u_xlatb5.x = 0.0>=u_xlat30;
#endif
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb5.x = !!(0.0<_UsePCF);
#else
            u_xlatb5.x = 0.0<_UsePCF;
#endif
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat30<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat30<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat16_5.x = textureLod(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb30 = !!(u_xlat30<u_xlat5.x);
#else
                u_xlatb30 = u_xlat30<u_xlat5.x;
#endif
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat43 = 1.0;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat16_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat40, 0.0);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_11 = textureLod(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat16_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat16_11.xyz;
    u_xlat10.xzw = u_xlat16_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat16_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_USE_UVMAP==1.0);
#else
    u_xlatb26 = _USE_UVMAP==1.0;
#endif
    if(u_xlatb26){
        u_xlat3.xw = texture(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_26 = texture(_LG_Tex, u_xlat3.xw).x;
    u_xlat16_3.x = texture(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat26 = u_xlat16_26 * u_xlat16_3.x;
    u_xlat26 = u_xlat26 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_43 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3.x = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3.x * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(_Rim2_Threshold<u_xlat42);
#else
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
#endif
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat6.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = (-u_xlat3.x) * u_xlat16_43 + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat19.x;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat11.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat11.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat16_43 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat14;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat19.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat14 = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat6.x : u_xlat1.x;
    u_xlat16_3.xyz = texture(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat1.x = u_xlat14 * u_xlat16_5.y;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb3 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb3){
        u_xlat16_3.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat11.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat11.xyz = u_xlat16_3.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat16_3.xyz * u_xlat11.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat1.www * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat8.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat19.xyz + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat26) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xzw + u_xlat3.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
vec3 u_xlat11;
lowp vec4 u_xlat10_11;
mediump vec3 u_xlat16_12;
float u_xlat14;
vec2 u_xlat16;
vec3 u_xlat19;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat26;
lowp float u_xlat10_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
lowp float u_xlat10_43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_5.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat10_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
        u_xlatb43 = u_xlat30>=1.0;
        u_xlatb5.x = 0.0>=u_xlat30;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
            u_xlatb5.x = 0.0<_UsePCF;
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat30<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat10_5.x = texture2DLodEXT(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5.x) + 1.0;
                u_xlatb30 = u_xlat30<u_xlat5.x;
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat43 = 1.0;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat10_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat40, 0.0);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_11 = textureCubeLodEXT(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat10_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat10_11.xyz;
    u_xlat10.xzw = u_xlat10_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat10_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlatb26 = _USE_UVMAP==1.0;
    if(u_xlatb26){
        u_xlat3.xw = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_26 = texture2D(_LG_Tex, u_xlat3.xw).x;
    u_xlat10_3.x = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat26 = u_xlat10_26 * u_xlat10_3.x;
    u_xlat26 = u_xlat26 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_43 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3.x = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3.x * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat6.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = (-u_xlat3.x) * u_xlat10_43 + u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat19.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat19.x;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat11.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat11.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat10_43 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat14 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat14;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat19.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat14 = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat6.x : u_xlat1.x;
    u_xlat10_3.xyz = texture2D(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat1.x = u_xlat14 * u_xlat10_5.y;
    u_xlat1.xyz = u_xlat10_3.xyz * u_xlat1.xxx;
    u_xlatb3 = _EMISSION_ON==1.0;
    if(u_xlatb3){
        u_xlat10_3.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat11.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat11.xyz = u_xlat10_3.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat10_3.xyz * u_xlat11.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat1.www * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat8.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat19.xyz + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat26) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xzw + u_xlat3.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
vec3 u_xlat11;
lowp vec4 u_xlat10_11;
mediump vec3 u_xlat16_12;
float u_xlat14;
vec2 u_xlat16;
vec3 u_xlat19;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat26;
lowp float u_xlat10_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
lowp float u_xlat10_43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_5.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat10_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
        u_xlatb43 = u_xlat30>=1.0;
        u_xlatb5.x = 0.0>=u_xlat30;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
            u_xlatb5.x = 0.0<_UsePCF;
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat30<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat10_5.x = texture2DLodEXT(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5.x) + 1.0;
                u_xlatb30 = u_xlat30<u_xlat5.x;
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat43 = 1.0;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat10_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat40, 0.0);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_11 = textureCubeLodEXT(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat10_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat10_11.xyz;
    u_xlat10.xzw = u_xlat10_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat10_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlatb26 = _USE_UVMAP==1.0;
    if(u_xlatb26){
        u_xlat3.xw = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_26 = texture2D(_LG_Tex, u_xlat3.xw).x;
    u_xlat10_3.x = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat26 = u_xlat10_26 * u_xlat10_3.x;
    u_xlat26 = u_xlat26 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_43 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3.x = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3.x * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat6.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = (-u_xlat3.x) * u_xlat10_43 + u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat19.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat19.x;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat11.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat11.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat10_43 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat14 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat14;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat19.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat14 = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat6.x : u_xlat1.x;
    u_xlat10_3.xyz = texture2D(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat1.x = u_xlat14 * u_xlat10_5.y;
    u_xlat1.xyz = u_xlat10_3.xyz * u_xlat1.xxx;
    u_xlatb3 = _EMISSION_ON==1.0;
    if(u_xlatb3){
        u_xlat10_3.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat11.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat11.xyz = u_xlat10_3.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat10_3.xyz * u_xlat11.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat1.www * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat8.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat19.xyz + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat26) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xzw + u_xlat3.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(10) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(11) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
float u_xlat14;
vec2 u_xlat16;
vec3 u_xlat19;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat26;
mediump float u_xlat16_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
mediump float u_xlat16_43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat16_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat42) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb43 = !!(u_xlat30>=1.0);
#else
        u_xlatb43 = u_xlat30>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5.x = !!(0.0>=u_xlat30);
#else
        u_xlatb5.x = 0.0>=u_xlat30;
#endif
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb5.x = !!(0.0<_UsePCF);
#else
            u_xlatb5.x = 0.0<_UsePCF;
#endif
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat30<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat30<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat16_5.x = textureLod(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb30 = !!(u_xlat30<u_xlat5.x);
#else
                u_xlatb30 = u_xlat30<u_xlat5.x;
#endif
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat6.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat6.xyz = u_xlat6.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat30 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat5.x = (-_LightShadowData.x) + 1.0;
        u_xlat43 = u_xlat30 * u_xlat5.x + _LightShadowData.x;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat16_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat40, 0.0);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_11 = textureLod(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat16_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat16_11.xyz;
    u_xlat10.xzw = u_xlat16_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat16_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_USE_UVMAP==1.0);
#else
    u_xlatb26 = _USE_UVMAP==1.0;
#endif
    if(u_xlatb26){
        u_xlat3.xw = texture(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_26 = texture(_LG_Tex, u_xlat3.xw).x;
    u_xlat16_3.x = texture(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat26 = u_xlat16_26 * u_xlat16_3.x;
    u_xlat26 = u_xlat26 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_43 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3.x = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3.x * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(_Rim2_Threshold<u_xlat42);
#else
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
#endif
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat6.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = (-u_xlat3.x) * u_xlat16_43 + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat19.x;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat11.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat11.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat16_43 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat14;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat19.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat14 = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat6.x : u_xlat1.x;
    u_xlat16_3.xyz = texture(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat1.x = u_xlat14 * u_xlat16_5.y;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb3 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb3){
        u_xlat16_3.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat11.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat11.xyz = u_xlat16_3.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat16_3.xyz * u_xlat11.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat1.www * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat8.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat19.xyz + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat26) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xzw + u_xlat3.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(10) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(11) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
vec3 u_xlat11;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
float u_xlat14;
vec2 u_xlat16;
vec3 u_xlat19;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat26;
mediump float u_xlat16_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
mediump float u_xlat16_43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat16_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat42 = (-u_xlat42) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb43 = !!(u_xlat30>=1.0);
#else
        u_xlatb43 = u_xlat30>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5.x = !!(0.0>=u_xlat30);
#else
        u_xlatb5.x = 0.0>=u_xlat30;
#endif
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb5.x = !!(0.0<_UsePCF);
#else
            u_xlatb5.x = 0.0<_UsePCF;
#endif
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat30<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat30<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat16_5.x = textureLod(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb30 = !!(u_xlat30<u_xlat5.x);
#else
                u_xlatb30 = u_xlat30<u_xlat5.x;
#endif
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat6.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat6.xyz = u_xlat6.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat30 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat5.x = (-_LightShadowData.x) + 1.0;
        u_xlat43 = u_xlat30 * u_xlat5.x + _LightShadowData.x;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat16_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat40, 0.0);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_11 = textureLod(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat16_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat16_11.xyz;
    u_xlat10.xzw = u_xlat16_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat16_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_USE_UVMAP==1.0);
#else
    u_xlatb26 = _USE_UVMAP==1.0;
#endif
    if(u_xlatb26){
        u_xlat3.xw = texture(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_26 = texture(_LG_Tex, u_xlat3.xw).x;
    u_xlat16_3.x = texture(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat26 = u_xlat16_26 * u_xlat16_3.x;
    u_xlat26 = u_xlat26 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_43 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3.x = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3.x * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(_Rim2_Threshold<u_xlat42);
#else
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
#endif
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat6.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = (-u_xlat3.x) * u_xlat16_43 + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat19.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat19.x;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat11.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat11.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat16_43 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat14;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat19.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat14 = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat6.x : u_xlat1.x;
    u_xlat16_3.xyz = texture(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat1.x = u_xlat14 * u_xlat16_5.y;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb3 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb3){
        u_xlat16_3.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat11.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat11.xyz = u_xlat16_3.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat16_3.xyz * u_xlat11.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat1.www * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat8.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat19.xyz + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat26) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xzw + u_xlat3.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
vec3 u_xlat11;
lowp vec4 u_xlat10_11;
mediump vec3 u_xlat16_12;
float u_xlat14;
vec2 u_xlat16;
vec3 u_xlat19;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat26;
lowp float u_xlat10_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
lowp float u_xlat10_43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_5.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat10_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
        u_xlatb43 = u_xlat30>=1.0;
        u_xlatb5.x = 0.0>=u_xlat30;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
            u_xlatb5.x = 0.0<_UsePCF;
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat30<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat10_5.x = texture2DLodEXT(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5.x) + 1.0;
                u_xlatb30 = u_xlat30<u_xlat5.x;
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat6.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat6.xyz = u_xlat6.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat30 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat5.x = (-_LightShadowData.x) + 1.0;
        u_xlat43 = u_xlat30 * u_xlat5.x + _LightShadowData.x;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat10_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat40, 0.0);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_11 = textureCubeLodEXT(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat10_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat10_11.xyz;
    u_xlat10.xzw = u_xlat10_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat10_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlatb26 = _USE_UVMAP==1.0;
    if(u_xlatb26){
        u_xlat3.xw = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_26 = texture2D(_LG_Tex, u_xlat3.xw).x;
    u_xlat10_3.x = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat26 = u_xlat10_26 * u_xlat10_3.x;
    u_xlat26 = u_xlat26 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_43 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3.x = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3.x * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat6.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = (-u_xlat3.x) * u_xlat10_43 + u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat19.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat19.x;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat11.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat11.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat10_43 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat14 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat14;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat19.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat14 = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat6.x : u_xlat1.x;
    u_xlat10_3.xyz = texture2D(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat1.x = u_xlat14 * u_xlat10_5.y;
    u_xlat1.xyz = u_xlat10_3.xyz * u_xlat1.xxx;
    u_xlatb3 = _EMISSION_ON==1.0;
    if(u_xlatb3){
        u_xlat10_3.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat11.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat11.xyz = u_xlat10_3.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat10_3.xyz * u_xlat11.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat1.www * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat8.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat19.xyz + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat26) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xzw + u_xlat3.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
bvec4 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
vec3 u_xlat11;
lowp vec4 u_xlat10_11;
mediump vec3 u_xlat16_12;
float u_xlat14;
vec2 u_xlat16;
vec3 u_xlat19;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat26;
lowp float u_xlat10_26;
bool u_xlatb26;
float u_xlat30;
bool u_xlatb30;
float u_xlat32;
bvec2 u_xlatb32;
bool u_xlatb33;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
lowp float u_xlat10_43;
bool u_xlatb43;
int u_xlati44;
float u_xlat45;
int u_xlati45;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat26 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat1.xyz = vec3(u_xlat26) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_41 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_2.xyz = vec3(u_xlat16_41) * u_xlat16_2.xyz;
    u_xlat26 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat26 = max(u_xlat26, 0.0);
    u_xlat39 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat16.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_5.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat42 = (-u_xlat10_5.x) + 1.0;
    u_xlat42 = u_xlat42 * _AO_Intensity;
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlatb30 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb30){
        u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat2;
        u_xlat2 = u_xlat2 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
        u_xlat6.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat30 = (-u_xlat6.z) + 1.0;
        u_xlatb43 = u_xlat30>=1.0;
        u_xlatb5.x = 0.0>=u_xlat30;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb5.xw = lessThan(u_xlat6.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw;
        u_xlatb43 = u_xlatb43 || u_xlatb5.x;
        u_xlatb32.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), u_xlat6.xyxy).xy;
        u_xlatb43 = u_xlatb43 || u_xlatb32.x;
        u_xlatb43 = u_xlatb5.w || u_xlatb43;
        u_xlatb43 = u_xlatb32.y || u_xlatb43;
        if(u_xlatb43){
            u_xlat43 = 1.0;
        } else {
            u_xlatb5.x = 0.0<_UsePCF;
            if(u_xlatb5.x){
                u_xlat5.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat32 = u_xlat5.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat6.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat30<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat32 = u_xlat32 + u_xlat20.x;
                    }
                    u_xlat5.x = u_xlat32;
                }
                u_xlat43 = u_xlat5.x * 0.111111112;
            } else {
                u_xlat10_5.x = texture2DLodEXT(_CustomShadowTex, u_xlat6.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5.x) + 1.0;
                u_xlatb30 = u_xlat30<u_xlat5.x;
                u_xlat43 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat6.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat6.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat6.xyz = u_xlat6.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat30 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat5.x = (-_LightShadowData.x) + 1.0;
        u_xlat43 = u_xlat30 * u_xlat5.x + _LightShadowData.x;
    }
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vs_TEXCOORD2.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat30 = sqrt(u_xlat30);
    u_xlat5.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat30 = u_xlat30 * u_xlat5.x;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat30 = min(u_xlat30, 1.0);
    u_xlat43 = (-u_xlat43) + 1.0;
    u_xlat43 = (-u_xlat43) * _ShadowIntensity + 1.0;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat5.x = (-u_xlat30) + 1.0;
    u_xlat30 = u_xlat43 * u_xlat5.x + u_xlat30;
    u_xlat6.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz + _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat6.xyz) * u_xlat10_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat6.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat10_2.xyz * u_xlat6.xyz;
    u_xlat30 = (-u_xlat4.x) + 1.0;
    u_xlat8.xyz = u_xlat7.xyz * vec3(u_xlat30);
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.100000001);
    u_xlat43 = u_xlat4.y * u_xlat4.y;
    u_xlat45 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat40 = u_xlat40 * u_xlat45;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat43 = u_xlat43 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat43 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat43 / u_xlat40;
    u_xlat40 = u_xlat40 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat40, 0.0);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat9.xyz = u_xlat4.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat30) * _Ambient_Color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10.xyz;
    u_xlat7.xyz = vec3(u_xlat42) * u_xlat7.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat10.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_11 = textureCubeLodEXT(_Cubemap, u_xlat10.xyz, u_xlat3.x);
    u_xlat10.xzw = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xzw = u_xlat10_11.xyz * u_xlat10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xzw = u_xlat10.xzw * u_xlat10_11.xyz;
    u_xlat10.xzw = u_xlat10_11.www * u_xlat10.xzw;
    u_xlat10.xzw = vec3(u_xlat42) * u_xlat10.xzw;
    u_xlat3.x = u_xlat10.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat42 = u_xlat10_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat6.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat42) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat6.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat6.xyz + u_xlat4.xyz;
    u_xlatb26 = _USE_UVMAP==1.0;
    if(u_xlatb26){
        u_xlat3.xw = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_26 = texture2D(_LG_Tex, u_xlat3.xw).x;
    u_xlat10_3.x = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat26 = u_xlat10_26 * u_xlat10_3.x;
    u_xlat26 = u_xlat26 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_43 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3.x = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3.x * _RimNoise_Speed.w;
    u_xlat42 = u_xlat16.y * 255.0;
    u_xlatb42 = _Rim2_Threshold<u_xlat42;
    u_xlat6.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat6.z = vs_TEXCOORD7.z;
    u_xlat6.x = dot(u_xlat1.xyz, u_xlat6.xyz);
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = (-u_xlat3.x) * u_xlat10_43 + u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat19.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat19.x;
    u_xlat6.x = min(u_xlat6.x, 1.0);
    u_xlat11.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat11.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat10_43 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat14 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat14;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat19.xyz = (bool(u_xlatb42)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat14 = (u_xlatb42) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat16.x = (u_xlatb42) ? u_xlat6.x : u_xlat1.x;
    u_xlat10_3.xyz = texture2D(_Rim_Ramp, u_xlat16.xy).xyz;
    u_xlat1.x = u_xlat14 * u_xlat10_5.y;
    u_xlat1.xyz = u_xlat10_3.xyz * u_xlat1.xxx;
    u_xlatb3 = _EMISSION_ON==1.0;
    if(u_xlatb3){
        u_xlat10_3.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat11.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat11.xyz = u_xlat10_3.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat10_3.xyz * u_xlat11.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat1.www * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat8.xyz * vec3(u_xlat39) + u_xlat7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat19.xyz + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat26) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xzw + u_xlat3.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat15;
mediump vec3 u_xlat16_15;
float u_xlat17;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat16_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat9.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat9.xyz, u_xlat3.x);
    u_xlat9.xzw = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat16_10.xyz;
    u_xlat9.xzw = u_xlat16_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat3.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat39 = u_xlat16_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = u_xlat3.xxx + (-u_xlat5.xyz);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_24 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3 = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3 * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_Rim2_Threshold<u_xlat39);
#else
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
#endif
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = (-u_xlat3.x) * u_xlat16_24 + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat17 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat17;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat24 = (-u_xlat3.x) * u_xlat16_24 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat1.xyz = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat5.x : u_xlat24;
    u_xlat16_15.xyz = texture(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat24 = u_xlat3.x * u_xlat16_28.y;
    u_xlat3.xyz = u_xlat16_15.xyz * vec3(u_xlat24);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb24 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb24){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
        u_xlat39 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat39);
        u_xlat39 = _Time.y * _Em_Speed;
        u_xlat39 = sin(u_xlat39);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat39)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat5.xyz = vec3(u_xlat37) * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat15;
mediump vec3 u_xlat16_15;
float u_xlat17;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat16_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat9.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat9.xyz, u_xlat3.x);
    u_xlat9.xzw = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat16_10.xyz;
    u_xlat9.xzw = u_xlat16_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat3.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat39 = u_xlat16_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = u_xlat3.xxx + (-u_xlat5.xyz);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_24 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3 = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3 * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_Rim2_Threshold<u_xlat39);
#else
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
#endif
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = (-u_xlat3.x) * u_xlat16_24 + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat17 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat17;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat24 = (-u_xlat3.x) * u_xlat16_24 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat1.xyz = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat5.x : u_xlat24;
    u_xlat16_15.xyz = texture(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat24 = u_xlat3.x * u_xlat16_28.y;
    u_xlat3.xyz = u_xlat16_15.xyz * vec3(u_xlat24);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb24 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb24){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
        u_xlat39 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat39);
        u_xlat39 = _Time.y * _Em_Speed;
        u_xlat39 = sin(u_xlat39);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat39)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat5.xyz = vec3(u_xlat37) * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat15;
lowp vec3 u_xlat10_15;
float u_xlat17;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat28;
lowp vec2 u_xlat10_28;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_28.xy = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat10_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat9.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_10 = textureCubeLodEXT(_Cubemap, u_xlat9.xyz, u_xlat3.x);
    u_xlat9.xzw = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10_10.xyz;
    u_xlat9.xzw = u_xlat10_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat3.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat39 = u_xlat10_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = u_xlat3.xxx + (-u_xlat5.xyz);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_24 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3 = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3 * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = (-u_xlat3.x) * u_xlat10_24 + u_xlat5.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat17 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat17;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat24 = (-u_xlat3.x) * u_xlat10_24 + u_xlat1.x;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat1.xyz = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat5.x : u_xlat24;
    u_xlat10_15.xyz = texture2D(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat24 = u_xlat3.x * u_xlat10_28.y;
    u_xlat3.xyz = u_xlat10_15.xyz * vec3(u_xlat24);
    u_xlatb24 = _EMISSION_ON==1.0;
    if(u_xlatb24){
        u_xlat10_0.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat5.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat5.xyz;
        u_xlat39 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat39);
        u_xlat39 = _Time.y * _Em_Speed;
        u_xlat39 = sin(u_xlat39);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat39)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat5.xyz = vec3(u_xlat37) * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat15;
lowp vec3 u_xlat10_15;
float u_xlat17;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat28;
lowp vec2 u_xlat10_28;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_28.xy = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat10_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat9.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_10 = textureCubeLodEXT(_Cubemap, u_xlat9.xyz, u_xlat3.x);
    u_xlat9.xzw = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10_10.xyz;
    u_xlat9.xzw = u_xlat10_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat3.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat39 = u_xlat10_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = u_xlat3.xxx + (-u_xlat5.xyz);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_24 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3 = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3 * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = (-u_xlat3.x) * u_xlat10_24 + u_xlat5.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat17 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat17;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat24 = (-u_xlat3.x) * u_xlat10_24 + u_xlat1.x;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat1.xyz = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat5.x : u_xlat24;
    u_xlat10_15.xyz = texture2D(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat24 = u_xlat3.x * u_xlat10_28.y;
    u_xlat3.xyz = u_xlat10_15.xyz * vec3(u_xlat24);
    u_xlatb24 = _EMISSION_ON==1.0;
    if(u_xlatb24){
        u_xlat10_0.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat5.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat5.xyz;
        u_xlat39 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat39);
        u_xlat39 = _Time.y * _Em_Speed;
        u_xlat39 = sin(u_xlat39);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat39)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat5.xyz = vec3(u_xlat37) * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(7) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(8) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec4 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec4 u_xlat24;
vec2 u_xlat28;
mediump vec3 u_xlat16_28;
mediump float u_xlat16_35;
float u_xlat50;
mediump float u_xlat16_50;
bool u_xlatb50;
float u_xlat54;
mediump float u_xlat10_54;
bool u_xlatb54;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_67;
float u_xlat75;
float u_xlat76;
mediump float u_xlat16_77;
float u_xlat78;
bool u_xlatb78;
float u_xlat79;
mediump float u_xlat10_79;
mediump float u_xlat16_85;
float u_xlat95;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat50 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat1.xyz = vec3(u_xlat50) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_77 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_2.xyz = vec3(u_xlat16_77) * u_xlat16_2.xyz;
    u_xlat50 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat50 = max(u_xlat50, 0.0);
    u_xlat75 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat76 = max(u_xlat76, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat28.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat78 = (-u_xlat16_5.x) + 1.0;
    u_xlat78 = u_xlat78 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat78) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb54 = _ShadowBias.z!=0.0;
#endif
    u_xlat79 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat6.xyz = vec3(u_xlat79) * _WorldSpaceLightPos0.xyz;
    u_xlat79 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
    u_xlat79 = (-u_xlat79) * u_xlat79 + 1.0;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 * _ShadowBias.z;
    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat79) + vs_TEXCOORD2.xyz;
    u_xlat6.xyz = (bool(u_xlatb54)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat8;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat9;
    u_xlat7 = u_xlat6.yyyy * u_xlat7;
    u_xlat2 = u_xlat2 * u_xlat6.xxxx + u_xlat7;
    u_xlat2 = u_xlat8 * u_xlat6.zzzz + u_xlat2;
    u_xlat2 = u_xlat9 + u_xlat2;
    u_xlat54 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat2.z + (-u_xlat54);
    u_xlat79 = max((-u_xlat2.w), u_xlat54);
    u_xlat79 = (-u_xlat54) + u_xlat79;
    u_xlat2.z = _ShadowBias.y * u_xlat79 + u_xlat54;
    u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_10.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_softShadowQuality==1.0);
#else
    u_xlatb54 = _softShadowQuality==1.0;
#endif
    if(u_xlatb54){
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat2.xyw + u_xlat6.xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_35 = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb54 = !!(_softShadowQuality==2.0);
#else
        u_xlatb54 = _softShadowQuality==2.0;
#endif
        if(u_xlatb54){
            u_xlat16_60.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_61.xy = u_xlat16_7.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_12.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_62.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_13.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_13.xy = (-u_xlat16_13.xy) * u_xlat16_13.xy + u_xlat16_62.xy;
            u_xlat16_11.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_6.yw;
            u_xlat16_13.xy = u_xlat16_13.xy + vec2(1.0, 1.0);
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_7.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_62.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_13.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_12.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_6.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_7.z = u_xlat16_9.x;
            u_xlat16_7.w = u_xlat16_11.x;
            u_xlat16_8.z = u_xlat16_12.x;
            u_xlat16_8.w = u_xlat16_61.x;
            u_xlat16_6 = u_xlat16_7.zwxz + u_xlat16_8.zwxz;
            u_xlat16_9.z = u_xlat16_7.y;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_12.z = u_xlat16_8.y;
            u_xlat16_12.w = u_xlat16_61.y;
            u_xlat16_11.xyz = u_xlat16_9.zyw + u_xlat16_12.zyw;
            u_xlat16_13.xyz = u_xlat16_8.xzw / u_xlat16_6.zwy;
            u_xlat16_13.xyz = u_xlat16_13.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_12.xyz = u_xlat16_12.zyw / u_xlat16_11.xyz;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_7.xyz = u_xlat16_13.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_8.xyz = u_xlat16_12.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_7.w = u_xlat16_8.x;
            u_xlat16_9 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.ywxw;
            u_xlat16_12.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.zw;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_7.yw = u_xlat16_8.yz;
            u_xlat16_13 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_8 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.wywz;
            u_xlat16_7 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xwzw;
            u_xlat16_14 = u_xlat16_6.zwyz * u_xlat16_11.xxxy;
            u_xlat16_15 = u_xlat16_6 * u_xlat16_11.yyzz;
            u_xlat16_60.x = u_xlat16_6.y * u_xlat16_11.z;
            vec3 txVec4 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_79 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_85 = u_xlat10_79 * u_xlat16_14.y;
            u_xlat16_85 = u_xlat16_14.x * u_xlat10_54 + u_xlat16_85;
            vec3 txVec6 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_85 = u_xlat16_14.z * u_xlat10_54 + u_xlat16_85;
            vec3 txVec7 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_85 = u_xlat16_14.w * u_xlat10_54 + u_xlat16_85;
            vec3 txVec8 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_85 = u_xlat16_15.x * u_xlat10_54 + u_xlat16_85;
            vec3 txVec9 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_85 = u_xlat16_15.y * u_xlat10_54 + u_xlat16_85;
            vec3 txVec10 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_85 = u_xlat16_15.z * u_xlat10_54 + u_xlat16_85;
            vec3 txVec11 = vec3(u_xlat16_7.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_85 = u_xlat16_15.w * u_xlat10_54 + u_xlat16_85;
            vec3 txVec12 = vec3(u_xlat16_7.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_35 = u_xlat16_60.x * u_xlat10_54 + u_xlat16_85;
        } else {
            u_xlat16_60.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_8.yw = u_xlat16_7.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_61.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_12.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_62.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_12.xy;
            u_xlat16_62.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.zw = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_6.yw;
            u_xlat16_12 = u_xlat16_12 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_6.z = u_xlat16_12.z * 0.0816320032;
            u_xlat16_7.xy = u_xlat16_61.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_61.xy = u_xlat16_12.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_7.z = u_xlat16_12.w * 0.0816320032;
            u_xlat16_6.x = u_xlat16_7.y;
            u_xlat16_6.yw = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_9.xz = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_9.y = u_xlat16_61.x;
            u_xlat16_9.w = u_xlat16_8.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_9;
            u_xlat16_7.yw = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_61.y;
            u_xlat16_7 = u_xlat16_7 + u_xlat16_8;
            u_xlat16_9 = u_xlat16_9 / u_xlat16_6;
            u_xlat16_9 = u_xlat16_9 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8 / u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_9 = u_xlat16_9.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_8 = u_xlat16_8.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_11.xzw = u_xlat16_9.yzw;
            u_xlat16_11.y = u_xlat16_8.x;
            u_xlat16_12 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_13.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.y = u_xlat16_11.y;
            u_xlat16_11.y = u_xlat16_8.z;
            u_xlat16_14 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_63.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.z = u_xlat16_11.y;
            u_xlat16_15 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyxz;
            u_xlat16_11.y = u_xlat16_8.w;
            u_xlat16_16 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_17.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_67.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.xw;
            u_xlat16_8.xzw = u_xlat16_11.xzw;
            u_xlat16_11 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_18.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_8.x = u_xlat16_9.x;
            u_xlat16_60.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xy;
            u_xlat16_8 = u_xlat16_6 * u_xlat16_7.xxxx;
            u_xlat16_9 = u_xlat16_6 * u_xlat16_7.yyyy;
            u_xlat16_19 = u_xlat16_6 * u_xlat16_7.zzzz;
            u_xlat16_6 = u_xlat16_6 * u_xlat16_7.wwww;
            vec3 txVec13 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_79 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_12.x = u_xlat10_79 * u_xlat16_8.y;
            u_xlat16_12.x = u_xlat16_8.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec15 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_12.x = u_xlat16_8.z * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec16 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_12.x = u_xlat16_8.w * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec17 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_12.x = u_xlat16_9.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec18 = vec3(u_xlat16_14.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_12.x = u_xlat16_9.y * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec19 = vec3(u_xlat16_63.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_12.x = u_xlat16_9.z * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec20 = vec3(u_xlat16_15.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_12.x = u_xlat16_9.w * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec21 = vec3(u_xlat16_16.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_12.x = u_xlat16_19.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec22 = vec3(u_xlat16_16.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_12.x = u_xlat16_19.y * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec23 = vec3(u_xlat16_17.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_12.x = u_xlat16_19.z * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec24 = vec3(u_xlat16_67.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_12.x = u_xlat16_19.w * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec25 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_11.x = u_xlat16_6.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec26 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_11.x = u_xlat16_6.y * u_xlat10_54 + u_xlat16_11.x;
            vec3 txVec27 = vec3(u_xlat16_18.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_11.x = u_xlat16_6.z * u_xlat10_54 + u_xlat16_11.x;
            vec3 txVec28 = vec3(u_xlat16_60.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_35 = u_xlat16_6.w * u_xlat10_54 + u_xlat16_11.x;
        }
    }
    u_xlat16_60.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat16_35 * u_xlat16_60.x + u_xlat16_10.x;
    u_xlat20.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vs_TEXCOORD2.xyz;
    u_xlat54 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat79 = _Delta_ShadowCenter.w + 1.0;
    u_xlat54 = u_xlat79 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat79 = (-u_xlat16_10.x) + 1.0;
    u_xlat79 = (-u_xlat79) * _ShadowIntensity + 1.0;
    u_xlat79 = max(u_xlat79, 0.0);
    u_xlat5.x = (-u_xlat54) + 1.0;
    u_xlat54 = u_xlat79 * u_xlat5.x + u_xlat54;
    u_xlat20.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz + _Shadow_Color.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat20.xyz) * u_xlat16_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat20.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat20.xyz = u_xlat16_2.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat21.xyz = u_xlat16_2.xyz * u_xlat20.xyz;
    u_xlat54 = (-u_xlat4.x) + 1.0;
    u_xlat22.xyz = u_xlat21.xyz * vec3(u_xlat54);
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat76 = max(u_xlat76, 0.100000001);
    u_xlat79 = u_xlat4.y * u_xlat4.y;
    u_xlat95 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat76 = u_xlat76 * u_xlat95;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat79 = u_xlat79 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat79 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat76 = u_xlat76 * u_xlat3.x;
    u_xlat76 = u_xlat79 / u_xlat76;
    u_xlat76 = u_xlat76 * 0.25 + -9.99999975e-06;
    u_xlat76 = max(u_xlat76, 0.0);
    u_xlat76 = min(u_xlat76, 20.0);
    u_xlat20.xyz = u_xlat16_2.xyz * u_xlat20.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat23.xyz = u_xlat4.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = vec3(u_xlat54) * _Ambient_Color.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat24.xyz;
    u_xlat21.xyz = vec3(u_xlat78) * u_xlat21.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat24.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_6 = textureLod(_Cubemap, u_xlat24.xyz, u_xlat3.x);
    u_xlat24.xzw = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xzw = u_xlat16_6.xyz * u_xlat24.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xzw = u_xlat16_6.xyz * u_xlat24.xzw;
    u_xlat24.xzw = u_xlat16_6.www * u_xlat24.xzw;
    u_xlat24.xzw = vec3(u_xlat78) * u_xlat24.xzw;
    u_xlat3.x = u_xlat24.y * 0.200000003 + 0.800000012;
    u_xlat24.xyz = u_xlat3.xxx * u_xlat24.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat78 = u_xlat16_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat20.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat78) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat50 = (-u_xlat50) + 1.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat20.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat50) * u_xlat20.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_50 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3 = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3 * _RimNoise_Speed.w;
    u_xlat78 = u_xlat28.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(_Rim2_Threshold<u_xlat78);
#else
    u_xlatb78 = _Rim2_Threshold<u_xlat78;
#endif
    u_xlat20.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat20.z = vs_TEXCOORD7.z;
    u_xlat79 = dot(u_xlat1.xyz, u_xlat20.xyz);
    u_xlat79 = max(u_xlat79, 0.0);
    u_xlat79 = (-u_xlat3.x) * u_xlat16_50 + u_xlat79;
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat20.x = u_xlat79 * -2.0 + 3.0;
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat20.x;
    u_xlat79 = min(u_xlat79, 1.0);
    u_xlat20.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat20.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat20.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat50 = (-u_xlat3.x) * u_xlat16_50 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat50 * -2.0 + 3.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat50 = u_xlat50 * u_xlat1.x;
    u_xlat50 = min(u_xlat50, 1.0);
    u_xlat1.xyz = (bool(u_xlatb78)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb78) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat28.x = (u_xlatb78) ? u_xlat79 : u_xlat50;
    u_xlat16_28.xyz = texture(_Rim_Ramp, u_xlat28.xy).xyz;
    u_xlat50 = u_xlat3.x * u_xlat16_5.y;
    u_xlat3.xyz = u_xlat16_28.xyz * vec3(u_xlat50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb50 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb50){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat20.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat20.xyz = u_xlat16_0.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat20.xyz;
        u_xlat78 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat78);
        u_xlat78 = _Time.y * _Em_Speed;
        u_xlat78 = sin(u_xlat78);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat78)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat20.xyz = vec3(u_xlat76) * u_xlat23.xyz + u_xlat22.xyz;
    u_xlat20.xyz = u_xlat20.xyz * _DirectionalLight_Color.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(u_xlat75) + u_xlat21.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat24.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat20.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyz;
    u_xlat16_10.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_10.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(7) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(8) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec4 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec4 u_xlat24;
vec2 u_xlat28;
mediump vec3 u_xlat16_28;
mediump float u_xlat16_35;
float u_xlat50;
mediump float u_xlat16_50;
bool u_xlatb50;
float u_xlat54;
mediump float u_xlat10_54;
bool u_xlatb54;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_67;
float u_xlat75;
float u_xlat76;
mediump float u_xlat16_77;
float u_xlat78;
bool u_xlatb78;
float u_xlat79;
mediump float u_xlat10_79;
mediump float u_xlat16_85;
float u_xlat95;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat50 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat1.xyz = vec3(u_xlat50) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_77 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_2.xyz = vec3(u_xlat16_77) * u_xlat16_2.xyz;
    u_xlat50 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat50 = max(u_xlat50, 0.0);
    u_xlat75 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat76 = max(u_xlat76, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat28.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat78 = (-u_xlat16_5.x) + 1.0;
    u_xlat78 = u_xlat78 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat78) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb54 = _ShadowBias.z!=0.0;
#endif
    u_xlat79 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat6.xyz = vec3(u_xlat79) * _WorldSpaceLightPos0.xyz;
    u_xlat79 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
    u_xlat79 = (-u_xlat79) * u_xlat79 + 1.0;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 * _ShadowBias.z;
    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat79) + vs_TEXCOORD2.xyz;
    u_xlat6.xyz = (bool(u_xlatb54)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat8;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat9;
    u_xlat7 = u_xlat6.yyyy * u_xlat7;
    u_xlat2 = u_xlat2 * u_xlat6.xxxx + u_xlat7;
    u_xlat2 = u_xlat8 * u_xlat6.zzzz + u_xlat2;
    u_xlat2 = u_xlat9 + u_xlat2;
    u_xlat54 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat2.z + (-u_xlat54);
    u_xlat79 = max((-u_xlat2.w), u_xlat54);
    u_xlat79 = (-u_xlat54) + u_xlat79;
    u_xlat2.z = _ShadowBias.y * u_xlat79 + u_xlat54;
    u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_10.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_softShadowQuality==1.0);
#else
    u_xlatb54 = _softShadowQuality==1.0;
#endif
    if(u_xlatb54){
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat2.xyw + u_xlat6.xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_35 = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb54 = !!(_softShadowQuality==2.0);
#else
        u_xlatb54 = _softShadowQuality==2.0;
#endif
        if(u_xlatb54){
            u_xlat16_60.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_61.xy = u_xlat16_7.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_12.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_62.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_13.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_13.xy = (-u_xlat16_13.xy) * u_xlat16_13.xy + u_xlat16_62.xy;
            u_xlat16_11.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_6.yw;
            u_xlat16_13.xy = u_xlat16_13.xy + vec2(1.0, 1.0);
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_7.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_62.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_13.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_12.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_6.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_7.z = u_xlat16_9.x;
            u_xlat16_7.w = u_xlat16_11.x;
            u_xlat16_8.z = u_xlat16_12.x;
            u_xlat16_8.w = u_xlat16_61.x;
            u_xlat16_6 = u_xlat16_7.zwxz + u_xlat16_8.zwxz;
            u_xlat16_9.z = u_xlat16_7.y;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_12.z = u_xlat16_8.y;
            u_xlat16_12.w = u_xlat16_61.y;
            u_xlat16_11.xyz = u_xlat16_9.zyw + u_xlat16_12.zyw;
            u_xlat16_13.xyz = u_xlat16_8.xzw / u_xlat16_6.zwy;
            u_xlat16_13.xyz = u_xlat16_13.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_12.xyz = u_xlat16_12.zyw / u_xlat16_11.xyz;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_7.xyz = u_xlat16_13.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_8.xyz = u_xlat16_12.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_7.w = u_xlat16_8.x;
            u_xlat16_9 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.ywxw;
            u_xlat16_12.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.zw;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_7.yw = u_xlat16_8.yz;
            u_xlat16_13 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_8 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.wywz;
            u_xlat16_7 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xwzw;
            u_xlat16_14 = u_xlat16_6.zwyz * u_xlat16_11.xxxy;
            u_xlat16_15 = u_xlat16_6 * u_xlat16_11.yyzz;
            u_xlat16_60.x = u_xlat16_6.y * u_xlat16_11.z;
            vec3 txVec4 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_79 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_85 = u_xlat10_79 * u_xlat16_14.y;
            u_xlat16_85 = u_xlat16_14.x * u_xlat10_54 + u_xlat16_85;
            vec3 txVec6 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_85 = u_xlat16_14.z * u_xlat10_54 + u_xlat16_85;
            vec3 txVec7 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_85 = u_xlat16_14.w * u_xlat10_54 + u_xlat16_85;
            vec3 txVec8 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_85 = u_xlat16_15.x * u_xlat10_54 + u_xlat16_85;
            vec3 txVec9 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_85 = u_xlat16_15.y * u_xlat10_54 + u_xlat16_85;
            vec3 txVec10 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_85 = u_xlat16_15.z * u_xlat10_54 + u_xlat16_85;
            vec3 txVec11 = vec3(u_xlat16_7.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_85 = u_xlat16_15.w * u_xlat10_54 + u_xlat16_85;
            vec3 txVec12 = vec3(u_xlat16_7.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_35 = u_xlat16_60.x * u_xlat10_54 + u_xlat16_85;
        } else {
            u_xlat16_60.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_8.yw = u_xlat16_7.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_61.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_12.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_62.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_12.xy;
            u_xlat16_62.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.zw = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_6.yw;
            u_xlat16_12 = u_xlat16_12 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_6.z = u_xlat16_12.z * 0.0816320032;
            u_xlat16_7.xy = u_xlat16_61.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_61.xy = u_xlat16_12.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_7.z = u_xlat16_12.w * 0.0816320032;
            u_xlat16_6.x = u_xlat16_7.y;
            u_xlat16_6.yw = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_9.xz = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_9.y = u_xlat16_61.x;
            u_xlat16_9.w = u_xlat16_8.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_9;
            u_xlat16_7.yw = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_61.y;
            u_xlat16_7 = u_xlat16_7 + u_xlat16_8;
            u_xlat16_9 = u_xlat16_9 / u_xlat16_6;
            u_xlat16_9 = u_xlat16_9 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8 / u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_9 = u_xlat16_9.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_8 = u_xlat16_8.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_11.xzw = u_xlat16_9.yzw;
            u_xlat16_11.y = u_xlat16_8.x;
            u_xlat16_12 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_13.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.y = u_xlat16_11.y;
            u_xlat16_11.y = u_xlat16_8.z;
            u_xlat16_14 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_63.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.z = u_xlat16_11.y;
            u_xlat16_15 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyxz;
            u_xlat16_11.y = u_xlat16_8.w;
            u_xlat16_16 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_17.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_67.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.xw;
            u_xlat16_8.xzw = u_xlat16_11.xzw;
            u_xlat16_11 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_18.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_8.x = u_xlat16_9.x;
            u_xlat16_60.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xy;
            u_xlat16_8 = u_xlat16_6 * u_xlat16_7.xxxx;
            u_xlat16_9 = u_xlat16_6 * u_xlat16_7.yyyy;
            u_xlat16_19 = u_xlat16_6 * u_xlat16_7.zzzz;
            u_xlat16_6 = u_xlat16_6 * u_xlat16_7.wwww;
            vec3 txVec13 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_79 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_12.x = u_xlat10_79 * u_xlat16_8.y;
            u_xlat16_12.x = u_xlat16_8.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec15 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_12.x = u_xlat16_8.z * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec16 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_12.x = u_xlat16_8.w * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec17 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_12.x = u_xlat16_9.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec18 = vec3(u_xlat16_14.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_12.x = u_xlat16_9.y * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec19 = vec3(u_xlat16_63.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_12.x = u_xlat16_9.z * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec20 = vec3(u_xlat16_15.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_12.x = u_xlat16_9.w * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec21 = vec3(u_xlat16_16.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_12.x = u_xlat16_19.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec22 = vec3(u_xlat16_16.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_12.x = u_xlat16_19.y * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec23 = vec3(u_xlat16_17.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_12.x = u_xlat16_19.z * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec24 = vec3(u_xlat16_67.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_12.x = u_xlat16_19.w * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec25 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_11.x = u_xlat16_6.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec26 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_11.x = u_xlat16_6.y * u_xlat10_54 + u_xlat16_11.x;
            vec3 txVec27 = vec3(u_xlat16_18.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_11.x = u_xlat16_6.z * u_xlat10_54 + u_xlat16_11.x;
            vec3 txVec28 = vec3(u_xlat16_60.xy,u_xlat2.w);
            u_xlat10_54 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_35 = u_xlat16_6.w * u_xlat10_54 + u_xlat16_11.x;
        }
    }
    u_xlat16_60.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat16_35 * u_xlat16_60.x + u_xlat16_10.x;
    u_xlat20.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vs_TEXCOORD2.xyz;
    u_xlat54 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat79 = _Delta_ShadowCenter.w + 1.0;
    u_xlat54 = u_xlat79 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat79 = (-u_xlat16_10.x) + 1.0;
    u_xlat79 = (-u_xlat79) * _ShadowIntensity + 1.0;
    u_xlat79 = max(u_xlat79, 0.0);
    u_xlat5.x = (-u_xlat54) + 1.0;
    u_xlat54 = u_xlat79 * u_xlat5.x + u_xlat54;
    u_xlat20.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz + _Shadow_Color.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat20.xyz) * u_xlat16_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat20.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat20.xyz = u_xlat16_2.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat21.xyz = u_xlat16_2.xyz * u_xlat20.xyz;
    u_xlat54 = (-u_xlat4.x) + 1.0;
    u_xlat22.xyz = u_xlat21.xyz * vec3(u_xlat54);
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat76 = max(u_xlat76, 0.100000001);
    u_xlat79 = u_xlat4.y * u_xlat4.y;
    u_xlat95 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat76 = u_xlat76 * u_xlat95;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat79 = u_xlat79 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat79 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat76 = u_xlat76 * u_xlat3.x;
    u_xlat76 = u_xlat79 / u_xlat76;
    u_xlat76 = u_xlat76 * 0.25 + -9.99999975e-06;
    u_xlat76 = max(u_xlat76, 0.0);
    u_xlat76 = min(u_xlat76, 20.0);
    u_xlat20.xyz = u_xlat16_2.xyz * u_xlat20.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat23.xyz = u_xlat4.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = vec3(u_xlat54) * _Ambient_Color.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat24.xyz;
    u_xlat21.xyz = vec3(u_xlat78) * u_xlat21.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat24.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_6 = textureLod(_Cubemap, u_xlat24.xyz, u_xlat3.x);
    u_xlat24.xzw = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xzw = u_xlat16_6.xyz * u_xlat24.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xzw = u_xlat16_6.xyz * u_xlat24.xzw;
    u_xlat24.xzw = u_xlat16_6.www * u_xlat24.xzw;
    u_xlat24.xzw = vec3(u_xlat78) * u_xlat24.xzw;
    u_xlat3.x = u_xlat24.y * 0.200000003 + 0.800000012;
    u_xlat24.xyz = u_xlat3.xxx * u_xlat24.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat78 = u_xlat16_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat20.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat78) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat50 = (-u_xlat50) + 1.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat20.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat50) * u_xlat20.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_50 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3 = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3 * _RimNoise_Speed.w;
    u_xlat78 = u_xlat28.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(_Rim2_Threshold<u_xlat78);
#else
    u_xlatb78 = _Rim2_Threshold<u_xlat78;
#endif
    u_xlat20.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat20.z = vs_TEXCOORD7.z;
    u_xlat79 = dot(u_xlat1.xyz, u_xlat20.xyz);
    u_xlat79 = max(u_xlat79, 0.0);
    u_xlat79 = (-u_xlat3.x) * u_xlat16_50 + u_xlat79;
#ifdef UNITY_ADRENO_ES3
    u_xlat79 = min(max(u_xlat79, 0.0), 1.0);
#else
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
#endif
    u_xlat20.x = u_xlat79 * -2.0 + 3.0;
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat20.x;
    u_xlat79 = min(u_xlat79, 1.0);
    u_xlat20.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat20.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat20.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat50 = (-u_xlat3.x) * u_xlat16_50 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat50 * -2.0 + 3.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat50 = u_xlat50 * u_xlat1.x;
    u_xlat50 = min(u_xlat50, 1.0);
    u_xlat1.xyz = (bool(u_xlatb78)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb78) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat28.x = (u_xlatb78) ? u_xlat79 : u_xlat50;
    u_xlat16_28.xyz = texture(_Rim_Ramp, u_xlat28.xy).xyz;
    u_xlat50 = u_xlat3.x * u_xlat16_5.y;
    u_xlat3.xyz = u_xlat16_28.xyz * vec3(u_xlat50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb50 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb50){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat20.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat20.xyz = u_xlat16_0.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat20.xyz;
        u_xlat78 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat78);
        u_xlat78 = _Time.y * _Em_Speed;
        u_xlat78 = sin(u_xlat78);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat78)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat20.xyz = vec3(u_xlat76) * u_xlat23.xyz + u_xlat22.xyz;
    u_xlat20.xyz = u_xlat20.xyz * _DirectionalLight_Color.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(u_xlat75) + u_xlat21.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat24.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat20.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyz;
    u_xlat16_10.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_10.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
lowp vec4 u_xlat10_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec4 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec4 u_xlat24;
vec2 u_xlat28;
lowp vec3 u_xlat10_28;
mediump float u_xlat16_35;
float u_xlat50;
lowp float u_xlat10_50;
bool u_xlatb50;
float u_xlat54;
lowp float u_xlat10_54;
bool u_xlatb54;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_67;
float u_xlat75;
float u_xlat76;
mediump float u_xlat16_77;
float u_xlat78;
bool u_xlatb78;
float u_xlat79;
lowp float u_xlat10_79;
mediump float u_xlat16_85;
float u_xlat95;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat50 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat1.xyz = vec3(u_xlat50) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_77 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_2.xyz = vec3(u_xlat16_77) * u_xlat16_2.xyz;
    u_xlat50 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat50 = max(u_xlat50, 0.0);
    u_xlat75 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
    u_xlat76 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat76 = max(u_xlat76, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat28.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_5.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat78 = (-u_xlat10_5.x) + 1.0;
    u_xlat78 = u_xlat78 * _AO_Intensity;
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
    u_xlat78 = (-u_xlat78) + 1.0;
    u_xlatb54 = _ShadowBias.z!=0.0;
    u_xlat79 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat6.xyz = vec3(u_xlat79) * _WorldSpaceLightPos0.xyz;
    u_xlat79 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
    u_xlat79 = (-u_xlat79) * u_xlat79 + 1.0;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 * _ShadowBias.z;
    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat79) + vs_TEXCOORD2.xyz;
    u_xlat6.xyz = (bool(u_xlatb54)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat8;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat9;
    u_xlat7 = u_xlat6.yyyy * u_xlat7;
    u_xlat2 = u_xlat2 * u_xlat6.xxxx + u_xlat7;
    u_xlat2 = u_xlat8 * u_xlat6.zzzz + u_xlat2;
    u_xlat2 = u_xlat9 + u_xlat2;
    u_xlat54 = _ShadowBias.x / u_xlat2.w;
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
    u_xlat54 = u_xlat2.z + (-u_xlat54);
    u_xlat79 = max((-u_xlat2.w), u_xlat54);
    u_xlat79 = (-u_xlat54) + u_xlat79;
    u_xlat2.z = _ShadowBias.y * u_xlat79 + u_xlat54;
    u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_10.x = (-_ShadowBias.w) + 1.0;
    u_xlatb54 = _softShadowQuality==1.0;
    if(u_xlatb54){
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat2.xyw + u_xlat6.xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_35 = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb54 = _softShadowQuality==2.0;
        if(u_xlatb54){
            u_xlat16_60.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_61.xy = u_xlat16_7.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_12.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_62.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_13.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_13.xy = (-u_xlat16_13.xy) * u_xlat16_13.xy + u_xlat16_62.xy;
            u_xlat16_11.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_6.yw;
            u_xlat16_13.xy = u_xlat16_13.xy + vec2(1.0, 1.0);
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_7.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_62.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_13.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_12.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_6.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_7.z = u_xlat16_9.x;
            u_xlat16_7.w = u_xlat16_11.x;
            u_xlat16_8.z = u_xlat16_12.x;
            u_xlat16_8.w = u_xlat16_61.x;
            u_xlat16_6 = u_xlat16_7.zwxz + u_xlat16_8.zwxz;
            u_xlat16_9.z = u_xlat16_7.y;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_12.z = u_xlat16_8.y;
            u_xlat16_12.w = u_xlat16_61.y;
            u_xlat16_11.xyz = u_xlat16_9.zyw + u_xlat16_12.zyw;
            u_xlat16_13.xyz = u_xlat16_8.xzw / u_xlat16_6.zwy;
            u_xlat16_13.xyz = u_xlat16_13.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_12.xyz = u_xlat16_12.zyw / u_xlat16_11.xyz;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_7.xyz = u_xlat16_13.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_8.xyz = u_xlat16_12.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_7.w = u_xlat16_8.x;
            u_xlat16_9 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.ywxw;
            u_xlat16_12.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.zw;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_7.yw = u_xlat16_8.yz;
            u_xlat16_13 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_8 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.wywz;
            u_xlat16_7 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xwzw;
            u_xlat16_14 = u_xlat16_6.zwyz * u_xlat16_11.xxxy;
            u_xlat16_15 = u_xlat16_6 * u_xlat16_11.yyzz;
            u_xlat16_60.x = u_xlat16_6.y * u_xlat16_11.z;
            vec3 txVec4 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_79 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_85 = u_xlat10_79 * u_xlat16_14.y;
            u_xlat16_85 = u_xlat16_14.x * u_xlat10_54 + u_xlat16_85;
            vec3 txVec6 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_85 = u_xlat16_14.z * u_xlat10_54 + u_xlat16_85;
            vec3 txVec7 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_85 = u_xlat16_14.w * u_xlat10_54 + u_xlat16_85;
            vec3 txVec8 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_85 = u_xlat16_15.x * u_xlat10_54 + u_xlat16_85;
            vec3 txVec9 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_85 = u_xlat16_15.y * u_xlat10_54 + u_xlat16_85;
            vec3 txVec10 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_85 = u_xlat16_15.z * u_xlat10_54 + u_xlat16_85;
            vec3 txVec11 = vec3(u_xlat16_7.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_85 = u_xlat16_15.w * u_xlat10_54 + u_xlat16_85;
            vec3 txVec12 = vec3(u_xlat16_7.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_35 = u_xlat16_60.x * u_xlat10_54 + u_xlat16_85;
        } else {
            u_xlat16_60.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_8.yw = u_xlat16_7.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_61.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_12.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_62.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_12.xy;
            u_xlat16_62.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.zw = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_6.yw;
            u_xlat16_12 = u_xlat16_12 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_6.z = u_xlat16_12.z * 0.0816320032;
            u_xlat16_7.xy = u_xlat16_61.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_61.xy = u_xlat16_12.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_7.z = u_xlat16_12.w * 0.0816320032;
            u_xlat16_6.x = u_xlat16_7.y;
            u_xlat16_6.yw = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_9.xz = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_9.y = u_xlat16_61.x;
            u_xlat16_9.w = u_xlat16_8.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_9;
            u_xlat16_7.yw = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_61.y;
            u_xlat16_7 = u_xlat16_7 + u_xlat16_8;
            u_xlat16_9 = u_xlat16_9 / u_xlat16_6;
            u_xlat16_9 = u_xlat16_9 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8 / u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_9 = u_xlat16_9.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_8 = u_xlat16_8.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_11.xzw = u_xlat16_9.yzw;
            u_xlat16_11.y = u_xlat16_8.x;
            u_xlat16_12 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_13.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.y = u_xlat16_11.y;
            u_xlat16_11.y = u_xlat16_8.z;
            u_xlat16_14 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_63.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.z = u_xlat16_11.y;
            u_xlat16_15 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyxz;
            u_xlat16_11.y = u_xlat16_8.w;
            u_xlat16_16 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_17.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_67.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.xw;
            u_xlat16_8.xzw = u_xlat16_11.xzw;
            u_xlat16_11 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_18.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_8.x = u_xlat16_9.x;
            u_xlat16_60.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xy;
            u_xlat16_8 = u_xlat16_6 * u_xlat16_7.xxxx;
            u_xlat16_9 = u_xlat16_6 * u_xlat16_7.yyyy;
            u_xlat16_19 = u_xlat16_6 * u_xlat16_7.zzzz;
            u_xlat16_6 = u_xlat16_6 * u_xlat16_7.wwww;
            vec3 txVec13 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_79 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_12.x = u_xlat10_79 * u_xlat16_8.y;
            u_xlat16_12.x = u_xlat16_8.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec15 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_12.x = u_xlat16_8.z * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec16 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_12.x = u_xlat16_8.w * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec17 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_12.x = u_xlat16_9.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec18 = vec3(u_xlat16_14.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_12.x = u_xlat16_9.y * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec19 = vec3(u_xlat16_63.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_12.x = u_xlat16_9.z * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec20 = vec3(u_xlat16_15.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_12.x = u_xlat16_9.w * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec21 = vec3(u_xlat16_16.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_12.x = u_xlat16_19.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec22 = vec3(u_xlat16_16.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_12.x = u_xlat16_19.y * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec23 = vec3(u_xlat16_17.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_12.x = u_xlat16_19.z * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec24 = vec3(u_xlat16_67.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_12.x = u_xlat16_19.w * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec25 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_11.x = u_xlat16_6.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec26 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_11.x = u_xlat16_6.y * u_xlat10_54 + u_xlat16_11.x;
            vec3 txVec27 = vec3(u_xlat16_18.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_11.x = u_xlat16_6.z * u_xlat10_54 + u_xlat16_11.x;
            vec3 txVec28 = vec3(u_xlat16_60.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_35 = u_xlat16_6.w * u_xlat10_54 + u_xlat16_11.x;
        }
    }
    u_xlat16_60.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat16_35 * u_xlat16_60.x + u_xlat16_10.x;
    u_xlat20.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vs_TEXCOORD2.xyz;
    u_xlat54 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat79 = _Delta_ShadowCenter.w + 1.0;
    u_xlat54 = u_xlat79 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat79 = (-u_xlat16_10.x) + 1.0;
    u_xlat79 = (-u_xlat79) * _ShadowIntensity + 1.0;
    u_xlat79 = max(u_xlat79, 0.0);
    u_xlat5.x = (-u_xlat54) + 1.0;
    u_xlat54 = u_xlat79 * u_xlat5.x + u_xlat54;
    u_xlat20.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz + _Shadow_Color.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat20.xyz) * u_xlat10_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat20.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat20.xyz = u_xlat10_2.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat21.xyz = u_xlat10_2.xyz * u_xlat20.xyz;
    u_xlat54 = (-u_xlat4.x) + 1.0;
    u_xlat22.xyz = u_xlat21.xyz * vec3(u_xlat54);
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat76 = max(u_xlat76, 0.100000001);
    u_xlat79 = u_xlat4.y * u_xlat4.y;
    u_xlat95 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat76 = u_xlat76 * u_xlat95;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat79 = u_xlat79 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat79 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat76 = u_xlat76 * u_xlat3.x;
    u_xlat76 = u_xlat79 / u_xlat76;
    u_xlat76 = u_xlat76 * 0.25 + -9.99999975e-06;
    u_xlat76 = max(u_xlat76, 0.0);
    u_xlat76 = min(u_xlat76, 20.0);
    u_xlat20.xyz = u_xlat10_2.xyz * u_xlat20.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat23.xyz = u_xlat4.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = vec3(u_xlat54) * _Ambient_Color.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat24.xyz;
    u_xlat21.xyz = vec3(u_xlat78) * u_xlat21.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat24.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_6 = textureCubeLodEXT(_Cubemap, u_xlat24.xyz, u_xlat3.x);
    u_xlat24.xzw = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xzw = u_xlat10_6.xyz * u_xlat24.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xzw = u_xlat10_6.xyz * u_xlat24.xzw;
    u_xlat24.xzw = u_xlat10_6.www * u_xlat24.xzw;
    u_xlat24.xzw = vec3(u_xlat78) * u_xlat24.xzw;
    u_xlat3.x = u_xlat24.y * 0.200000003 + 0.800000012;
    u_xlat24.xyz = u_xlat3.xxx * u_xlat24.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat78 = u_xlat10_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat20.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat78) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat50 = (-u_xlat50) + 1.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat20.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat50) * u_xlat20.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_50 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3 = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3 * _RimNoise_Speed.w;
    u_xlat78 = u_xlat28.y * 255.0;
    u_xlatb78 = _Rim2_Threshold<u_xlat78;
    u_xlat20.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat20.z = vs_TEXCOORD7.z;
    u_xlat79 = dot(u_xlat1.xyz, u_xlat20.xyz);
    u_xlat79 = max(u_xlat79, 0.0);
    u_xlat79 = (-u_xlat3.x) * u_xlat10_50 + u_xlat79;
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
    u_xlat20.x = u_xlat79 * -2.0 + 3.0;
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat20.x;
    u_xlat79 = min(u_xlat79, 1.0);
    u_xlat20.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat20.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat20.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat50 = (-u_xlat3.x) * u_xlat10_50 + u_xlat1.x;
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
    u_xlat1.x = u_xlat50 * -2.0 + 3.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat50 = u_xlat50 * u_xlat1.x;
    u_xlat50 = min(u_xlat50, 1.0);
    u_xlat1.xyz = (bool(u_xlatb78)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb78) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat28.x = (u_xlatb78) ? u_xlat79 : u_xlat50;
    u_xlat10_28.xyz = texture2D(_Rim_Ramp, u_xlat28.xy).xyz;
    u_xlat50 = u_xlat3.x * u_xlat10_5.y;
    u_xlat3.xyz = u_xlat10_28.xyz * vec3(u_xlat50);
    u_xlatb50 = _EMISSION_ON==1.0;
    if(u_xlatb50){
        u_xlat10_0.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat20.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat20.xyz = u_xlat10_0.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat20.xyz;
        u_xlat78 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat78);
        u_xlat78 = _Time.y * _Em_Speed;
        u_xlat78 = sin(u_xlat78);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat78)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat20.xyz = vec3(u_xlat76) * u_xlat23.xyz + u_xlat22.xyz;
    u_xlat20.xyz = u_xlat20.xyz * _DirectionalLight_Color.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(u_xlat75) + u_xlat21.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat24.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat20.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyz;
    u_xlat16_10.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_10.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
lowp vec4 u_xlat10_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec4 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec4 u_xlat24;
vec2 u_xlat28;
lowp vec3 u_xlat10_28;
mediump float u_xlat16_35;
float u_xlat50;
lowp float u_xlat10_50;
bool u_xlatb50;
float u_xlat54;
lowp float u_xlat10_54;
bool u_xlatb54;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_67;
float u_xlat75;
float u_xlat76;
mediump float u_xlat16_77;
float u_xlat78;
bool u_xlatb78;
float u_xlat79;
lowp float u_xlat10_79;
mediump float u_xlat16_85;
float u_xlat95;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat50 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat1.xyz = vec3(u_xlat50) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_77 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_77 = inversesqrt(u_xlat16_77);
    u_xlat16_2.xyz = vec3(u_xlat16_77) * u_xlat16_2.xyz;
    u_xlat50 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat50 = max(u_xlat50, 0.0);
    u_xlat75 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
    u_xlat76 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat76 = max(u_xlat76, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat28.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_5.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat78 = (-u_xlat10_5.x) + 1.0;
    u_xlat78 = u_xlat78 * _AO_Intensity;
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
    u_xlat78 = (-u_xlat78) + 1.0;
    u_xlatb54 = _ShadowBias.z!=0.0;
    u_xlat79 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat79 = inversesqrt(u_xlat79);
    u_xlat6.xyz = vec3(u_xlat79) * _WorldSpaceLightPos0.xyz;
    u_xlat79 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
    u_xlat79 = (-u_xlat79) * u_xlat79 + 1.0;
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 * _ShadowBias.z;
    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat79) + vs_TEXCOORD2.xyz;
    u_xlat6.xyz = (bool(u_xlatb54)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat8;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat9;
    u_xlat7 = u_xlat6.yyyy * u_xlat7;
    u_xlat2 = u_xlat2 * u_xlat6.xxxx + u_xlat7;
    u_xlat2 = u_xlat8 * u_xlat6.zzzz + u_xlat2;
    u_xlat2 = u_xlat9 + u_xlat2;
    u_xlat54 = _ShadowBias.x / u_xlat2.w;
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
    u_xlat54 = u_xlat2.z + (-u_xlat54);
    u_xlat79 = max((-u_xlat2.w), u_xlat54);
    u_xlat79 = (-u_xlat54) + u_xlat79;
    u_xlat2.z = _ShadowBias.y * u_xlat79 + u_xlat54;
    u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_10.x = (-_ShadowBias.w) + 1.0;
    u_xlatb54 = _softShadowQuality==1.0;
    if(u_xlatb54){
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat2.xyw + u_xlat6.xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_35 = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb54 = _softShadowQuality==2.0;
        if(u_xlatb54){
            u_xlat16_60.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_61.xy = u_xlat16_7.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_12.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_62.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_13.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_13.xy = (-u_xlat16_13.xy) * u_xlat16_13.xy + u_xlat16_62.xy;
            u_xlat16_11.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_6.yw;
            u_xlat16_13.xy = u_xlat16_13.xy + vec2(1.0, 1.0);
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_7.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_62.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_13.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_12.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_6.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_7.z = u_xlat16_9.x;
            u_xlat16_7.w = u_xlat16_11.x;
            u_xlat16_8.z = u_xlat16_12.x;
            u_xlat16_8.w = u_xlat16_61.x;
            u_xlat16_6 = u_xlat16_7.zwxz + u_xlat16_8.zwxz;
            u_xlat16_9.z = u_xlat16_7.y;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_12.z = u_xlat16_8.y;
            u_xlat16_12.w = u_xlat16_61.y;
            u_xlat16_11.xyz = u_xlat16_9.zyw + u_xlat16_12.zyw;
            u_xlat16_13.xyz = u_xlat16_8.xzw / u_xlat16_6.zwy;
            u_xlat16_13.xyz = u_xlat16_13.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_12.xyz = u_xlat16_12.zyw / u_xlat16_11.xyz;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_7.xyz = u_xlat16_13.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_8.xyz = u_xlat16_12.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_7.w = u_xlat16_8.x;
            u_xlat16_9 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.ywxw;
            u_xlat16_12.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.zw;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_7.yw = u_xlat16_8.yz;
            u_xlat16_13 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_8 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.wywz;
            u_xlat16_7 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xwzw;
            u_xlat16_14 = u_xlat16_6.zwyz * u_xlat16_11.xxxy;
            u_xlat16_15 = u_xlat16_6 * u_xlat16_11.yyzz;
            u_xlat16_60.x = u_xlat16_6.y * u_xlat16_11.z;
            vec3 txVec4 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_79 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_85 = u_xlat10_79 * u_xlat16_14.y;
            u_xlat16_85 = u_xlat16_14.x * u_xlat10_54 + u_xlat16_85;
            vec3 txVec6 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_85 = u_xlat16_14.z * u_xlat10_54 + u_xlat16_85;
            vec3 txVec7 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_85 = u_xlat16_14.w * u_xlat10_54 + u_xlat16_85;
            vec3 txVec8 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_85 = u_xlat16_15.x * u_xlat10_54 + u_xlat16_85;
            vec3 txVec9 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_85 = u_xlat16_15.y * u_xlat10_54 + u_xlat16_85;
            vec3 txVec10 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_85 = u_xlat16_15.z * u_xlat10_54 + u_xlat16_85;
            vec3 txVec11 = vec3(u_xlat16_7.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_85 = u_xlat16_15.w * u_xlat10_54 + u_xlat16_85;
            vec3 txVec12 = vec3(u_xlat16_7.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_35 = u_xlat16_60.x * u_xlat10_54 + u_xlat16_85;
        } else {
            u_xlat16_60.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_8.yw = u_xlat16_7.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_61.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_12.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_62.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_12.xy;
            u_xlat16_62.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.zw = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_6.yw;
            u_xlat16_12 = u_xlat16_12 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_6.z = u_xlat16_12.z * 0.0816320032;
            u_xlat16_7.xy = u_xlat16_61.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_61.xy = u_xlat16_12.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_7.z = u_xlat16_12.w * 0.0816320032;
            u_xlat16_6.x = u_xlat16_7.y;
            u_xlat16_6.yw = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_9.xz = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_9.y = u_xlat16_61.x;
            u_xlat16_9.w = u_xlat16_8.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_9;
            u_xlat16_7.yw = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_61.y;
            u_xlat16_7 = u_xlat16_7 + u_xlat16_8;
            u_xlat16_9 = u_xlat16_9 / u_xlat16_6;
            u_xlat16_9 = u_xlat16_9 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8 / u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_9 = u_xlat16_9.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_8 = u_xlat16_8.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_11.xzw = u_xlat16_9.yzw;
            u_xlat16_11.y = u_xlat16_8.x;
            u_xlat16_12 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_13.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.y = u_xlat16_11.y;
            u_xlat16_11.y = u_xlat16_8.z;
            u_xlat16_14 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_63.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.z = u_xlat16_11.y;
            u_xlat16_15 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyxz;
            u_xlat16_11.y = u_xlat16_8.w;
            u_xlat16_16 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_17.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_67.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.xw;
            u_xlat16_8.xzw = u_xlat16_11.xzw;
            u_xlat16_11 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_18.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_8.x = u_xlat16_9.x;
            u_xlat16_60.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xy;
            u_xlat16_8 = u_xlat16_6 * u_xlat16_7.xxxx;
            u_xlat16_9 = u_xlat16_6 * u_xlat16_7.yyyy;
            u_xlat16_19 = u_xlat16_6 * u_xlat16_7.zzzz;
            u_xlat16_6 = u_xlat16_6 * u_xlat16_7.wwww;
            vec3 txVec13 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_79 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_12.x = u_xlat10_79 * u_xlat16_8.y;
            u_xlat16_12.x = u_xlat16_8.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec15 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_12.x = u_xlat16_8.z * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec16 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_12.x = u_xlat16_8.w * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec17 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_12.x = u_xlat16_9.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec18 = vec3(u_xlat16_14.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_12.x = u_xlat16_9.y * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec19 = vec3(u_xlat16_63.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_12.x = u_xlat16_9.z * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec20 = vec3(u_xlat16_15.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_12.x = u_xlat16_9.w * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec21 = vec3(u_xlat16_16.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_12.x = u_xlat16_19.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec22 = vec3(u_xlat16_16.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_12.x = u_xlat16_19.y * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec23 = vec3(u_xlat16_17.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_12.x = u_xlat16_19.z * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec24 = vec3(u_xlat16_67.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_12.x = u_xlat16_19.w * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec25 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_11.x = u_xlat16_6.x * u_xlat10_54 + u_xlat16_12.x;
            vec3 txVec26 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_11.x = u_xlat16_6.y * u_xlat10_54 + u_xlat16_11.x;
            vec3 txVec27 = vec3(u_xlat16_18.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_11.x = u_xlat16_6.z * u_xlat10_54 + u_xlat16_11.x;
            vec3 txVec28 = vec3(u_xlat16_60.xy,u_xlat2.w);
            u_xlat10_54 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_35 = u_xlat16_6.w * u_xlat10_54 + u_xlat16_11.x;
        }
    }
    u_xlat16_60.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat16_35 * u_xlat16_60.x + u_xlat16_10.x;
    u_xlat20.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vs_TEXCOORD2.xyz;
    u_xlat54 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat79 = _Delta_ShadowCenter.w + 1.0;
    u_xlat54 = u_xlat79 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat79 = (-u_xlat16_10.x) + 1.0;
    u_xlat79 = (-u_xlat79) * _ShadowIntensity + 1.0;
    u_xlat79 = max(u_xlat79, 0.0);
    u_xlat5.x = (-u_xlat54) + 1.0;
    u_xlat54 = u_xlat79 * u_xlat5.x + u_xlat54;
    u_xlat20.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz + _Shadow_Color.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat20.xyz) * u_xlat10_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat20.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat20.xyz = u_xlat10_2.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat21.xyz = u_xlat10_2.xyz * u_xlat20.xyz;
    u_xlat54 = (-u_xlat4.x) + 1.0;
    u_xlat22.xyz = u_xlat21.xyz * vec3(u_xlat54);
    u_xlat76 = u_xlat76 * u_xlat76;
    u_xlat76 = max(u_xlat76, 0.100000001);
    u_xlat79 = u_xlat4.y * u_xlat4.y;
    u_xlat95 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat76 = u_xlat76 * u_xlat95;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat79 = u_xlat79 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat79 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat76 = u_xlat76 * u_xlat3.x;
    u_xlat76 = u_xlat79 / u_xlat76;
    u_xlat76 = u_xlat76 * 0.25 + -9.99999975e-06;
    u_xlat76 = max(u_xlat76, 0.0);
    u_xlat76 = min(u_xlat76, 20.0);
    u_xlat20.xyz = u_xlat10_2.xyz * u_xlat20.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat23.xyz = u_xlat4.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = vec3(u_xlat54) * _Ambient_Color.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat24.xyz;
    u_xlat21.xyz = vec3(u_xlat78) * u_xlat21.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat24.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_6 = textureCubeLodEXT(_Cubemap, u_xlat24.xyz, u_xlat3.x);
    u_xlat24.xzw = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xzw = u_xlat10_6.xyz * u_xlat24.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xzw = u_xlat10_6.xyz * u_xlat24.xzw;
    u_xlat24.xzw = u_xlat10_6.www * u_xlat24.xzw;
    u_xlat24.xzw = vec3(u_xlat78) * u_xlat24.xzw;
    u_xlat3.x = u_xlat24.y * 0.200000003 + 0.800000012;
    u_xlat24.xyz = u_xlat3.xxx * u_xlat24.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat78 = u_xlat10_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat20.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat78) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat50 = (-u_xlat50) + 1.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat20.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat50) * u_xlat20.xyz + u_xlat4.xyz;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_50 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3 = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3 * _RimNoise_Speed.w;
    u_xlat78 = u_xlat28.y * 255.0;
    u_xlatb78 = _Rim2_Threshold<u_xlat78;
    u_xlat20.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat20.z = vs_TEXCOORD7.z;
    u_xlat79 = dot(u_xlat1.xyz, u_xlat20.xyz);
    u_xlat79 = max(u_xlat79, 0.0);
    u_xlat79 = (-u_xlat3.x) * u_xlat10_50 + u_xlat79;
    u_xlat79 = clamp(u_xlat79, 0.0, 1.0);
    u_xlat20.x = u_xlat79 * -2.0 + 3.0;
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = u_xlat79 * u_xlat20.x;
    u_xlat79 = min(u_xlat79, 1.0);
    u_xlat20.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat20.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat20.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat50 = (-u_xlat3.x) * u_xlat10_50 + u_xlat1.x;
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
    u_xlat1.x = u_xlat50 * -2.0 + 3.0;
    u_xlat50 = u_xlat50 * u_xlat50;
    u_xlat50 = u_xlat50 * u_xlat1.x;
    u_xlat50 = min(u_xlat50, 1.0);
    u_xlat1.xyz = (bool(u_xlatb78)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat3.x = (u_xlatb78) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat28.x = (u_xlatb78) ? u_xlat79 : u_xlat50;
    u_xlat10_28.xyz = texture2D(_Rim_Ramp, u_xlat28.xy).xyz;
    u_xlat50 = u_xlat3.x * u_xlat10_5.y;
    u_xlat3.xyz = u_xlat10_28.xyz * vec3(u_xlat50);
    u_xlatb50 = _EMISSION_ON==1.0;
    if(u_xlatb50){
        u_xlat10_0.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat20.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat20.xyz = u_xlat10_0.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat20.xyz;
        u_xlat78 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat78);
        u_xlat78 = _Time.y * _Em_Speed;
        u_xlat78 = sin(u_xlat78);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat78)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat20.xyz = vec3(u_xlat76) * u_xlat23.xyz + u_xlat22.xyz;
    u_xlat20.xyz = u_xlat20.xyz * _DirectionalLight_Color.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(u_xlat75) + u_xlat21.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat24.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat20.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyz;
    u_xlat16_10.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_10.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat13;
vec2 u_xlat15;
float u_xlat17;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat29;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat16_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat37, 0.0);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat9.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat9.xyz, u_xlat3.x);
    u_xlat9.xzw = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat16_10.xyz;
    u_xlat9.xzw = u_xlat16_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat3.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat39 = u_xlat16_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = u_xlat3.xxx + (-u_xlat5.xyz);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_USE_UVMAP==1.0);
#else
    u_xlatb24 = _USE_UVMAP==1.0;
#endif
    if(u_xlatb24){
        u_xlat3.xw = texture(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_24 = texture(_LG_Tex, u_xlat3.xw).x;
    u_xlat16_3.x = texture(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat24 = u_xlat16_24 * u_xlat16_3.x;
    u_xlat24 = u_xlat24 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_5 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3.x = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3.x * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_Rim2_Threshold<u_xlat39);
#else
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
#endif
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat17 = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat17 = max(u_xlat17, 0.0);
    u_xlat17 = (-u_xlat3.x) * u_xlat16_5 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat29 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat29;
    u_xlat17 = min(u_xlat17, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat16_5 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat5.xzw = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat13 = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat17 : u_xlat1.x;
    u_xlat16_3.xyz = texture(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat1.x = u_xlat13 * u_xlat16_28.y;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb3 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb3){
        u_xlat16_3.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat10.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat10.xyz = u_xlat16_3.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat16_3.xyz * u_xlat10.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat7.xyz = u_xlat1.www * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat7.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat24) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat13;
vec2 u_xlat15;
float u_xlat17;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat29;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat16_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat37, 0.0);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat9.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat9.xyz, u_xlat3.x);
    u_xlat9.xzw = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat16_10.xyz;
    u_xlat9.xzw = u_xlat16_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat3.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat39 = u_xlat16_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = u_xlat3.xxx + (-u_xlat5.xyz);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_USE_UVMAP==1.0);
#else
    u_xlatb24 = _USE_UVMAP==1.0;
#endif
    if(u_xlatb24){
        u_xlat3.xw = texture(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_24 = texture(_LG_Tex, u_xlat3.xw).x;
    u_xlat16_3.x = texture(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat24 = u_xlat16_24 * u_xlat16_3.x;
    u_xlat24 = u_xlat24 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_5 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3.x = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3.x * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_Rim2_Threshold<u_xlat39);
#else
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
#endif
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat17 = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat17 = max(u_xlat17, 0.0);
    u_xlat17 = (-u_xlat3.x) * u_xlat16_5 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat29 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat29;
    u_xlat17 = min(u_xlat17, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat16_5 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat5.xzw = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat13 = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat17 : u_xlat1.x;
    u_xlat16_3.xyz = texture(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat1.x = u_xlat13 * u_xlat16_28.y;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb3 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb3){
        u_xlat16_3.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat10.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat10.xyz = u_xlat16_3.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat16_3.xyz * u_xlat10.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat7.xyz = u_xlat1.www * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat7.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat24) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
mediump vec3 u_xlat16_11;
float u_xlat13;
vec2 u_xlat15;
float u_xlat17;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat28;
lowp vec2 u_xlat10_28;
float u_xlat29;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_28.xy = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat10_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat37, 0.0);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat9.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_10 = textureCubeLodEXT(_Cubemap, u_xlat9.xyz, u_xlat3.x);
    u_xlat9.xzw = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10_10.xyz;
    u_xlat9.xzw = u_xlat10_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat3.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat39 = u_xlat10_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = u_xlat3.xxx + (-u_xlat5.xyz);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlatb24 = _USE_UVMAP==1.0;
    if(u_xlatb24){
        u_xlat3.xw = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_24 = texture2D(_LG_Tex, u_xlat3.xw).x;
    u_xlat10_3.x = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat24 = u_xlat10_24 * u_xlat10_3.x;
    u_xlat24 = u_xlat24 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_5 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3.x = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3.x * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat17 = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat17 = max(u_xlat17, 0.0);
    u_xlat17 = (-u_xlat3.x) * u_xlat10_5 + u_xlat17;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat29 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat29;
    u_xlat17 = min(u_xlat17, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat10_5 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat5.xzw = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat13 = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat17 : u_xlat1.x;
    u_xlat10_3.xyz = texture2D(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat1.x = u_xlat13 * u_xlat10_28.y;
    u_xlat1.xyz = u_xlat10_3.xyz * u_xlat1.xxx;
    u_xlatb3 = _EMISSION_ON==1.0;
    if(u_xlatb3){
        u_xlat10_3.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat10.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat10.xyz = u_xlat10_3.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat10_3.xyz * u_xlat10.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat7.xyz = u_xlat1.www * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat7.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat24) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
mediump vec3 u_xlat16_11;
float u_xlat13;
vec2 u_xlat15;
float u_xlat17;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat28;
lowp vec2 u_xlat10_28;
float u_xlat29;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_28.xy = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat10_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat37, 0.0);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat9.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_10 = textureCubeLodEXT(_Cubemap, u_xlat9.xyz, u_xlat3.x);
    u_xlat9.xzw = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10_10.xyz;
    u_xlat9.xzw = u_xlat10_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat3.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat39 = u_xlat10_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = u_xlat3.xxx + (-u_xlat5.xyz);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlatb24 = _USE_UVMAP==1.0;
    if(u_xlatb24){
        u_xlat3.xw = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_24 = texture2D(_LG_Tex, u_xlat3.xw).x;
    u_xlat10_3.x = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat24 = u_xlat10_24 * u_xlat10_3.x;
    u_xlat24 = u_xlat24 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_5 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3.x = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3.x * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat17 = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat17 = max(u_xlat17, 0.0);
    u_xlat17 = (-u_xlat3.x) * u_xlat10_5 + u_xlat17;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat29 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat29;
    u_xlat17 = min(u_xlat17, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat10_5 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat5.xzw = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat13 = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat17 : u_xlat1.x;
    u_xlat10_3.xyz = texture2D(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat1.x = u_xlat13 * u_xlat10_28.y;
    u_xlat1.xyz = u_xlat10_3.xyz * u_xlat1.xxx;
    u_xlatb3 = _EMISSION_ON==1.0;
    if(u_xlatb3){
        u_xlat10_3.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat10.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat10.xyz = u_xlat10_3.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat10_3.xyz * u_xlat10.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat7.xyz = u_xlat1.www * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat7.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat5.xzw + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat24) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(9) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(10) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec4 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec4 u_xlat24;
vec3 u_xlat25;
float u_xlat27;
vec2 u_xlat29;
mediump float u_xlat16_36;
vec3 u_xlat46;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
float u_xlat56;
mediump float u_xlat10_56;
bool u_xlatb56;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_64;
mediump vec2 u_xlat16_65;
mediump vec2 u_xlat16_69;
float u_xlat78;
float u_xlat79;
mediump float u_xlat16_80;
float u_xlat81;
bool u_xlatb81;
float u_xlat82;
mediump float u_xlat16_82;
mediump float u_xlat10_82;
mediump float u_xlat16_88;
float u_xlat98;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_80 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_2.xyz = vec3(u_xlat16_80) * u_xlat16_2.xyz;
    u_xlat52 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat78 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat79 = max(u_xlat79, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat29.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat81 = (-u_xlat16_5.x) + 1.0;
    u_xlat81 = u_xlat81 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat81) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb56 = _ShadowBias.z!=0.0;
#endif
    u_xlat82 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat6.xyz = vec3(u_xlat82) * _WorldSpaceLightPos0.xyz;
    u_xlat82 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
    u_xlat82 = (-u_xlat82) * u_xlat82 + 1.0;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 * _ShadowBias.z;
    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat82) + vs_TEXCOORD2.xyz;
    u_xlat6.xyz = (bool(u_xlatb56)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat8;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat9;
    u_xlat7 = u_xlat6.yyyy * u_xlat7;
    u_xlat2 = u_xlat2 * u_xlat6.xxxx + u_xlat7;
    u_xlat2 = u_xlat8 * u_xlat6.zzzz + u_xlat2;
    u_xlat2 = u_xlat9 + u_xlat2;
    u_xlat56 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat2.z + (-u_xlat56);
    u_xlat82 = max((-u_xlat2.w), u_xlat56);
    u_xlat82 = (-u_xlat56) + u_xlat82;
    u_xlat2.z = _ShadowBias.y * u_xlat82 + u_xlat56;
    u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_10.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(_softShadowQuality==1.0);
#else
    u_xlatb56 = _softShadowQuality==1.0;
#endif
    if(u_xlatb56){
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat2.xyw + u_xlat6.xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_36 = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(_softShadowQuality==2.0);
#else
        u_xlatb56 = _softShadowQuality==2.0;
#endif
        if(u_xlatb56){
            u_xlat16_62.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_62.xy = floor(u_xlat16_62.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_62.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_63.xy = u_xlat16_7.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_12.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_64.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_13.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_13.xy = (-u_xlat16_13.xy) * u_xlat16_13.xy + u_xlat16_64.xy;
            u_xlat16_11.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_6.yw;
            u_xlat16_13.xy = u_xlat16_13.xy + vec2(1.0, 1.0);
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_7.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_64.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_13.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_12.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_6.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_7.z = u_xlat16_9.x;
            u_xlat16_7.w = u_xlat16_11.x;
            u_xlat16_8.z = u_xlat16_12.x;
            u_xlat16_8.w = u_xlat16_63.x;
            u_xlat16_6 = u_xlat16_7.zwxz + u_xlat16_8.zwxz;
            u_xlat16_9.z = u_xlat16_7.y;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_12.z = u_xlat16_8.y;
            u_xlat16_12.w = u_xlat16_63.y;
            u_xlat16_11.xyz = u_xlat16_9.zyw + u_xlat16_12.zyw;
            u_xlat16_13.xyz = u_xlat16_8.xzw / u_xlat16_6.zwy;
            u_xlat16_13.xyz = u_xlat16_13.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_12.xyz = u_xlat16_12.zyw / u_xlat16_11.xyz;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_7.xyz = u_xlat16_13.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_8.xyz = u_xlat16_12.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_7.w = u_xlat16_8.x;
            u_xlat16_9 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.ywxw;
            u_xlat16_12.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.zw;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_7.yw = u_xlat16_8.yz;
            u_xlat16_13 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_8 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.wywz;
            u_xlat16_7 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xwzw;
            u_xlat16_14 = u_xlat16_6.zwyz * u_xlat16_11.xxxy;
            u_xlat16_15 = u_xlat16_6 * u_xlat16_11.yyzz;
            u_xlat16_62.x = u_xlat16_6.y * u_xlat16_11.z;
            vec3 txVec4 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_82 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_88 = u_xlat10_82 * u_xlat16_14.y;
            u_xlat16_88 = u_xlat16_14.x * u_xlat10_56 + u_xlat16_88;
            vec3 txVec6 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_88 = u_xlat16_14.z * u_xlat10_56 + u_xlat16_88;
            vec3 txVec7 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_88 = u_xlat16_14.w * u_xlat10_56 + u_xlat16_88;
            vec3 txVec8 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_88 = u_xlat16_15.x * u_xlat10_56 + u_xlat16_88;
            vec3 txVec9 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_88 = u_xlat16_15.y * u_xlat10_56 + u_xlat16_88;
            vec3 txVec10 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_88 = u_xlat16_15.z * u_xlat10_56 + u_xlat16_88;
            vec3 txVec11 = vec3(u_xlat16_7.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_88 = u_xlat16_15.w * u_xlat10_56 + u_xlat16_88;
            vec3 txVec12 = vec3(u_xlat16_7.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_36 = u_xlat16_62.x * u_xlat10_56 + u_xlat16_88;
        } else {
            u_xlat16_62.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_62.xy = floor(u_xlat16_62.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_62.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_8.yw = u_xlat16_7.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_63.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_12.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_64.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_64.xy) * u_xlat16_64.xy + u_xlat16_12.xy;
            u_xlat16_64.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.zw = (-u_xlat16_64.xy) * u_xlat16_64.xy + u_xlat16_6.yw;
            u_xlat16_12 = u_xlat16_12 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_6.z = u_xlat16_12.z * 0.0816320032;
            u_xlat16_7.xy = u_xlat16_63.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_63.xy = u_xlat16_12.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_7.z = u_xlat16_12.w * 0.0816320032;
            u_xlat16_6.x = u_xlat16_7.y;
            u_xlat16_6.yw = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_9.xz = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_9.y = u_xlat16_63.x;
            u_xlat16_9.w = u_xlat16_8.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_9;
            u_xlat16_7.yw = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_63.y;
            u_xlat16_7 = u_xlat16_7 + u_xlat16_8;
            u_xlat16_9 = u_xlat16_9 / u_xlat16_6;
            u_xlat16_9 = u_xlat16_9 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8 / u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_9 = u_xlat16_9.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_8 = u_xlat16_8.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_11.xzw = u_xlat16_9.yzw;
            u_xlat16_11.y = u_xlat16_8.x;
            u_xlat16_12 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_13.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.y = u_xlat16_11.y;
            u_xlat16_11.y = u_xlat16_8.z;
            u_xlat16_14 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_65.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.z = u_xlat16_11.y;
            u_xlat16_15 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyxz;
            u_xlat16_11.y = u_xlat16_8.w;
            u_xlat16_16 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_17.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_69.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.xw;
            u_xlat16_8.xzw = u_xlat16_11.xzw;
            u_xlat16_11 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_18.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_8.x = u_xlat16_9.x;
            u_xlat16_62.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xy;
            u_xlat16_8 = u_xlat16_6 * u_xlat16_7.xxxx;
            u_xlat16_9 = u_xlat16_6 * u_xlat16_7.yyyy;
            u_xlat16_19 = u_xlat16_6 * u_xlat16_7.zzzz;
            u_xlat16_6 = u_xlat16_6 * u_xlat16_7.wwww;
            vec3 txVec13 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_82 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_12.x = u_xlat10_82 * u_xlat16_8.y;
            u_xlat16_12.x = u_xlat16_8.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec15 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_12.x = u_xlat16_8.z * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec16 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_12.x = u_xlat16_8.w * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec17 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_12.x = u_xlat16_9.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec18 = vec3(u_xlat16_14.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_12.x = u_xlat16_9.y * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec19 = vec3(u_xlat16_65.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_12.x = u_xlat16_9.z * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec20 = vec3(u_xlat16_15.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_12.x = u_xlat16_9.w * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec21 = vec3(u_xlat16_16.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_12.x = u_xlat16_19.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec22 = vec3(u_xlat16_16.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_12.x = u_xlat16_19.y * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec23 = vec3(u_xlat16_17.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_12.x = u_xlat16_19.z * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec24 = vec3(u_xlat16_69.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_12.x = u_xlat16_19.w * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec25 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_11.x = u_xlat16_6.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec26 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_11.x = u_xlat16_6.y * u_xlat10_56 + u_xlat16_11.x;
            vec3 txVec27 = vec3(u_xlat16_18.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_11.x = u_xlat16_6.z * u_xlat10_56 + u_xlat16_11.x;
            vec3 txVec28 = vec3(u_xlat16_62.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_36 = u_xlat16_6.w * u_xlat10_56 + u_xlat16_11.x;
        }
    }
    u_xlat16_62.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat16_36 * u_xlat16_62.x + u_xlat16_10.x;
    u_xlat20.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vs_TEXCOORD2.xyz;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56 = sqrt(u_xlat56);
    u_xlat82 = _Delta_ShadowCenter.w + 1.0;
    u_xlat56 = u_xlat82 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = min(u_xlat56, 1.0);
    u_xlat82 = (-u_xlat16_10.x) + 1.0;
    u_xlat82 = (-u_xlat82) * _ShadowIntensity + 1.0;
    u_xlat82 = max(u_xlat82, 0.0);
    u_xlat5.x = (-u_xlat56) + 1.0;
    u_xlat56 = u_xlat82 * u_xlat5.x + u_xlat56;
    u_xlat20.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat20.xyz = vec3(u_xlat56) * u_xlat20.xyz + _Shadow_Color.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat20.xyz) * u_xlat16_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat20.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat20.xyz = u_xlat16_2.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat21.xyz = u_xlat16_2.xyz * u_xlat20.xyz;
    u_xlat56 = (-u_xlat4.x) + 1.0;
    u_xlat22.xyz = u_xlat21.xyz * vec3(u_xlat56);
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = max(u_xlat79, 0.100000001);
    u_xlat82 = u_xlat4.y * u_xlat4.y;
    u_xlat98 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat79 = u_xlat79 * u_xlat98;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat82 = u_xlat82 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat82 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat79 = u_xlat79 * u_xlat3.x;
    u_xlat79 = u_xlat82 / u_xlat79;
    u_xlat79 = u_xlat79 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat79, 0.0);
    u_xlat20.xyz = u_xlat16_2.xyz * u_xlat20.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat23.xyz = u_xlat4.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = vec3(u_xlat56) * _Ambient_Color.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat24.xyz;
    u_xlat21.xyz = vec3(u_xlat81) * u_xlat21.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat24.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_6 = textureLod(_Cubemap, u_xlat24.xyz, u_xlat3.x);
    u_xlat24.xzw = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xzw = u_xlat16_6.xyz * u_xlat24.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xzw = u_xlat16_6.xyz * u_xlat24.xzw;
    u_xlat24.xzw = u_xlat16_6.www * u_xlat24.xzw;
    u_xlat24.xzw = vec3(u_xlat81) * u_xlat24.xzw;
    u_xlat3.x = u_xlat24.y * 0.200000003 + 0.800000012;
    u_xlat24.xyz = u_xlat3.xxx * u_xlat24.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat81 = u_xlat16_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat20.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat81) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat52 = (-u_xlat52) + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat20.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat52) * u_xlat20.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_USE_UVMAP==1.0);
#else
    u_xlatb52 = _USE_UVMAP==1.0;
#endif
    if(u_xlatb52){
        u_xlat3.xw = texture(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_52 = texture(_LG_Tex, u_xlat3.xw).x;
    u_xlat16_3.x = texture(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat52 = u_xlat16_52 * u_xlat16_3.x;
    u_xlat52 = u_xlat52 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_82 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3.x = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3.x * _RimNoise_Speed.w;
    u_xlat81 = u_xlat29.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(_Rim2_Threshold<u_xlat81);
#else
    u_xlatb81 = _Rim2_Threshold<u_xlat81;
#endif
    u_xlat20.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat20.z = vs_TEXCOORD7.z;
    u_xlat20.x = dot(u_xlat1.xyz, u_xlat20.xyz);
    u_xlat20.x = max(u_xlat20.x, 0.0);
    u_xlat20.x = (-u_xlat3.x) * u_xlat16_82 + u_xlat20.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat46.x = u_xlat20.x * -2.0 + 3.0;
    u_xlat20.x = u_xlat20.x * u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat46.x;
    u_xlat20.x = min(u_xlat20.x, 1.0);
    u_xlat25.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat25.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat25.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat16_82 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat27;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat46.xyz = (bool(u_xlatb81)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat27 = (u_xlatb81) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat29.x = (u_xlatb81) ? u_xlat20.x : u_xlat1.x;
    u_xlat16_3.xyz = texture(_Rim_Ramp, u_xlat29.xy).xyz;
    u_xlat1.x = u_xlat27 * u_xlat16_5.y;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb3 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb3){
        u_xlat16_3.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat25.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat25.xyz = u_xlat16_3.xyz * u_xlat25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat16_3.xyz * u_xlat25.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat22.xyz = u_xlat1.www * u_xlat23.xyz + u_xlat22.xyz;
    u_xlat22.xyz = u_xlat22.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat22.xyz * vec3(u_xlat78) + u_xlat21.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat24.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat46.xyz + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat52) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xzw + u_xlat3.xyz;
    u_xlat16_10.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_10.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(9) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(10) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec4 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec4 u_xlat24;
vec3 u_xlat25;
float u_xlat27;
vec2 u_xlat29;
mediump float u_xlat16_36;
vec3 u_xlat46;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
float u_xlat56;
mediump float u_xlat10_56;
bool u_xlatb56;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_64;
mediump vec2 u_xlat16_65;
mediump vec2 u_xlat16_69;
float u_xlat78;
float u_xlat79;
mediump float u_xlat16_80;
float u_xlat81;
bool u_xlatb81;
float u_xlat82;
mediump float u_xlat16_82;
mediump float u_xlat10_82;
mediump float u_xlat16_88;
float u_xlat98;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_80 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_2.xyz = vec3(u_xlat16_80) * u_xlat16_2.xyz;
    u_xlat52 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat78 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat78 = min(max(u_xlat78, 0.0), 1.0);
#else
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
#endif
    u_xlat79 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat79 = max(u_xlat79, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat29.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat81 = (-u_xlat16_5.x) + 1.0;
    u_xlat81 = u_xlat81 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat81 = (-u_xlat81) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb56 = _ShadowBias.z!=0.0;
#endif
    u_xlat82 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat6.xyz = vec3(u_xlat82) * _WorldSpaceLightPos0.xyz;
    u_xlat82 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
    u_xlat82 = (-u_xlat82) * u_xlat82 + 1.0;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 * _ShadowBias.z;
    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat82) + vs_TEXCOORD2.xyz;
    u_xlat6.xyz = (bool(u_xlatb56)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat8;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat9;
    u_xlat7 = u_xlat6.yyyy * u_xlat7;
    u_xlat2 = u_xlat2 * u_xlat6.xxxx + u_xlat7;
    u_xlat2 = u_xlat8 * u_xlat6.zzzz + u_xlat2;
    u_xlat2 = u_xlat9 + u_xlat2;
    u_xlat56 = _ShadowBias.x / u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat2.z + (-u_xlat56);
    u_xlat82 = max((-u_xlat2.w), u_xlat56);
    u_xlat82 = (-u_xlat56) + u_xlat82;
    u_xlat2.z = _ShadowBias.y * u_xlat82 + u_xlat56;
    u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_10.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(_softShadowQuality==1.0);
#else
    u_xlatb56 = _softShadowQuality==1.0;
#endif
    if(u_xlatb56){
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat2.xyw + u_xlat6.xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_36 = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(_softShadowQuality==2.0);
#else
        u_xlatb56 = _softShadowQuality==2.0;
#endif
        if(u_xlatb56){
            u_xlat16_62.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_62.xy = floor(u_xlat16_62.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_62.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_63.xy = u_xlat16_7.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_12.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_64.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_13.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_13.xy = (-u_xlat16_13.xy) * u_xlat16_13.xy + u_xlat16_64.xy;
            u_xlat16_11.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_6.yw;
            u_xlat16_13.xy = u_xlat16_13.xy + vec2(1.0, 1.0);
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_7.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_64.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_13.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_12.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_6.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_7.z = u_xlat16_9.x;
            u_xlat16_7.w = u_xlat16_11.x;
            u_xlat16_8.z = u_xlat16_12.x;
            u_xlat16_8.w = u_xlat16_63.x;
            u_xlat16_6 = u_xlat16_7.zwxz + u_xlat16_8.zwxz;
            u_xlat16_9.z = u_xlat16_7.y;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_12.z = u_xlat16_8.y;
            u_xlat16_12.w = u_xlat16_63.y;
            u_xlat16_11.xyz = u_xlat16_9.zyw + u_xlat16_12.zyw;
            u_xlat16_13.xyz = u_xlat16_8.xzw / u_xlat16_6.zwy;
            u_xlat16_13.xyz = u_xlat16_13.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_12.xyz = u_xlat16_12.zyw / u_xlat16_11.xyz;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_7.xyz = u_xlat16_13.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_8.xyz = u_xlat16_12.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_7.w = u_xlat16_8.x;
            u_xlat16_9 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.ywxw;
            u_xlat16_12.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.zw;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_7.yw = u_xlat16_8.yz;
            u_xlat16_13 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_8 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.wywz;
            u_xlat16_7 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xwzw;
            u_xlat16_14 = u_xlat16_6.zwyz * u_xlat16_11.xxxy;
            u_xlat16_15 = u_xlat16_6 * u_xlat16_11.yyzz;
            u_xlat16_62.x = u_xlat16_6.y * u_xlat16_11.z;
            vec3 txVec4 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_82 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_88 = u_xlat10_82 * u_xlat16_14.y;
            u_xlat16_88 = u_xlat16_14.x * u_xlat10_56 + u_xlat16_88;
            vec3 txVec6 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_88 = u_xlat16_14.z * u_xlat10_56 + u_xlat16_88;
            vec3 txVec7 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_88 = u_xlat16_14.w * u_xlat10_56 + u_xlat16_88;
            vec3 txVec8 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_88 = u_xlat16_15.x * u_xlat10_56 + u_xlat16_88;
            vec3 txVec9 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_88 = u_xlat16_15.y * u_xlat10_56 + u_xlat16_88;
            vec3 txVec10 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_88 = u_xlat16_15.z * u_xlat10_56 + u_xlat16_88;
            vec3 txVec11 = vec3(u_xlat16_7.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_88 = u_xlat16_15.w * u_xlat10_56 + u_xlat16_88;
            vec3 txVec12 = vec3(u_xlat16_7.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_36 = u_xlat16_62.x * u_xlat10_56 + u_xlat16_88;
        } else {
            u_xlat16_62.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_62.xy = floor(u_xlat16_62.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_62.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_8.yw = u_xlat16_7.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_63.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_12.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_64.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_64.xy) * u_xlat16_64.xy + u_xlat16_12.xy;
            u_xlat16_64.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.zw = (-u_xlat16_64.xy) * u_xlat16_64.xy + u_xlat16_6.yw;
            u_xlat16_12 = u_xlat16_12 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_6.z = u_xlat16_12.z * 0.0816320032;
            u_xlat16_7.xy = u_xlat16_63.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_63.xy = u_xlat16_12.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_7.z = u_xlat16_12.w * 0.0816320032;
            u_xlat16_6.x = u_xlat16_7.y;
            u_xlat16_6.yw = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_9.xz = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_9.y = u_xlat16_63.x;
            u_xlat16_9.w = u_xlat16_8.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_9;
            u_xlat16_7.yw = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_63.y;
            u_xlat16_7 = u_xlat16_7 + u_xlat16_8;
            u_xlat16_9 = u_xlat16_9 / u_xlat16_6;
            u_xlat16_9 = u_xlat16_9 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8 / u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_9 = u_xlat16_9.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_8 = u_xlat16_8.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_11.xzw = u_xlat16_9.yzw;
            u_xlat16_11.y = u_xlat16_8.x;
            u_xlat16_12 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_13.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.y = u_xlat16_11.y;
            u_xlat16_11.y = u_xlat16_8.z;
            u_xlat16_14 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_65.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.z = u_xlat16_11.y;
            u_xlat16_15 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyxz;
            u_xlat16_11.y = u_xlat16_8.w;
            u_xlat16_16 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_17.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_69.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.xw;
            u_xlat16_8.xzw = u_xlat16_11.xzw;
            u_xlat16_11 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_18.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_8.x = u_xlat16_9.x;
            u_xlat16_62.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xy;
            u_xlat16_8 = u_xlat16_6 * u_xlat16_7.xxxx;
            u_xlat16_9 = u_xlat16_6 * u_xlat16_7.yyyy;
            u_xlat16_19 = u_xlat16_6 * u_xlat16_7.zzzz;
            u_xlat16_6 = u_xlat16_6 * u_xlat16_7.wwww;
            vec3 txVec13 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_82 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_12.x = u_xlat10_82 * u_xlat16_8.y;
            u_xlat16_12.x = u_xlat16_8.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec15 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_12.x = u_xlat16_8.z * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec16 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_12.x = u_xlat16_8.w * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec17 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_12.x = u_xlat16_9.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec18 = vec3(u_xlat16_14.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_12.x = u_xlat16_9.y * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec19 = vec3(u_xlat16_65.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_12.x = u_xlat16_9.z * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec20 = vec3(u_xlat16_15.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_12.x = u_xlat16_9.w * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec21 = vec3(u_xlat16_16.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_12.x = u_xlat16_19.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec22 = vec3(u_xlat16_16.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_12.x = u_xlat16_19.y * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec23 = vec3(u_xlat16_17.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_12.x = u_xlat16_19.z * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec24 = vec3(u_xlat16_69.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_12.x = u_xlat16_19.w * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec25 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_11.x = u_xlat16_6.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec26 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_11.x = u_xlat16_6.y * u_xlat10_56 + u_xlat16_11.x;
            vec3 txVec27 = vec3(u_xlat16_18.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_11.x = u_xlat16_6.z * u_xlat10_56 + u_xlat16_11.x;
            vec3 txVec28 = vec3(u_xlat16_62.xy,u_xlat2.w);
            u_xlat10_56 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_36 = u_xlat16_6.w * u_xlat10_56 + u_xlat16_11.x;
        }
    }
    u_xlat16_62.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat16_36 * u_xlat16_62.x + u_xlat16_10.x;
    u_xlat20.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vs_TEXCOORD2.xyz;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56 = sqrt(u_xlat56);
    u_xlat82 = _Delta_ShadowCenter.w + 1.0;
    u_xlat56 = u_xlat82 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = min(u_xlat56, 1.0);
    u_xlat82 = (-u_xlat16_10.x) + 1.0;
    u_xlat82 = (-u_xlat82) * _ShadowIntensity + 1.0;
    u_xlat82 = max(u_xlat82, 0.0);
    u_xlat5.x = (-u_xlat56) + 1.0;
    u_xlat56 = u_xlat82 * u_xlat5.x + u_xlat56;
    u_xlat20.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat20.xyz = vec3(u_xlat56) * u_xlat20.xyz + _Shadow_Color.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat20.xyz) * u_xlat16_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat20.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat20.xyz = u_xlat16_2.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat21.xyz = u_xlat16_2.xyz * u_xlat20.xyz;
    u_xlat56 = (-u_xlat4.x) + 1.0;
    u_xlat22.xyz = u_xlat21.xyz * vec3(u_xlat56);
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = max(u_xlat79, 0.100000001);
    u_xlat82 = u_xlat4.y * u_xlat4.y;
    u_xlat98 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat79 = u_xlat79 * u_xlat98;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat82 = u_xlat82 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat82 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat79 = u_xlat79 * u_xlat3.x;
    u_xlat79 = u_xlat82 / u_xlat79;
    u_xlat79 = u_xlat79 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat79, 0.0);
    u_xlat20.xyz = u_xlat16_2.xyz * u_xlat20.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat23.xyz = u_xlat4.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = vec3(u_xlat56) * _Ambient_Color.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat24.xyz;
    u_xlat21.xyz = vec3(u_xlat81) * u_xlat21.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat24.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat16_6 = textureLod(_Cubemap, u_xlat24.xyz, u_xlat3.x);
    u_xlat24.xzw = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xzw = u_xlat16_6.xyz * u_xlat24.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xzw = u_xlat16_6.xyz * u_xlat24.xzw;
    u_xlat24.xzw = u_xlat16_6.www * u_xlat24.xzw;
    u_xlat24.xzw = vec3(u_xlat81) * u_xlat24.xzw;
    u_xlat3.x = u_xlat24.y * 0.200000003 + 0.800000012;
    u_xlat24.xyz = u_xlat3.xxx * u_xlat24.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat81 = u_xlat16_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat20.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat81) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat52 = (-u_xlat52) + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat20.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat52) * u_xlat20.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_USE_UVMAP==1.0);
#else
    u_xlatb52 = _USE_UVMAP==1.0;
#endif
    if(u_xlatb52){
        u_xlat3.xw = texture(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_52 = texture(_LG_Tex, u_xlat3.xw).x;
    u_xlat16_3.x = texture(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat52 = u_xlat16_52 * u_xlat16_3.x;
    u_xlat52 = u_xlat52 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_82 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_3.x = texture(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat16_3.x * _RimNoise_Speed.w;
    u_xlat81 = u_xlat29.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(_Rim2_Threshold<u_xlat81);
#else
    u_xlatb81 = _Rim2_Threshold<u_xlat81;
#endif
    u_xlat20.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat20.z = vs_TEXCOORD7.z;
    u_xlat20.x = dot(u_xlat1.xyz, u_xlat20.xyz);
    u_xlat20.x = max(u_xlat20.x, 0.0);
    u_xlat20.x = (-u_xlat3.x) * u_xlat16_82 + u_xlat20.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat46.x = u_xlat20.x * -2.0 + 3.0;
    u_xlat20.x = u_xlat20.x * u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat46.x;
    u_xlat20.x = min(u_xlat20.x, 1.0);
    u_xlat25.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat25.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat25.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat16_82 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat27;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat46.xyz = (bool(u_xlatb81)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat27 = (u_xlatb81) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat29.x = (u_xlatb81) ? u_xlat20.x : u_xlat1.x;
    u_xlat16_3.xyz = texture(_Rim_Ramp, u_xlat29.xy).xyz;
    u_xlat1.x = u_xlat27 * u_xlat16_5.y;
    u_xlat1.xyz = u_xlat16_3.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb3 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb3){
        u_xlat16_3.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat25.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat25.xyz = u_xlat16_3.xyz * u_xlat25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat16_3.xyz * u_xlat25.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat22.xyz = u_xlat1.www * u_xlat23.xyz + u_xlat22.xyz;
    u_xlat22.xyz = u_xlat22.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat22.xyz * vec3(u_xlat78) + u_xlat21.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat24.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat46.xyz + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat52) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xzw + u_xlat3.xyz;
    u_xlat16_10.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_10.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
lowp vec4 u_xlat10_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec4 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec4 u_xlat24;
vec3 u_xlat25;
float u_xlat27;
vec2 u_xlat29;
mediump float u_xlat16_36;
vec3 u_xlat46;
float u_xlat52;
lowp float u_xlat10_52;
bool u_xlatb52;
float u_xlat56;
lowp float u_xlat10_56;
bool u_xlatb56;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_64;
mediump vec2 u_xlat16_65;
mediump vec2 u_xlat16_69;
float u_xlat78;
float u_xlat79;
mediump float u_xlat16_80;
float u_xlat81;
bool u_xlatb81;
float u_xlat82;
lowp float u_xlat10_82;
mediump float u_xlat16_88;
float u_xlat98;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_80 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_2.xyz = vec3(u_xlat16_80) * u_xlat16_2.xyz;
    u_xlat52 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat78 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
    u_xlat79 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat79 = max(u_xlat79, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat29.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_5.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat81 = (-u_xlat10_5.x) + 1.0;
    u_xlat81 = u_xlat81 * _AO_Intensity;
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlatb56 = _ShadowBias.z!=0.0;
    u_xlat82 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat6.xyz = vec3(u_xlat82) * _WorldSpaceLightPos0.xyz;
    u_xlat82 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
    u_xlat82 = (-u_xlat82) * u_xlat82 + 1.0;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 * _ShadowBias.z;
    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat82) + vs_TEXCOORD2.xyz;
    u_xlat6.xyz = (bool(u_xlatb56)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat8;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat9;
    u_xlat7 = u_xlat6.yyyy * u_xlat7;
    u_xlat2 = u_xlat2 * u_xlat6.xxxx + u_xlat7;
    u_xlat2 = u_xlat8 * u_xlat6.zzzz + u_xlat2;
    u_xlat2 = u_xlat9 + u_xlat2;
    u_xlat56 = _ShadowBias.x / u_xlat2.w;
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
    u_xlat56 = u_xlat2.z + (-u_xlat56);
    u_xlat82 = max((-u_xlat2.w), u_xlat56);
    u_xlat82 = (-u_xlat56) + u_xlat82;
    u_xlat2.z = _ShadowBias.y * u_xlat82 + u_xlat56;
    u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_10.x = (-_ShadowBias.w) + 1.0;
    u_xlatb56 = _softShadowQuality==1.0;
    if(u_xlatb56){
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat2.xyw + u_xlat6.xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_36 = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb56 = _softShadowQuality==2.0;
        if(u_xlatb56){
            u_xlat16_62.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_62.xy = floor(u_xlat16_62.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_62.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_63.xy = u_xlat16_7.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_12.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_64.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_13.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_13.xy = (-u_xlat16_13.xy) * u_xlat16_13.xy + u_xlat16_64.xy;
            u_xlat16_11.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_6.yw;
            u_xlat16_13.xy = u_xlat16_13.xy + vec2(1.0, 1.0);
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_7.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_64.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_13.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_12.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_6.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_7.z = u_xlat16_9.x;
            u_xlat16_7.w = u_xlat16_11.x;
            u_xlat16_8.z = u_xlat16_12.x;
            u_xlat16_8.w = u_xlat16_63.x;
            u_xlat16_6 = u_xlat16_7.zwxz + u_xlat16_8.zwxz;
            u_xlat16_9.z = u_xlat16_7.y;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_12.z = u_xlat16_8.y;
            u_xlat16_12.w = u_xlat16_63.y;
            u_xlat16_11.xyz = u_xlat16_9.zyw + u_xlat16_12.zyw;
            u_xlat16_13.xyz = u_xlat16_8.xzw / u_xlat16_6.zwy;
            u_xlat16_13.xyz = u_xlat16_13.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_12.xyz = u_xlat16_12.zyw / u_xlat16_11.xyz;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_7.xyz = u_xlat16_13.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_8.xyz = u_xlat16_12.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_7.w = u_xlat16_8.x;
            u_xlat16_9 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.ywxw;
            u_xlat16_12.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.zw;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_7.yw = u_xlat16_8.yz;
            u_xlat16_13 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_8 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.wywz;
            u_xlat16_7 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xwzw;
            u_xlat16_14 = u_xlat16_6.zwyz * u_xlat16_11.xxxy;
            u_xlat16_15 = u_xlat16_6 * u_xlat16_11.yyzz;
            u_xlat16_62.x = u_xlat16_6.y * u_xlat16_11.z;
            vec3 txVec4 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_82 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_88 = u_xlat10_82 * u_xlat16_14.y;
            u_xlat16_88 = u_xlat16_14.x * u_xlat10_56 + u_xlat16_88;
            vec3 txVec6 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_88 = u_xlat16_14.z * u_xlat10_56 + u_xlat16_88;
            vec3 txVec7 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_88 = u_xlat16_14.w * u_xlat10_56 + u_xlat16_88;
            vec3 txVec8 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_88 = u_xlat16_15.x * u_xlat10_56 + u_xlat16_88;
            vec3 txVec9 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_88 = u_xlat16_15.y * u_xlat10_56 + u_xlat16_88;
            vec3 txVec10 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_88 = u_xlat16_15.z * u_xlat10_56 + u_xlat16_88;
            vec3 txVec11 = vec3(u_xlat16_7.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_88 = u_xlat16_15.w * u_xlat10_56 + u_xlat16_88;
            vec3 txVec12 = vec3(u_xlat16_7.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_36 = u_xlat16_62.x * u_xlat10_56 + u_xlat16_88;
        } else {
            u_xlat16_62.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_62.xy = floor(u_xlat16_62.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_62.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_8.yw = u_xlat16_7.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_63.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_12.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_64.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_64.xy) * u_xlat16_64.xy + u_xlat16_12.xy;
            u_xlat16_64.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.zw = (-u_xlat16_64.xy) * u_xlat16_64.xy + u_xlat16_6.yw;
            u_xlat16_12 = u_xlat16_12 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_6.z = u_xlat16_12.z * 0.0816320032;
            u_xlat16_7.xy = u_xlat16_63.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_63.xy = u_xlat16_12.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_7.z = u_xlat16_12.w * 0.0816320032;
            u_xlat16_6.x = u_xlat16_7.y;
            u_xlat16_6.yw = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_9.xz = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_9.y = u_xlat16_63.x;
            u_xlat16_9.w = u_xlat16_8.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_9;
            u_xlat16_7.yw = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_63.y;
            u_xlat16_7 = u_xlat16_7 + u_xlat16_8;
            u_xlat16_9 = u_xlat16_9 / u_xlat16_6;
            u_xlat16_9 = u_xlat16_9 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8 / u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_9 = u_xlat16_9.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_8 = u_xlat16_8.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_11.xzw = u_xlat16_9.yzw;
            u_xlat16_11.y = u_xlat16_8.x;
            u_xlat16_12 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_13.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.y = u_xlat16_11.y;
            u_xlat16_11.y = u_xlat16_8.z;
            u_xlat16_14 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_65.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.z = u_xlat16_11.y;
            u_xlat16_15 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyxz;
            u_xlat16_11.y = u_xlat16_8.w;
            u_xlat16_16 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_17.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_69.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.xw;
            u_xlat16_8.xzw = u_xlat16_11.xzw;
            u_xlat16_11 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_18.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_8.x = u_xlat16_9.x;
            u_xlat16_62.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xy;
            u_xlat16_8 = u_xlat16_6 * u_xlat16_7.xxxx;
            u_xlat16_9 = u_xlat16_6 * u_xlat16_7.yyyy;
            u_xlat16_19 = u_xlat16_6 * u_xlat16_7.zzzz;
            u_xlat16_6 = u_xlat16_6 * u_xlat16_7.wwww;
            vec3 txVec13 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_82 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_12.x = u_xlat10_82 * u_xlat16_8.y;
            u_xlat16_12.x = u_xlat16_8.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec15 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_12.x = u_xlat16_8.z * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec16 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_12.x = u_xlat16_8.w * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec17 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_12.x = u_xlat16_9.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec18 = vec3(u_xlat16_14.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_12.x = u_xlat16_9.y * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec19 = vec3(u_xlat16_65.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_12.x = u_xlat16_9.z * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec20 = vec3(u_xlat16_15.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_12.x = u_xlat16_9.w * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec21 = vec3(u_xlat16_16.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_12.x = u_xlat16_19.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec22 = vec3(u_xlat16_16.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_12.x = u_xlat16_19.y * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec23 = vec3(u_xlat16_17.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_12.x = u_xlat16_19.z * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec24 = vec3(u_xlat16_69.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_12.x = u_xlat16_19.w * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec25 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_11.x = u_xlat16_6.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec26 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_11.x = u_xlat16_6.y * u_xlat10_56 + u_xlat16_11.x;
            vec3 txVec27 = vec3(u_xlat16_18.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_11.x = u_xlat16_6.z * u_xlat10_56 + u_xlat16_11.x;
            vec3 txVec28 = vec3(u_xlat16_62.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_36 = u_xlat16_6.w * u_xlat10_56 + u_xlat16_11.x;
        }
    }
    u_xlat16_62.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat16_36 * u_xlat16_62.x + u_xlat16_10.x;
    u_xlat20.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vs_TEXCOORD2.xyz;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56 = sqrt(u_xlat56);
    u_xlat82 = _Delta_ShadowCenter.w + 1.0;
    u_xlat56 = u_xlat82 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = min(u_xlat56, 1.0);
    u_xlat82 = (-u_xlat16_10.x) + 1.0;
    u_xlat82 = (-u_xlat82) * _ShadowIntensity + 1.0;
    u_xlat82 = max(u_xlat82, 0.0);
    u_xlat5.x = (-u_xlat56) + 1.0;
    u_xlat56 = u_xlat82 * u_xlat5.x + u_xlat56;
    u_xlat20.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat20.xyz = vec3(u_xlat56) * u_xlat20.xyz + _Shadow_Color.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat20.xyz) * u_xlat10_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat20.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat20.xyz = u_xlat10_2.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat21.xyz = u_xlat10_2.xyz * u_xlat20.xyz;
    u_xlat56 = (-u_xlat4.x) + 1.0;
    u_xlat22.xyz = u_xlat21.xyz * vec3(u_xlat56);
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = max(u_xlat79, 0.100000001);
    u_xlat82 = u_xlat4.y * u_xlat4.y;
    u_xlat98 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat79 = u_xlat79 * u_xlat98;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat82 = u_xlat82 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat82 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat79 = u_xlat79 * u_xlat3.x;
    u_xlat79 = u_xlat82 / u_xlat79;
    u_xlat79 = u_xlat79 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat79, 0.0);
    u_xlat20.xyz = u_xlat10_2.xyz * u_xlat20.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat23.xyz = u_xlat4.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = vec3(u_xlat56) * _Ambient_Color.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat24.xyz;
    u_xlat21.xyz = vec3(u_xlat81) * u_xlat21.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat24.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_6 = textureCubeLodEXT(_Cubemap, u_xlat24.xyz, u_xlat3.x);
    u_xlat24.xzw = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xzw = u_xlat10_6.xyz * u_xlat24.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xzw = u_xlat10_6.xyz * u_xlat24.xzw;
    u_xlat24.xzw = u_xlat10_6.www * u_xlat24.xzw;
    u_xlat24.xzw = vec3(u_xlat81) * u_xlat24.xzw;
    u_xlat3.x = u_xlat24.y * 0.200000003 + 0.800000012;
    u_xlat24.xyz = u_xlat3.xxx * u_xlat24.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat81 = u_xlat10_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat20.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat81) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat52 = (-u_xlat52) + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat20.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat52) * u_xlat20.xyz + u_xlat4.xyz;
    u_xlatb52 = _USE_UVMAP==1.0;
    if(u_xlatb52){
        u_xlat3.xw = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_52 = texture2D(_LG_Tex, u_xlat3.xw).x;
    u_xlat10_3.x = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat52 = u_xlat10_52 * u_xlat10_3.x;
    u_xlat52 = u_xlat52 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_82 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3.x = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3.x * _RimNoise_Speed.w;
    u_xlat81 = u_xlat29.y * 255.0;
    u_xlatb81 = _Rim2_Threshold<u_xlat81;
    u_xlat20.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat20.z = vs_TEXCOORD7.z;
    u_xlat20.x = dot(u_xlat1.xyz, u_xlat20.xyz);
    u_xlat20.x = max(u_xlat20.x, 0.0);
    u_xlat20.x = (-u_xlat3.x) * u_xlat10_82 + u_xlat20.x;
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
    u_xlat46.x = u_xlat20.x * -2.0 + 3.0;
    u_xlat20.x = u_xlat20.x * u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat46.x;
    u_xlat20.x = min(u_xlat20.x, 1.0);
    u_xlat25.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat25.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat25.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat10_82 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat27 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat27;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat46.xyz = (bool(u_xlatb81)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat27 = (u_xlatb81) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat29.x = (u_xlatb81) ? u_xlat20.x : u_xlat1.x;
    u_xlat10_3.xyz = texture2D(_Rim_Ramp, u_xlat29.xy).xyz;
    u_xlat1.x = u_xlat27 * u_xlat10_5.y;
    u_xlat1.xyz = u_xlat10_3.xyz * u_xlat1.xxx;
    u_xlatb3 = _EMISSION_ON==1.0;
    if(u_xlatb3){
        u_xlat10_3.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat25.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat25.xyz = u_xlat10_3.xyz * u_xlat25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat10_3.xyz * u_xlat25.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat22.xyz = u_xlat1.www * u_xlat23.xyz + u_xlat22.xyz;
    u_xlat22.xyz = u_xlat22.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat22.xyz * vec3(u_xlat78) + u_xlat21.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat24.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat46.xyz + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat52) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xzw + u_xlat3.xyz;
    u_xlat16_10.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_10.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
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
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
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
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
lowp vec4 u_xlat10_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec4 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec4 u_xlat24;
vec3 u_xlat25;
float u_xlat27;
vec2 u_xlat29;
mediump float u_xlat16_36;
vec3 u_xlat46;
float u_xlat52;
lowp float u_xlat10_52;
bool u_xlatb52;
float u_xlat56;
lowp float u_xlat10_56;
bool u_xlatb56;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_64;
mediump vec2 u_xlat16_65;
mediump vec2 u_xlat16_69;
float u_xlat78;
float u_xlat79;
mediump float u_xlat16_80;
float u_xlat81;
bool u_xlatb81;
float u_xlat82;
lowp float u_xlat10_82;
mediump float u_xlat16_88;
float u_xlat98;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_80 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_2.xyz = vec3(u_xlat16_80) * u_xlat16_2.xyz;
    u_xlat52 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat78 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat78 = clamp(u_xlat78, 0.0, 1.0);
    u_xlat79 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat79 = max(u_xlat79, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat29.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_5.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat81 = (-u_xlat10_5.x) + 1.0;
    u_xlat81 = u_xlat81 * _AO_Intensity;
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlatb56 = _ShadowBias.z!=0.0;
    u_xlat82 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat82 = inversesqrt(u_xlat82);
    u_xlat6.xyz = vec3(u_xlat82) * _WorldSpaceLightPos0.xyz;
    u_xlat82 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
    u_xlat82 = (-u_xlat82) * u_xlat82 + 1.0;
    u_xlat82 = sqrt(u_xlat82);
    u_xlat82 = u_xlat82 * _ShadowBias.z;
    u_xlat6.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat82) + vs_TEXCOORD2.xyz;
    u_xlat6.xyz = (bool(u_xlatb56)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat8;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat9;
    u_xlat7 = u_xlat6.yyyy * u_xlat7;
    u_xlat2 = u_xlat2 * u_xlat6.xxxx + u_xlat7;
    u_xlat2 = u_xlat8 * u_xlat6.zzzz + u_xlat2;
    u_xlat2 = u_xlat9 + u_xlat2;
    u_xlat56 = _ShadowBias.x / u_xlat2.w;
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
    u_xlat56 = u_xlat2.z + (-u_xlat56);
    u_xlat82 = max((-u_xlat2.w), u_xlat56);
    u_xlat82 = (-u_xlat56) + u_xlat82;
    u_xlat2.z = _ShadowBias.y * u_xlat82 + u_xlat56;
    u_xlat6.xyz = u_xlat2.xyz / u_xlat2.www;
    u_xlat2.xyz = u_xlat6.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat2.w = max(u_xlat2.z, 9.99999975e-05);
    u_xlat16_10.x = (-_ShadowBias.w) + 1.0;
    u_xlatb56 = _softShadowQuality==1.0;
    if(u_xlatb56){
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat2.xyw + u_xlat6.xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat7.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat7.z = 0.0;
        u_xlat7.xyz = u_xlat2.xyw + u_xlat7.xyz;
        vec3 txVec3 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_36 = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb56 = _softShadowQuality==2.0;
        if(u_xlatb56){
            u_xlat16_62.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_62.xy = floor(u_xlat16_62.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_62.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_63.xy = u_xlat16_7.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_12.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_64.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_13.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_13.xy = (-u_xlat16_13.xy) * u_xlat16_13.xy + u_xlat16_64.xy;
            u_xlat16_11.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_6.yw;
            u_xlat16_13.xy = u_xlat16_13.xy + vec2(1.0, 1.0);
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_7.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_64.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_13.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_12.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_6.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_7.z = u_xlat16_9.x;
            u_xlat16_7.w = u_xlat16_11.x;
            u_xlat16_8.z = u_xlat16_12.x;
            u_xlat16_8.w = u_xlat16_63.x;
            u_xlat16_6 = u_xlat16_7.zwxz + u_xlat16_8.zwxz;
            u_xlat16_9.z = u_xlat16_7.y;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_12.z = u_xlat16_8.y;
            u_xlat16_12.w = u_xlat16_63.y;
            u_xlat16_11.xyz = u_xlat16_9.zyw + u_xlat16_12.zyw;
            u_xlat16_13.xyz = u_xlat16_8.xzw / u_xlat16_6.zwy;
            u_xlat16_13.xyz = u_xlat16_13.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_12.xyz = u_xlat16_12.zyw / u_xlat16_11.xyz;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_7.xyz = u_xlat16_13.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_8.xyz = u_xlat16_12.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_7.w = u_xlat16_8.x;
            u_xlat16_9 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.ywxw;
            u_xlat16_12.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.zw;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_7.yw = u_xlat16_8.yz;
            u_xlat16_13 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_8 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.wywz;
            u_xlat16_7 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xwzw;
            u_xlat16_14 = u_xlat16_6.zwyz * u_xlat16_11.xxxy;
            u_xlat16_15 = u_xlat16_6 * u_xlat16_11.yyzz;
            u_xlat16_62.x = u_xlat16_6.y * u_xlat16_11.z;
            vec3 txVec4 = vec3(u_xlat16_9.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_9.zw,u_xlat2.w);
            u_xlat10_82 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_88 = u_xlat10_82 * u_xlat16_14.y;
            u_xlat16_88 = u_xlat16_14.x * u_xlat10_56 + u_xlat16_88;
            vec3 txVec6 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_88 = u_xlat16_14.z * u_xlat10_56 + u_xlat16_88;
            vec3 txVec7 = vec3(u_xlat16_8.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_88 = u_xlat16_14.w * u_xlat10_56 + u_xlat16_88;
            vec3 txVec8 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_88 = u_xlat16_15.x * u_xlat10_56 + u_xlat16_88;
            vec3 txVec9 = vec3(u_xlat16_13.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_88 = u_xlat16_15.y * u_xlat10_56 + u_xlat16_88;
            vec3 txVec10 = vec3(u_xlat16_8.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_88 = u_xlat16_15.z * u_xlat10_56 + u_xlat16_88;
            vec3 txVec11 = vec3(u_xlat16_7.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_88 = u_xlat16_15.w * u_xlat10_56 + u_xlat16_88;
            vec3 txVec12 = vec3(u_xlat16_7.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_36 = u_xlat16_62.x * u_xlat10_56 + u_xlat16_88;
        } else {
            u_xlat16_62.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_62.xy = floor(u_xlat16_62.xy);
            u_xlat16_11.xy = u_xlat2.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_62.xy);
            u_xlat16_6 = u_xlat16_11.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_7 = u_xlat16_6.xxzz * u_xlat16_6.xxzz;
            u_xlat16_8.yw = u_xlat16_7.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_63.xy = u_xlat16_7.xz * vec2(0.5, 0.5) + (-u_xlat16_11.xy);
            u_xlat16_12.xy = (-u_xlat16_11.xy) + vec2(1.0, 1.0);
            u_xlat16_64.xy = min(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_64.xy) * u_xlat16_64.xy + u_xlat16_12.xy;
            u_xlat16_64.xy = max(u_xlat16_11.xy, vec2(0.0, 0.0));
            u_xlat16_12.zw = (-u_xlat16_64.xy) * u_xlat16_64.xy + u_xlat16_6.yw;
            u_xlat16_12 = u_xlat16_12 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_6.z = u_xlat16_12.z * 0.0816320032;
            u_xlat16_7.xy = u_xlat16_63.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_63.xy = u_xlat16_12.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_7.z = u_xlat16_12.w * 0.0816320032;
            u_xlat16_6.x = u_xlat16_7.y;
            u_xlat16_6.yw = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_9.xz = u_xlat16_11.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_9.y = u_xlat16_63.x;
            u_xlat16_9.w = u_xlat16_8.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_9;
            u_xlat16_7.yw = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_11.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_63.y;
            u_xlat16_7 = u_xlat16_7 + u_xlat16_8;
            u_xlat16_9 = u_xlat16_9 / u_xlat16_6;
            u_xlat16_9 = u_xlat16_9 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8 / u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_9 = u_xlat16_9.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_8 = u_xlat16_8.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_11.xzw = u_xlat16_9.yzw;
            u_xlat16_11.y = u_xlat16_8.x;
            u_xlat16_12 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_13.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.y = u_xlat16_11.y;
            u_xlat16_11.y = u_xlat16_8.z;
            u_xlat16_14 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_65.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.z = u_xlat16_11.y;
            u_xlat16_15 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyxz;
            u_xlat16_11.y = u_xlat16_8.w;
            u_xlat16_16 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_11.xyzy;
            u_xlat16_17.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_11.wy;
            u_xlat16_9.w = u_xlat16_11.y;
            u_xlat16_69.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.xw;
            u_xlat16_8.xzw = u_xlat16_11.xzw;
            u_xlat16_11 = u_xlat16_62.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_18.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_8.x = u_xlat16_9.x;
            u_xlat16_62.xy = u_xlat16_62.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xy;
            u_xlat16_8 = u_xlat16_6 * u_xlat16_7.xxxx;
            u_xlat16_9 = u_xlat16_6 * u_xlat16_7.yyyy;
            u_xlat16_19 = u_xlat16_6 * u_xlat16_7.zzzz;
            u_xlat16_6 = u_xlat16_6 * u_xlat16_7.wwww;
            vec3 txVec13 = vec3(u_xlat16_12.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_12.zw,u_xlat2.w);
            u_xlat10_82 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_12.x = u_xlat10_82 * u_xlat16_8.y;
            u_xlat16_12.x = u_xlat16_8.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec15 = vec3(u_xlat16_13.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_12.x = u_xlat16_8.z * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec16 = vec3(u_xlat16_15.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_12.x = u_xlat16_8.w * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec17 = vec3(u_xlat16_14.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_12.x = u_xlat16_9.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec18 = vec3(u_xlat16_14.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_12.x = u_xlat16_9.y * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec19 = vec3(u_xlat16_65.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_12.x = u_xlat16_9.z * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec20 = vec3(u_xlat16_15.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_12.x = u_xlat16_9.w * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec21 = vec3(u_xlat16_16.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_12.x = u_xlat16_19.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec22 = vec3(u_xlat16_16.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_12.x = u_xlat16_19.y * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec23 = vec3(u_xlat16_17.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_12.x = u_xlat16_19.z * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec24 = vec3(u_xlat16_69.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_12.x = u_xlat16_19.w * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec25 = vec3(u_xlat16_11.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_11.x = u_xlat16_6.x * u_xlat10_56 + u_xlat16_12.x;
            vec3 txVec26 = vec3(u_xlat16_11.zw,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_11.x = u_xlat16_6.y * u_xlat10_56 + u_xlat16_11.x;
            vec3 txVec27 = vec3(u_xlat16_18.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_11.x = u_xlat16_6.z * u_xlat10_56 + u_xlat16_11.x;
            vec3 txVec28 = vec3(u_xlat16_62.xy,u_xlat2.w);
            u_xlat10_56 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_36 = u_xlat16_6.w * u_xlat10_56 + u_xlat16_11.x;
        }
    }
    u_xlat16_62.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = u_xlat16_36 * u_xlat16_62.x + u_xlat16_10.x;
    u_xlat20.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vs_TEXCOORD2.xyz;
    u_xlat56 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56 = sqrt(u_xlat56);
    u_xlat82 = _Delta_ShadowCenter.w + 1.0;
    u_xlat56 = u_xlat82 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = min(u_xlat56, 1.0);
    u_xlat82 = (-u_xlat16_10.x) + 1.0;
    u_xlat82 = (-u_xlat82) * _ShadowIntensity + 1.0;
    u_xlat82 = max(u_xlat82, 0.0);
    u_xlat5.x = (-u_xlat56) + 1.0;
    u_xlat56 = u_xlat82 * u_xlat5.x + u_xlat56;
    u_xlat20.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat20.xyz = vec3(u_xlat56) * u_xlat20.xyz + _Shadow_Color.xyz;
    u_xlat20.xyz = (-u_xlat20.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xzw = (-u_xlat20.xyz) * u_xlat10_5.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat20.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat20.xyz = u_xlat10_2.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat21.xyz = u_xlat10_2.xyz * u_xlat20.xyz;
    u_xlat56 = (-u_xlat4.x) + 1.0;
    u_xlat22.xyz = u_xlat21.xyz * vec3(u_xlat56);
    u_xlat79 = u_xlat79 * u_xlat79;
    u_xlat79 = max(u_xlat79, 0.100000001);
    u_xlat82 = u_xlat4.y * u_xlat4.y;
    u_xlat98 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat79 = u_xlat79 * u_xlat98;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat82 = u_xlat82 * u_xlat4.y;
    u_xlat3.x = u_xlat3.x * u_xlat82 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat79 = u_xlat79 * u_xlat3.x;
    u_xlat79 = u_xlat82 / u_xlat79;
    u_xlat79 = u_xlat79 * 0.25 + -9.99999975e-06;
    u_xlat1.w = max(u_xlat79, 0.0);
    u_xlat20.xyz = u_xlat10_2.xyz * u_xlat20.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat23.xyz = u_xlat4.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = vec3(u_xlat56) * _Ambient_Color.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat24.xyz;
    u_xlat21.xyz = vec3(u_xlat81) * u_xlat21.xyz;
    u_xlat3.x = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat24.xyz = u_xlat1.xyz * (-u_xlat3.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat3.x = u_xlat4.y * 8.0;
    u_xlat10_6 = textureCubeLodEXT(_Cubemap, u_xlat24.xyz, u_xlat3.x);
    u_xlat24.xzw = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xzw = u_xlat10_6.xyz * u_xlat24.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xzw = u_xlat10_6.xyz * u_xlat24.xzw;
    u_xlat24.xzw = u_xlat10_6.www * u_xlat24.xzw;
    u_xlat24.xzw = vec3(u_xlat81) * u_xlat24.xzw;
    u_xlat3.x = u_xlat24.y * 0.200000003 + 0.800000012;
    u_xlat24.xyz = u_xlat3.xxx * u_xlat24.xzw;
    u_xlat3.x = (-u_xlat4.y) + u_xlat4.x;
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat81 = u_xlat10_2.w * _Alpha;
    u_xlat4.xzw = u_xlat4.xxx * u_xlat20.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat4.xzw = vec3(u_xlat81) * u_xlat4.xzw + vec3(1.0, 1.0, 1.0);
    u_xlat52 = (-u_xlat52) + 1.0;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat52 = u_xlat52 * u_xlat52;
    u_xlat20.xyz = u_xlat3.xxx + (-u_xlat4.xzw);
    u_xlat3.x = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xzw;
    u_xlat4.xyz = vec3(u_xlat52) * u_xlat20.xyz + u_xlat4.xyz;
    u_xlatb52 = _USE_UVMAP==1.0;
    if(u_xlatb52){
        u_xlat3.xw = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat3.xw = vs_TEXCOORD0.zw;
    }
    u_xlat3.xw = _Time.yy * _LG_Speed.xy + u_xlat3.xw;
    u_xlat3.xw = u_xlat3.xw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_52 = texture2D(_LG_Tex, u_xlat3.xw).x;
    u_xlat10_3.x = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat52 = u_xlat10_52 * u_xlat10_3.x;
    u_xlat52 = u_xlat52 * _LG_Speed.w;
    u_xlat3.xw = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_82 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat3.xw = u_xlat3.xw * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_3.x = texture2D(_Rim_Tex, u_xlat3.xw).x;
    u_xlat3.x = u_xlat10_3.x * _RimNoise_Speed.w;
    u_xlat81 = u_xlat29.y * 255.0;
    u_xlatb81 = _Rim2_Threshold<u_xlat81;
    u_xlat20.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat20.z = vs_TEXCOORD7.z;
    u_xlat20.x = dot(u_xlat1.xyz, u_xlat20.xyz);
    u_xlat20.x = max(u_xlat20.x, 0.0);
    u_xlat20.x = (-u_xlat3.x) * u_xlat10_82 + u_xlat20.x;
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
    u_xlat46.x = u_xlat20.x * -2.0 + 3.0;
    u_xlat20.x = u_xlat20.x * u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat46.x;
    u_xlat20.x = min(u_xlat20.x, 1.0);
    u_xlat25.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat25.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat25.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat3.x) * u_xlat10_82 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat27 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat27;
    u_xlat1.xw = min(u_xlat1.xw, vec2(1.0, 20.0));
    u_xlat46.xyz = (bool(u_xlatb81)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat27 = (u_xlatb81) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat29.x = (u_xlatb81) ? u_xlat20.x : u_xlat1.x;
    u_xlat10_3.xyz = texture2D(_Rim_Ramp, u_xlat29.xy).xyz;
    u_xlat1.x = u_xlat27 * u_xlat10_5.y;
    u_xlat1.xyz = u_xlat10_3.xyz * u_xlat1.xxx;
    u_xlatb3 = _EMISSION_ON==1.0;
    if(u_xlatb3){
        u_xlat10_3.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat25.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat25.xyz = u_xlat10_3.xyz * u_xlat25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat3.xyz = u_xlat10_3.xyz * u_xlat25.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat3.xyz = (-u_xlat3.xyz) * abs(u_xlat0.xxx) + u_xlat3.xyz;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
        u_xlat3.z = float(0.0);
    }
    u_xlat22.xyz = u_xlat1.www * u_xlat23.xyz + u_xlat22.xyz;
    u_xlat22.xyz = u_xlat22.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyw = u_xlat22.xyz * vec3(u_xlat78) + u_xlat21.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat24.xyz;
    u_xlat0.xyw = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat46.xyz + u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat52) * _LG_Color.xyz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xzw + u_xlat3.xyz;
    u_xlat16_10.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_10.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
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
Keywords { "DIRECTIONAL" "MODE_UNITY" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
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
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 99201
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